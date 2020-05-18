unit Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.ExtCtrls, Vcl.Controls,
  VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, WEBLib.WebCtrls, WEBLib.FlexControls,
  VCL.TMSFNCPanel, Vcl.StdCtrls, WEBLib.StdCtrls, VCL.TMSFNCChart,
  VCL.TMSFNCGoogleMaps, WEBLib.Storage, WEBLib.WebSocketClient,
  VCL.TMSFNCGridCell, VCL.TMSFNCGridOptions, VCL.TMSFNCCustomScrollControl,
  VCL.TMSFNCGridData, VCL.TMSFNCCustomGrid, VCL.TMSFNCGrid,
  VCL.TMSFNCWidgetLCDLabel, WEBLib.REST, WEBLib.Graphics;

type TFlight = record
    LastPositionAt: TDateTime;
    AircraftID:     LongWord;
  	Latitude:       Single;
    Longitude:      Single;
    Altitude:       Single;
  	Speed:          Integer;
    Heading:        Integer;
    Distance:       Single;
    PositionCount:  Integer;
    MarkerCreated:  Boolean;
    MarkerHeading:  Integer;
    Tail:           String;
    Model:          String;
    Callsign:       String;
    LookupFlight:   Boolean;
    UpdateMap:      Boolean;
    UpdateHighlight: Boolean;
end;

type
  TfrmMain = class(TWebForm)
    pnlLeft: TWebPanel;
    pnlTop: TWebPanel;
    WebSplitter2: TWebSplitter;
    pnlCentre: TWebPanel;
    pnlCentreTop: TWebPanel;
    pnlUTC: TWebPanel;
    pnlServerStatus1: TWebPanel;
    pnlTitle: TWebPanel;
    tmrLoad: TWebTimer;
    GMap: TWebGoogleMaps;
    WebSocketClient1: TWebSocketClient;
    tmrReconnect: TWebTimer;
    pnlServerStatus: TWebPanel;
    lblLongitude: TTMSFNCWidgetLCDLabel;
    lblTime: TTMSFNCWidgetLCDLabel;
    WebPanel1: TWebPanel;
    WebPanel2: TWebPanel;
    WebPanel3: TWebPanel;
    lblLatitude: TTMSFNCWidgetLCDLabel;
    WebPanel4: TWebPanel;
    lblAltitude: TTMSFNCWidgetLCDLabel;
    lblSats: TTMSFNCWidgetLCDLabel;
    WebPanel5: TWebPanel;
    WebRESTClient1: TWebRESTClient;
    TMSFNCPanel3: TTMSFNCPanel;
    grdFlights: TTMSFNCGrid;
    lblFurthest: TWebPanel;
    lblActive: TWebPanel;
    lblSeen: TWebPanel;
    WebSplitter1: TWebSplitter;
    WebBrowserControl1: TWebBrowserControl;
    tmrMap: TWebTimer;
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebFormShow(Sender: TObject);
    procedure WebSplitter4Moved(Sender: TObject);
    procedure tmrLoadTimer(Sender: TObject);
    procedure tmrReconnectTimer(Sender: TObject);
    procedure WebSocketClient1Connect(Sender: TObject);
    procedure WebSocketClient1DataReceived(Sender: TObject; Origin: string;
      Data: TJSObject);
    procedure WebSocketClient1Disconnect(Sender: TObject);
    procedure GMapMapLoaded(Sender: TObject);
    procedure grdFlightsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var Allow: Boolean);
    procedure WebRESTClient1Response(Sender: TObject; AResponse: string);
    procedure GMapMarkerClick(Sender: TObject; AIndex: Integer;
      AMarker: TJSObject);
    procedure WebRESTClient1Error(Sender: TObject; ARequest: TJSXMLHttpRequest;
      Event: TEventListenerEvent; var Handled: Boolean);
    procedure GMapMapIdle(Sender: TObject);
    procedure tmrMapTimer(Sender: TObject);
    procedure grdFlightsGetCellLayout(Sender: TObject; ACol, ARow: Integer;
      ALayout: TTMSFNCGridCellLayout; ACellState: TTMSFNCGridCellState);
  private
    { Private declarations }
    CanUpdateMap: Boolean;
    ConnectedToServer: Boolean;
    Flights: Array[1..200] of TFlight;
    FlightCount: Integer;
    BalloonMarkerCreated: Boolean;
    LookingForFlight, SelectedFlight: Integer;
    procedure LoadPanelPositions;
    procedure SavePanelPositions;
//    procedure WriteToLog(Msg: String);
    procedure ProcessLine(Line: String);
    function FindOldFlight: Integer;
    function AddOrReplaceFlight(AircraftID: LongWord): Integer;
    function FindFlight(AircraftID: LongWord): Integer;
    function AddOrFindFlight(AircraftID: LongWord): Integer;
    procedure UpdateFlight(FlightIndex: Integer);
    procedure LookupNextFlight;
    function MarkerURI(FlightIndex: Integer): String;
  public
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

// IF THE FOLLOWING LINE GIVES AN ERROR

{$INCLUDE 'key.pas'}

(* THEN CREATE A FILE key.pas CONTAINING:

const GoogleMapsAPIKey = '<YOUR_GOOGLE_API_KEY>';

THIS FILE IS SPECIFICALLY EXCLUDED in .gitignore TO AVOID SHARING API KEYS
*)


procedure TfrmMain.WebFormClose(Sender: TObject; var Action: TCloseAction);
begin
    SavePanelPositions;
end;

procedure TfrmMain.WebFormCreate(Sender: TObject);
begin
    GMap.APIKey := GoogleMapsAPIKey;

    grdFlights.Cells[0, 0] := 'ID';
    grdFlights.Cells[1, 0] := 'LAT';
    grdFlights.Cells[2, 0] := 'LON';
    grdFlights.Cells[3, 0] := 'ALT';
    grdFlights.Cells[4, 0] := 'SPD';
    grdFlights.Cells[5, 0] := 'HEAD';
    grdFlights.Cells[6, 0] := 'DIST';
    grdFlights.Cells[7, 0] := 'PKTS';
    grdFlights.Cells[8, 0] := 'TAIL';
    grdFlights.Cells[9, 0] := 'MODEL';
    grdFlights.Cells[10, 0] := 'CALL';
end;

procedure TfrmMain.WebFormShow(Sender: TObject);
begin
    LoadPanelPositions;
    tmrLoad.Enabled := True;
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True;
   ListOfStrings.DelimitedText   := Str;
end;

procedure TfrmMain.WebRESTClient1Error(Sender: TObject;
  ARequest: TJSXMLHttpRequest; Event: TEventListenerEvent;
  var Handled: Boolean);
begin
    LookingForFlight := 0;
    LookupNextFlight;
end;

procedure TfrmMain.WebRESTClient1Response(Sender: TObject; AResponse: string);
var
    Temp: String;
    Position: Integer;
begin
    try
        //    {"time":1589542240,"states":[["c02cf1","ACA857  ","Canada",1589542240,1589542240,-1.8922,51.6537,7894.32,false,218.65,288.95,11.38,null,7985.76,"7731",false,0]]}
        Position := Pos('[[', AResponse);
        if Position > 0 then begin
            Temp := Copy(AResponse, Position+3, Length(AResponse));
            // a97655","DAL3341 ","United States",1589540264,1589540270,-13.3342,55.5497,11277.6,false,214.19,296.38,0,null,11338.56,"2556",false,0]]}
            Position := Pos('","', Temp);
            if Position > 0 then begin
                Temp := Copy(Temp, Position+3, Length(Temp));
                // DAL3341 ","United States",1589540264,1589540270,-13.3342,55.5497,11277.6,false,214.19,296.38,0,null,11338.56,"2556",false,0]]}
                Position := Pos('"', Temp);
                if Position > 0 then begin
                    Flights[LookingForFlight].Callsign := TrimRight(Copy(Temp, 1, Position-1));
                    grdFlights.Cells[10, LookingForFlight] := Flights[LookingForFlight].Callsign;
                end;
            end;
        end;
    finally
        LookingForFlight := 0;
        LookupNextFlight;
    end;
end;

procedure TfrmMain.WebSocketClient1Connect(Sender: TObject);
begin
    ConnectedToServer := True;
    pnlServerStatus.Caption := 'SERVER CONNECTED';

//    WriteToLog('Connected');

    // WebSocketClient1.Send('PAYLOADS:' + PayloadID + ',XX');
    // WebSocketClient1.Send('PAYLOADS:' + PayloadIDs + ',M0RPI_Chase,OnFoot_Chase');
end;

procedure TfrmMain.WebSocketClient1DataReceived(Sender: TObject; Origin: string;
  Data: TJSObject);
var
    s: String;
begin
    s := Data.toString;

    ProcessLine(s);
end;

procedure TfrmMain.WebSocketClient1Disconnect(Sender: TObject);
begin
    ConnectedToServer := False;
    pnlServerStatus.Caption := 'SERVER DISCONNECTED';

//    WriteToLog('Disconnected');

    tmrReconnect.Enabled := True;
end;

procedure TfrmMain.WebSplitter4Moved(Sender: TObject);
begin
    SavePanelPositions;
end;

procedure TfrmMain.LoadPanelPositions;
var
    Settings: TLocalStorage;
begin
    Settings := TLocalStorage.Create;
    if Settings.GetValue('pnlLeft.Width') <> '' then begin
        pnlLeft.Width := StrToIntDef(Settings.GetValue('pnlLeft.Width'), pnlLeft.Width);
        WebBrowserControl1.Height := StrToIntDef(Settings.GetValue('WebBrowserControl1.Height'), WebBrowserControl1.Height);
    end;
    Settings.Free;
end;

procedure TfrmMain.SavePanelPositions;
var
    Settings: TLocalStorage;
begin
    Settings := TLocalStorage.Create;
    Settings.SetValue('pnlLeft.Width', IntToStr(pnlLeft.Width));
    Settings.SetValue('WebBrowserControl1.Height', IntToStr(WebBrowserControl1.Height));

    Settings.Free;
end;

procedure TfrmMain.tmrLoadTimer(Sender: TObject);
begin
    tmrLoad.Enabled := False;

    GMap.SetCenter(52,-2);
    GMap.Visible := True;
end;

function ChooseAircraftFromHeading(Heading: Integer): Integer;
begin
    Result := (Heading+22) div 45;

    if Result < 0 then Result := 0;
    if Result > 7 then Result := 7;
end;

procedure TfrmMain.tmrMapTimer(Sender: TObject);
var
    FlightIndex: Integer;
begin
    if CanUpdateMap and BalloonMarkerCreated then begin
        for FlightIndex := 1 to FlightCount do begin
            with Flights[FlightIndex] do begin
                if UpdateMap then begin
                    UpdateMap := False;
                    if MarkerCreated then begin
                        GMap.SetMarkerLocation(FlightIndex, Latitude, Longitude);
                        if UpdateHighlight or (MarkerHeading <> ChooseAircraftFromHeading(Heading)) then begin
                            MarkerHeading := ChooseAircraftFromHeading(Heading);
                            GMap.SetMarkerIcon(FlightIndex, MarkerURI(FlightIndex), 38, 38);
                            UpdateHighlight := False;
                        end;
                    end else begin
                        MarkerHeading := ChooseAircraftFromHeading(Heading);
                        GMap.AddMarker(Latitude, Longitude, MarkerURI(FlightIndex), IntToHex(AircraftID, 6), 38, 38);
                        // Here's the JS added to AddMarker to support XOffset,YOffset
                        // var pinImage = new google.maps.MarkerImage(PinIcon, null, null, new google.maps.Point(XOffset, YOffset));
                        MarkerCreated := True;
                    end;
                    Exit;
                end;
            end;
        end;
    end;
end;

procedure TfrmMain.tmrReconnectTimer(Sender: TObject);
begin
    tmrReconnect.Enabled := False;
//    WriteToLog('Connecting ...');
    WebSocketClient1.HostName := '192.168.1.175';   // 'hab.link';
    WebSocketClient1.Port := 8888;
    WebSocketClient1.Connect;
end;


//procedure TfrmMain.WriteToLog(Msg: String);
//begin
//    lstLog.ItemIndex := lstLog.Items.Add(Msg);
//end;

function GetCommand(Line: String; var Parameters: String): String;
var
    Position: Integer;
begin
    Position := Pos(':', Line);
    if Position > 0 then begin
        Result := Copy(Line, 1, Position-1);
        Parameters := Copy(Line, Position+1, Length(Line));
    end else begin
        Result := Line;
        Parameters := '';
    end;
end;

procedure TfrmMain.ProcessLine(Line: String);
const
    FIELDS_PER_FLIGHT = 10;
var
    Command, TimeStamp, Parameters: String;
    UTC: TDateTime;
    Altitude: Double;
    Fields: TStringList;
    Index, FlightCount, Start, FlightIndex: Integer;
    AircraftID: LongWord;
begin
    // lstDebug.ItemIndex := lstDebug.Items.Add(Line);

//    WriteToLog(Line);

    Command := GetCommand(Line, Parameters);

    if Command = 'SENTENCE' then begin
        Fields := TStringList.Create;
        try
            Split(',', Parameters, Fields);
            if Fields[0] = '$$ADSB' then begin
                // Balloon panel
//                lstBalloon.Items[0] := 'COUNTER = ' + Fields[1];
//                lstBalloon.Items[1] := 'UTC = ' + Fields[2];
//                lstBalloon.Items[2] := 'LATITUDE = ' + Fields[3];
//                lstBalloon.Items[3] := 'LONGITUDE = ' + Fields[4];
//                lstBalloon.Items[4] := 'ALTITUDE = ' + Fields[5] + ' m';
//                lstBalloon.Items[5] := 'SATELLITES = ' + Fields[6];
//                lstBalloon.Items[6] := 'ACTIVE AIRCRAFT = ' + Fields[7];
//                lstBalloon.Items[7] := 'TOTAL AIRCRAFT = ' + Fields[8];
//                lstBalloon.Items[8] := 'FURTHEST DISTANCE = ' + Fields[9] + ' km';

                // Header
                lblTime.Caption.TimeValue := EncodeTime(StrToIntDef(Copy(Fields[2], 1, 2), 0),
                                                        StrToIntDef(Copy(Fields[2], 4, 2), 0),
                                                        StrToIntDef(Copy(Fields[2], 7, 2), 0), 0);
                lblLatitude.Caption.Value := StrToFloat(Fields[3]);
                lblLongitude.Caption.Value := StrToFloat(Fields[4]);
                lblAltitude.Caption.Value := StrToFloat(Fields[5]);
                lblSats.Caption.Value := StrToIntDef(Fields[6], 0);

                // Aircraft Summary
                lblActive.Caption := 'Aircraft In Range: ' + Fields[7];
                lblSeen.Caption := 'Aircraft Seen: ' + Fields[8];
                lblFurthest.Caption := 'Furthest Aircraft: ' + Fields[9] + ' km';

                // Map
                if BalloonMarkerCreated then begin
                    GMap.SetMarkerLocation(0, StrToFloat(Fields[3]), StrToFloat(Fields[4]));
                end else begin
                    GMap.AddMarker(StrToFloat(Fields[3]), StrToFloat(Fields[4]), 'http://hab.link:8889/markers/balloon-red.png', 'ADSB');
                    BalloonMarkerCreated := True;
                end;
            end;
        finally
            Fields.Free;
        end;
    end else if Command = 'FLIGHTS' then begin
        Fields := TStringList.Create;
        try
            Split(',', Parameters, Fields);
            FlightCount := Fields.Count div FIELDS_PER_FLIGHT;
            for Index := 1 to FlightCount do begin
                Start := (Index-1) * FIELDS_PER_FLIGHT;

                AircraftID := StrToIntDef('$' + Fields[Start], 0);

                if AircraftID > 0 then begin
                    FlightIndex := AddOrFindFlight(AircraftID);
                    if FlightIndex > 0 then begin
                        with Flights[FlightIndex] do begin
                            Latitude := StrToFloat(Fields[Start+1]);
                            Longitude := StrToFloat(Fields[Start+2]);
                            Altitude := StrToFloat(Fields[Start+3]);
                            Speed := StrToIntDef(Fields[Start+4], 0);
                            Heading := StrToIntDef(Fields[Start+5], 0);
                            Distance := StrToFloat(Fields[Start+6]);
                            PositionCount := StrToIntDef(Fields[Start+7], 0);
                            Tail := Fields[Start+8];
                            Model := Fields[Start+9];
                            LastPositionAt := Now;
                            UpdateMap := True;
                        end;

//                        SetRowColour(FlightIndex);

                        UpdateFlight(FlightIndex);
                    end;
                end;
            end;
        finally
          Fields.Free;
        end;
    end;

    (*

    WriteLog(Line);

    if Command = 'POSITION' then begin
        // Balloon position
        WebListBox1.Items.Add(Line);
    end else if Command = 'CHASE' then begin
        // Chase car/person position
        WebListBox1.Items.Add(Line);
    end else if Command = 'MESSAGE' then begin
        WebListBox11.Items.Clear;
        WebListBox11.Items.Add(Parameters);
    end else if Command = 'L' then begin
        ProcessListeners(Copy(Line,3,Length(Line)));
    end;
    *)
end;

function TfrmMain.FindFlight(AircraftID: LongWord): Integer;
var
    i: Integer;
begin
    for i := 1 to FlightCount do begin
        if Flights[i].AircraftID = AircraftID then begin
            Result := i;
            exit;
        end;
    end;

    Result := -1;
end;

procedure TfrmMain.GMapMapIdle(Sender: TObject);
begin
    CanUpdateMap := True;
end;

procedure TfrmMain.GMapMapLoaded(Sender: TObject);
begin
    tmrReconnect.Enabled := True;
end;

procedure TfrmMain.GMapMarkerClick(Sender: TObject; AIndex: Integer;
  AMarker: TJSObject);
 var
    Allow: Boolean;
 begin
    if AIndex > 0 then begin
        grdFlightsSelectCell(nil, 0, AIndex, Allow);
    end;
end;

procedure TfrmMain.grdFlightsGetCellLayout(Sender: TObject; ACol, ARow: Integer;
  ALayout: TTMSFNCGridCellLayout; ACellState: TTMSFNCGridCellState);
begin
    if ARow >= 1 then begin
        if ARow = SelectedFlight  then begin
            ALayout.Font.Style := [fsBold];
        end;

        if Flights[ARow].LastPositionAt >= (Now - 60/86400) then begin
            ALayout.Fill.Color := clLime;
        end else if Flights[ARow].LastPositionAt >= (Now - 180/86400) then begin
            ALayout.Fill.Color := clYellow;
        end else begin
            ALayout.Fill.Color := gcOrange;
        end;
    end;
end;

procedure TfrmMain.grdFlightsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var Allow: Boolean);
var
    OldSelectedFlight: Integer;
begin
    // Show selected aircraft
    OldSelectedFlight := SelectedFlight;
    SelectedFlight := ARow;

    if OldSelectedFlight > 0 then begin
        Flights[OldSelectedFlight].UpdateMap := True;
        Flights[OldSelectedFlight].UpdateHighlight := True;
    end;

    Flights[SelectedFlight].UpdateMap := True;
    Flights[SelectedFlight].UpdateHighlight := True;

    if grdFlights.Cells[10, ARow] <> '' then begin
        WebBrowserControl1.Navigate('https://uk.flightaware.com/live/flight/' + grdFlights.Cells[10, ARow]);
        // WebBrowserControl1.Navigate('https://www.jetphotos.com/registration/' + grdFlights.Cells[8, ARow]);
        // WebBrowserControl1.Navigate('http://www.planelogger.com/Aircraft/Registration/' + grdFlights.Cells[8, ARow]);
    end;

    // https://opensky-network.org/api/states/all?icao24=a97655
    // {"time":1589536549,"states":[["a97655","DAL3341 ","United States",1589536549,1589536549,-2.0365,52.0759,11277.6,false,233.29,296.45,0,null,11308.08,"2556",false,0]]}
    // ID
    // Callsign DAL3341
    // Country: United States

    // https://flightaware.com/live/flight/DAL3341

    // https://opensky-network.org/api/flights/aircraft?icao24=3c675a&begin=1517184000&end=1517270400
    // [{"icao24":"3c675a","firstSeen":1517258040,"estDepartureAirport":"EDDF","lastSeen":1517263900,"estArrivalAirport":"ESSA","callsign":"DLH2VC  ","estDepartureAirportHorizDistance":1462,"estDepartureAirportVertDistance":49,"estArrivalAirportHorizDistance":7194,"estArrivalAirportVertDistance":423,"departureAirportCandidatesCount":1,"arrivalAirportCandidatesCount":3},
end;

function TfrmMain.FindOldFlight: Integer;
var
    FlightIndex: Integer;
begin
    for FlightIndex := 1 to FlightCount do begin
        if Flights[FlightIndex].LastPositionAt < (Now - 180/86400) then begin
            Result := FlightIndex;
            Exit;
        end;
    end;

    Result := -1;
end;

function TfrmMain.AddOrReplaceFlight(AircraftID: LongWord): Integer;
var
    FlightIndex: Integer;
begin
    FlightIndex := FindOldFlight;

    if FlightIndex < 0 then begin
        // No old flights to replace
        if FlightCount < 200 then begin
            // We can add one
            Inc(FlightCount);
            FlightIndex := FlightCount;
            grdFlights.RowCount := FlightCount+1;
        end;
    end;

    if FlightIndex > 0 then begin
        Flights[FlightIndex] := default(TFlight);
        Flights[FlightIndex].AircraftID := AircraftID;
        Flights[FlightIndex].LookupFlight := True;
        Result := FlightIndex;
        if LookingForFlight = 0 then begin
            LookupNextFlight;
        end;
    end else begin
        Result := -1;
    end;
end;


procedure TfrmMain.LookupNextFlight;
var
    i: Integer;
begin
    for i := Low(Flights) to High(Flights) do begin
        if (Flights[i].AircraftID <> 0) and Flights[i].LookupFlight then begin
            LookingForFlight := i;
            Flights[i].LookupFlight := False;
            try
                WebRESTClient1.HttpsGet('https://daveake:LockDown-135@opensky-network.org/api/states/all?icao24=' + LowerCase(IntToHex(Flights[i].AircraftID, 6)));
            finally
                // {"time":1589540264,"states":[["a97655","DAL3341 ","United States",1589540264,1589540270,-13.3342,55.5497,11277.6,false,214.19,296.38,0,null,11338.56,"2556",false,0]]}
                Exit;
            end;
        end;
    end;
end;

function TfrmMain.AddOrFindFlight(AircraftID: LongWord): Integer;
var
    Index: Integer;
begin
    Index := FindFlight(AircraftID);

    if Index < 0 then begin
        Index := AddOrReplaceFlight(AircraftID);
    end;

    Result := Index;
end;

function TfrmMain.MarkerURI(FlightIndex: Integer): String;
const
    Icons: Array[0..7] of String = ('n', 'ne', 'e', 'se', 's', 'sw', 'w', 'nw');
begin
    if FlightIndex = SelectedFlight then begin
        Result := 'http://hab.link:8889/markers/plane_' + Icons[Flights[FlightIndex].MarkerHeading] + '_s.png';
    end else begin
        Result := 'http://hab.link:8889/markers/plane_' + Icons[Flights[FlightIndex].MarkerHeading] + '.png';
    end;
end;


procedure TfrmMain.UpdateFlight(FlightIndex: Integer);
begin
    with Flights[FlightIndex] do begin
        grdFlights.Cells[0, FlightIndex] := IntToHex(AircraftID, 6);
        grdFlights.Cells[1, FlightIndex] := FormatFloat('0.0000', Latitude);
        grdFlights.Cells[2, FlightIndex] := FormatFloat('0.0000', Longitude);
        grdFlights.Cells[3, FlightIndex] := FormatFloat('0', Altitude);
        grdFlights.Cells[4, FlightIndex] := IntToStr(Speed);
        grdFlights.Cells[5, FlightIndex] := IntToStr(Heading);
        grdFlights.Cells[6, FlightIndex] := FormatFloat('0.0', Distance);
        grdFlights.Cells[7, FlightIndex] := IntToStr(PositionCount);
        if Tail <> '' then begin
            if grdFlights.Cells[8, FlightIndex] = '' then begin
                // grdFlights.Cells[8, FlightIndex] := '<a href="https://www.jetphotos.com/registration/' + Callsign + '">' + Callsign + '</a>';
                grdFlights.Cells[8, FlightIndex] := Tail;
                grdFlights.Cells[9, FlightIndex] := Model;
            end;
        end;
    end;
end;


end.

