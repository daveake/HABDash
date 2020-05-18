object frmMain: TfrmMain
  Left = 0
  Top = 0
  Width = 1563
  Height = 812
  Caption = 'HAB ADSB Relay Dashboard'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  OnClose = WebFormClose
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object pnlLeft: TWebPanel
    Left = 1104
    Top = 60
    Width = 459
    Height = 752
    Align = alRight
    BorderColor = clSilver
    BorderStyle = bsSingle
    object TMSFNCPanel3: TTMSFNCPanel
      Left = 0
      Top = 0
      Width = 459
      Height = 752
      Align = alClient
      ParentDoubleBuffered = False
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Sections = <>
      SectionsAppearance.Font.Charset = DEFAULT_CHARSET
      SectionsAppearance.Font.Color = clWindowText
      SectionsAppearance.Font.Height = -11
      SectionsAppearance.Font.Name = 'Tahoma'
      SectionsAppearance.Font.Style = []
      SectionsAppearance.Fill.Color = 15790320
      Header.Text = 'Aircraft'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -16
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Fill.Color = 15000804
      Footer.Text = 'Footer'
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = -11
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.Fill.Color = 15000804
      object grdFlights: TTMSFNCGrid
        Left = 0
        Top = 139
        Width = 459
        Height = 248
        Align = alClient
        ParentDoubleBuffered = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DefaultRowHeight = 32.000000000000000000
        FixedColumns = 0
        FixedRows = 0
        ColumnCount = 11
        RowCount = 1
        Options.ColumnSize.StretchAll = True
        Options.Editing.CalcFormat = '%g'
        Options.Editing.Enabled = False
        Options.Grouping.CalcFormat = '%g'
        Options.Grouping.GroupCountFormat = '(%d)'
        Options.IO.XMLEncoding = 'ISO-8859-1'
        Options.Mouse.ColumnSizeMargin = 6
        Options.Mouse.RowSizeMargin = 6
        Options.Selection.Mode = smNone
        Options.Selection.ShowSelectionInFixedCells = True
        OnSelectCell = grdFlightsSelectCell
        Columns = <
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 70.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 80.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 80.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 60.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 52.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 52.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 60.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 52.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 70.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 60.000000000000000000
          end
          item
            BorderWidth = 1
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -13
            FixedFont.Name = 'Courier New'
            FixedFont.Style = []
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            HorzAlignment = gtaCenter
            ID = ''
            Width = 90.000000000000000000
          end>
        TopRow = 0
        Appearance.FixedLayout.Fill.Color = 15132390
        Appearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedLayout.Font.Color = clWindowText
        Appearance.FixedLayout.Font.Height = -19
        Appearance.FixedLayout.Font.Name = 'Tahoma'
        Appearance.FixedLayout.Font.Style = [fsBold]
        Appearance.NormalLayout.Fill.Color = -1
        Appearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.NormalLayout.Font.Color = clWindowText
        Appearance.NormalLayout.Font.Height = -19
        Appearance.NormalLayout.Font.Name = 'Courier New'
        Appearance.NormalLayout.Font.Style = []
        Appearance.GroupLayout.Fill.Color = 12817262
        Appearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.GroupLayout.Font.Color = clWhite
        Appearance.GroupLayout.Font.Height = -19
        Appearance.GroupLayout.Font.Name = 'Courier New'
        Appearance.GroupLayout.Font.Style = []
        Appearance.SummaryLayout.Fill.Color = 14009785
        Appearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SummaryLayout.Font.Color = clWindowText
        Appearance.SummaryLayout.Font.Height = -19
        Appearance.SummaryLayout.Font.Name = 'Tahoma'
        Appearance.SummaryLayout.Font.Style = []
        Appearance.SelectedLayout.Fill.Color = clNavy
        Appearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.SelectedLayout.Font.Color = clWhite
        Appearance.SelectedLayout.Font.Height = -16
        Appearance.SelectedLayout.Font.Name = 'Courier New'
        Appearance.SelectedLayout.Font.Style = [fsBold]
        Appearance.FocusedLayout.Fill.Color = clNavy
        Appearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FocusedLayout.Font.Color = clWhite
        Appearance.FocusedLayout.Font.Height = -19
        Appearance.FocusedLayout.Font.Name = 'Courier New'
        Appearance.FocusedLayout.Font.Style = []
        Appearance.FixedSelectedLayout.Fill.Color = 14599344
        Appearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.FixedSelectedLayout.Font.Color = clWindowText
        Appearance.FixedSelectedLayout.Font.Height = -19
        Appearance.FixedSelectedLayout.Font.Name = 'Courier New'
        Appearance.FixedSelectedLayout.Font.Style = []
        Appearance.BandLayout.Fill.Color = 14745599
        Appearance.BandLayout.Font.Charset = DEFAULT_CHARSET
        Appearance.BandLayout.Font.Color = clWindowText
        Appearance.BandLayout.Font.Height = -19
        Appearance.BandLayout.Font.Name = 'Tahoma'
        Appearance.BandLayout.Font.Style = []
        Appearance.ProgressLayout.Format = '%.0f%%'
        LeftCol = 0
        ScrollMode = scmItemScrolling
        FreezeRows = 1
        OnGetCellLayout = grdFlightsGetCellLayout
      end
      object lblFurthest: TWebPanel
        Left = 0
        Top = 102
        Width = 459
        Height = 37
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Furthest Aircraft'
        ChildOrder = 1
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lblActive: TWebPanel
        Left = 0
        Top = 28
        Width = 459
        Height = 37
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Aircraft In Range'
        ChildOrder = 1
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lblSeen: TWebPanel
        Left = 0
        Top = 65
        Width = 459
        Height = 37
        Align = alTop
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Aircraft Seen'
        ChildOrder = 1
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object WebSplitter1: TWebSplitter
        Left = 0
        Top = 387
        Width = 459
        Height = 5
        Align = alBottom
        ChildOrder = 4
        Color = clBtnFace
        OnMoved = WebSplitter4Moved
      end
      object WebBrowserControl1: TWebBrowserControl
        Left = 0
        Top = 392
        Width = 459
        Height = 360
        Align = alBottom
        ChildOrder = 1
        Sandbox = []
      end
    end
  end
  object pnlTop: TWebPanel
    Left = 0
    Top = 0
    Width = 1563
    Height = 60
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsSingle
    object pnlUTC: TWebPanel
      AlignWithMargins = True
      Left = 520
      Top = 3
      Width = 1040
      Height = 54
      Align = alRight
      BorderColor = clSilver
      BorderStyle = bsNone
      object lblLongitude: TTMSFNCWidgetLCDLabel
        AlignWithMargins = True
        Left = 551
        Top = 8
        Width = 169
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        ParentDoubleBuffered = False
        Color = clBtnFace
        DoubleBuffered = True
        TabOrder = 0
        Fill.Kind = gfkGradient
        Fill.Color = clBtnFace
        Fill.ColorTo = clBtnFace
        Caption.Fill.Kind = gfkSolid
        Caption.Fill.Orientation = gfoVertical
        Caption.Fill.Color = clBlack
        Caption.Fill.ColorTo = clBlack
        Caption.Fill.ColorMirror = -1
        Caption.Fill.ColorMirrorTo = -1
        Caption.Fill.TextureMode = gtmStretch
        Caption.FillOff.Kind = gfkSolid
        Caption.FillOff.Orientation = gfoVertical
        Caption.FillOff.Color = clBtnFace
        Caption.FillOff.ColorTo = clBtnFace
        Caption.FillOff.ColorMirror = -1
        Caption.FillOff.ColorMirrorTo = -1
        Caption.FillOff.TextureMode = gtmStretch
        Caption.Format = '0.00000'
        Caption.TimeFormat = 'hh:nn:ss'
        Caption.TimeValue = 43965.480550312510000000
        Border.Kind = gskNone
        Border.Color = 6908265
      end
      object lblTime: TTMSFNCWidgetLCDLabel
        AlignWithMargins = True
        Left = 93
        Top = 8
        Width = 172
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        ParentDoubleBuffered = False
        Color = clBtnFace
        DoubleBuffered = True
        TabOrder = 1
        Fill.Kind = gfkGradient
        Fill.Color = clBtnFace
        Fill.ColorTo = clBtnFace
        Caption.Fill.Kind = gfkSolid
        Caption.Fill.Orientation = gfoVertical
        Caption.Fill.Color = clBlack
        Caption.Fill.ColorTo = clBlack
        Caption.Fill.ColorMirror = -1
        Caption.Fill.ColorMirrorTo = -1
        Caption.Fill.TextureMode = gtmStretch
        Caption.FillOff.Kind = gfkSolid
        Caption.FillOff.Orientation = gfoVertical
        Caption.FillOff.Color = clBtnFace
        Caption.FillOff.ColorTo = clBtnFace
        Caption.FillOff.ColorMirror = -1
        Caption.FillOff.ColorMirrorTo = -1
        Caption.FillOff.TextureMode = gtmStretch
        Caption.Format = '000.00'
        Caption.TimeFormat = 'hh:nn:ss'
        Caption.ValueType = vtDateTime
        Caption.TimeValue = 43966.368973229160000000
        Border.Kind = gskNone
        Border.Color = 6908265
      end
      object WebPanel1: TWebPanel
        Left = 0
        Top = 0
        Width = 85
        Height = 54
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Payload UTC:'
        ChildOrder = 2
      end
      object WebPanel2: TWebPanel
        Left = 273
        Top = 0
        Width = 40
        Height = 54
        Align = alRight
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Lat:'
        ChildOrder = 2
      end
      object WebPanel3: TWebPanel
        Left = 503
        Top = 0
        Width = 40
        Height = 54
        Align = alRight
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Lon:'
        ChildOrder = 2
      end
      object lblLatitude: TTMSFNCWidgetLCDLabel
        AlignWithMargins = True
        Left = 321
        Top = 8
        Width = 174
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        ParentDoubleBuffered = False
        Color = clBtnFace
        DoubleBuffered = True
        TabOrder = 5
        Fill.Kind = gfkGradient
        Fill.Color = clBtnFace
        Fill.ColorTo = clBtnFace
        Caption.Fill.Kind = gfkSolid
        Caption.Fill.Orientation = gfoVertical
        Caption.Fill.Color = clBlack
        Caption.Fill.ColorTo = clBlack
        Caption.Fill.ColorMirror = -1
        Caption.Fill.ColorMirrorTo = -1
        Caption.Fill.TextureMode = gtmStretch
        Caption.FillOff.Kind = gfkSolid
        Caption.FillOff.Orientation = gfoVertical
        Caption.FillOff.Color = clBtnFace
        Caption.FillOff.ColorTo = clBtnFace
        Caption.FillOff.ColorMirror = -1
        Caption.FillOff.ColorMirrorTo = -1
        Caption.FillOff.TextureMode = gtmStretch
        Caption.Format = '0.00000'
        Caption.TimeFormat = 'hh:nn:ss'
        Caption.TimeValue = 43965.480550312510000000
        Border.Kind = gskNone
        Border.Color = 6908265
      end
      object WebPanel4: TWebPanel
        Left = 728
        Top = 0
        Width = 40
        Height = 54
        Align = alRight
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Alt (m):'
        ChildOrder = 2
      end
      object lblAltitude: TTMSFNCWidgetLCDLabel
        AlignWithMargins = True
        Left = 776
        Top = 8
        Width = 144
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        ParentDoubleBuffered = False
        Color = clBtnFace
        DoubleBuffered = True
        TabOrder = 7
        Fill.Kind = gfkGradient
        Fill.Color = clBtnFace
        Fill.ColorTo = clBtnFace
        Caption.Fill.Kind = gfkSolid
        Caption.Fill.Orientation = gfoVertical
        Caption.Fill.Color = clBlack
        Caption.Fill.ColorTo = clBlack
        Caption.Fill.ColorMirror = -1
        Caption.Fill.ColorMirrorTo = -1
        Caption.Fill.TextureMode = gtmStretch
        Caption.FillOff.Kind = gfkSolid
        Caption.FillOff.Orientation = gfoVertical
        Caption.FillOff.Color = clBtnFace
        Caption.FillOff.ColorTo = clBtnFace
        Caption.FillOff.ColorMirror = -1
        Caption.FillOff.ColorMirrorTo = -1
        Caption.FillOff.TextureMode = gtmStretch
        Caption.Format = '00000'
        Caption.TimeFormat = 'hh:nn:ss'
        Caption.TimeValue = 43965.480550312510000000
        Border.Kind = gskNone
        Border.Color = 6908265
      end
      object lblSats: TTMSFNCWidgetLCDLabel
        AlignWithMargins = True
        Left = 976
        Top = 8
        Width = 56
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alRight
        ParentDoubleBuffered = False
        Color = clBtnFace
        DoubleBuffered = True
        TabOrder = 8
        Fill.Kind = gfkGradient
        Fill.Color = clBtnFace
        Fill.ColorTo = clBtnFace
        Caption.Fill.Kind = gfkSolid
        Caption.Fill.Orientation = gfoVertical
        Caption.Fill.Color = clBlack
        Caption.Fill.ColorTo = clBlack
        Caption.Fill.ColorMirror = -1
        Caption.Fill.ColorMirrorTo = -1
        Caption.Fill.TextureMode = gtmStretch
        Caption.FillOff.Kind = gfkSolid
        Caption.FillOff.Orientation = gfoVertical
        Caption.FillOff.Color = clBtnFace
        Caption.FillOff.ColorTo = clBtnFace
        Caption.FillOff.ColorMirror = -1
        Caption.FillOff.ColorMirrorTo = -1
        Caption.FillOff.TextureMode = gtmStretch
        Caption.Format = '00'
        Caption.TimeFormat = 'hh:nn:ss'
        Caption.TimeValue = 43965.480550312510000000
        Border.Kind = gskNone
        Border.Color = 6908265
      end
      object WebPanel5: TWebPanel
        Left = 928
        Top = 0
        Width = 40
        Height = 54
        Align = alRight
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'Sats:'
        ChildOrder = 2
      end
    end
    object pnlServerStatus1: TWebPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 166
      Height = 54
      Align = alLeft
      BorderColor = clSilver
      BorderStyle = bsNone
      object pnlServerStatus: TWebPanel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 150
        Height = 38
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        BorderColor = clBlack
        BorderStyle = bsSingle
        Caption = 'SERVER STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlTitle: TWebPanel
      Left = 172
      Top = 0
      Width = 345
      Height = 60
      Align = alClient
      BorderColor = clSilver
      BorderStyle = bsNone
      Caption = 'ADSB HAB Flight Dashboard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object WebSplitter2: TWebSplitter
    Left = 1099
    Top = 60
    Width = 5
    Height = 752
    Align = alRight
    Color = clBtnFace
    OnMoved = WebSplitter4Moved
  end
  object pnlCentre: TWebPanel
    Left = 0
    Top = 60
    Width = 1099
    Height = 752
    Align = alClient
    BorderColor = clSilver
    BorderStyle = bsSingle
    Caption = 'pnlCentre'
    object pnlCentreTop: TWebPanel
      Left = 0
      Top = 0
      Width = 1099
      Height = 752
      Align = alClient
      BorderColor = clSilver
      BorderStyle = bsSingle
      object GMap: TWebGoogleMaps
        Left = 0
        Top = 0
        Width = 1099
        Height = 752
        Align = alClient
        ChildOrder = 1
        Options.DefaultLatitude = 52.000000000000000000
        Options.DefaultLongitude = -2.000000000000000000
        OnMapIdle = GMapMapIdle
        OnMapLoaded = GMapMapLoaded
        OnMarkerClick = GMapMarkerClick
      end
    end
  end
  object tmrLoad: TWebTimer
    Enabled = False
    OnTimer = tmrLoadTimer
    Left = 438
    Top = 316
  end
  object WebSocketClient1: TWebSocketClient
    OnConnect = WebSocketClient1Connect
    OnDisconnect = WebSocketClient1Disconnect
    OnDataReceived = WebSocketClient1DataReceived
    Left = 938
    Top = 522
  end
  object tmrReconnect: TWebTimer
    Enabled = False
    OnTimer = tmrReconnectTimer
    Left = 800
    Top = 520
  end
  object WebRESTClient1: TWebRESTClient
    OnError = WebRESTClient1Error
    OnResponse = WebRESTClient1Response
    Left = 1184
    Top = 521
  end
  object tmrMap: TWebTimer
    Enabled = True
    Interval = 100
    OnTimer = tmrMapTimer
    Left = 1304
    Top = 532
  end
end
