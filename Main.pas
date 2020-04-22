unit Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.ExtCtrls, Vcl.Controls,
  VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, WEBLib.WebCtrls, WEBLib.FlexControls,
  VCL.TMSFNCPanel, Vcl.StdCtrls, WEBLib.StdCtrls, VCL.TMSFNCChart,
  VCL.TMSFNCGoogleMaps, WEBLib.Storage;

type
  TfrmMain = class(TWebForm)
    WebSplitter1: TWebSplitter;
    pnlLeft: TWebPanel;
    pnlTop: TWebPanel;
    WebSplitter2: TWebSplitter;
    pnlCentre: TWebPanel;
    pnlCentreBottom: TWebPanel;
    WebSplitter4: TWebSplitter;
    pnlCentreTop: TWebPanel;
    WebSplitter6: TWebSplitter;
    pnl3D: TWebPanel;
    pnlSSDV: TWebPanel;
    pnlYouTube: TWebPanel;
    WebSplitter7: TWebSplitter;
    pnlRight: TWebPanel;
    pnlUTC: TWebPanel;
    WebPanel15: TWebPanel;
    WebPanel18: TWebPanel;
    WebPanel19: TWebPanel;
    pnlServerStatus: TWebPanel;
    pnlTitle: TWebPanel;
    TMSFNCPanel1: TTMSFNCPanel;
    TMSFNCPanel2: TTMSFNCPanel;
    TMSFNCPanel3: TTMSFNCPanel;
    WebMemo1: TWebMemo;
    WebMemo2: TWebMemo;
    TMSFNCChart1: TTMSFNCChart;
    pnlMap: TWebPanel;
    WebSplitter3: TWebSplitter;
    WebSplitter5: TWebSplitter;
    GMap: TTMSFNCGoogleMaps;
    WebBrowserControl1: TWebBrowserControl;
    tmrLoad: TWebTimer;
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebFormShow(Sender: TObject);
    procedure WebSplitter4Moved(Sender: TObject);
    procedure tmrLoadTimer(Sender: TObject);
  private
    { Private declarations }
    procedure LoadPanelPositions;
    procedure SavePanelPositions;
    procedure SaveHomePosition(Latitude, Longitude: Double);
    procedure LoadMapHome;
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

    LoadMapHome;
    // FollowMode := fmInit;

    // OKToUpdateMap := True;
end;

procedure TfrmMain.WebFormShow(Sender: TObject);
begin
    LoadPanelPositions;
    tmrLoad.Enabled := True;
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
    if Settings.GetValue('pnlCentreBottom.Height') <> '' then begin
        pnlCentreBottom.Height := StrToIntDef(Settings.GetValue('pnlCentreBottom.Height'), pnlCentreBottom.Height);
        pnlSSDV.Width := StrToIntDef(Settings.GetValue('pnlSSDV.Width'), pnlSSDV.Width);
        pnlMap.Width := StrToIntDef(Settings.GetValue('pnlMap.Width'), pnlMap.Width);
        pnlLeft.Width := StrToIntDef(Settings.GetValue('pnlLeft.Width'), pnlLeft.Width);
    end else begin
        pnlCentreBottom.Height := pnlCentre.Height div 2;
        pnlSSDV.Width := pnlCentreBottom.Width div 2;
        pnlMap.Width := pnlCentreTop.Width div 2;
    end;
    Settings.Free;
end;

procedure TfrmMain.SavePanelPositions;
var
    Settings: TLocalStorage;
begin
    Settings := TLocalStorage.Create;
    Settings.SetValue('pnlCentreBottom.Height', IntToStr(pnlCentreBottom.Height));
    Settings.SetValue('pnlSSDV.Width', IntToStr(pnlSSDV.Width));
    Settings.SetValue('pnlMap.Width', IntToStr(pnlMap.Width));
    Settings.SetValue('pnlLeft.Width', IntToStr(pnlLeft.Width));
    Settings.Free;
end;

procedure TfrmMain.tmrLoadTimer(Sender: TObject);
begin
    tmrLoad.Enabled := False;

    GMap.SetCenterCoordinate(52,-2);
    GMap.Visible := True;
end;

procedure TfrmMain.SaveHomePosition(Latitude, Longitude: Double);
var
    Settings: TLocalStorage;
begin
    Settings := TLocalStorage.Create;
    Settings.SetValue('Home.Latitude', FormatFloat('0.00000', Latitude));
    Settings.SetValue('Home.Longitude', FormatFloat('0.00000', Longitude));
    Settings.Free;
end;

procedure TfrmMain.LoadMapHome;
var
    Settings: TLocalStorage;
begin
    Settings := TLocalStorage.Create;
    if (Settings.GetValue('Home.Latitude') <> '') and (Settings.GetValue('Home.Longitude') <> '') then begin
        GMap.Options.DefaultLatitude := StrToFloat(Settings.GetValue('Home.Latitude'));
        GMap.Options.DefaultLongitude := StrToFloat(Settings.GetValue('Home.Longitude'));
    end;
    Settings.Free;
end;


end.
