object frmMain: TfrmMain
  Left = 0
  Top = 0
  Width = 1069
  Height = 675
  Caption = 'HAB Dashboard'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  OnClose = WebFormClose
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object WebSplitter1: TWebSplitter
    Left = 369
    Top = 60
    Width = 5
    Height = 615
    Align = alLeft
    Color = clBtnFace
    OnMoved = WebSplitter4Moved
  end
  object pnlLeft: TWebPanel
    Left = 0
    Top = 60
    Width = 369
    Height = 615
    Align = alLeft
    BorderColor = clSilver
    BorderStyle = bsSingle
    ChildOrder = 1
    object TMSFNCPanel1: TTMSFNCPanel
      Left = 0
      Top = 0
      Width = 369
      Height = 185
      Align = alTop
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 0
      Sections = <>
      SectionsAppearance.Font.Charset = DEFAULT_CHARSET
      SectionsAppearance.Font.Color = clWindowText
      SectionsAppearance.Font.Height = -11
      SectionsAppearance.Font.Name = 'Tahoma'
      SectionsAppearance.Font.Style = []
      SectionsAppearance.Fill.Color = 15790320
      Header.Text = 'Flight Information'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
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
      object WebMemo2: TWebMemo
        Left = 0
        Top = 28
        Width = 369
        Height = 157
        Align = alClient
        AutoSize = False
        Lines.Strings = (
          'Launch: 13:00 UTC'
          'Balloon: Hwoyee 1600'
          'Launch Site: Old Gore'
          'Launcher: Dave Akerman'
          ''
          'Test flight for PITS V3, with 3 trackers under a single balloon.')
        SelLength = 0
        SelStart = 156
      end
    end
    object TMSFNCPanel2: TTMSFNCPanel
      Left = 0
      Top = 300
      Width = 369
      Height = 315
      Align = alBottom
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 1
      Sections = <>
      SectionsAppearance.Font.Charset = DEFAULT_CHARSET
      SectionsAppearance.Font.Color = clWindowText
      SectionsAppearance.Font.Height = -11
      SectionsAppearance.Font.Name = 'Tahoma'
      SectionsAppearance.Font.Style = []
      SectionsAppearance.Fill.Color = 15790320
      Header.Text = 'Listeners'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
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
      object TMSFNCChart1: TTMSFNCChart
        Left = 0
        Top = 28
        Width = 369
        Height = 287
        ClickMargin = 10.000000000000000000
        Legend.Fill.Color = 16775416
        Legend.Stroke.Color = clGray
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWindowText
        Legend.Font.Height = -11
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Legend.Left = 10.000000000000000000
        Legend.Top = 10.000000000000000000
        Stroke.Color = clGray
        SeriesMargins.Left = 0
        SeriesMargins.Top = 0
        SeriesMargins.Right = 0
        SeriesMargins.Bottom = 0
        Series = <
          item
            AnimationFactor = 4.000000000000000000
            AutoYRange = arCommonZeroBased
            Bar.Width = 65.000000000000000000
            Bar.Spacing = 20.000000000000000000
            MultiPoint.Width = 65.000000000000000000
            Pie.Size = 200.000000000000000000
            Pie.Margins.Left = 10
            Pie.Margins.Top = 10
            Pie.Margins.Right = 10
            Pie.Margins.Bottom = 10
            Pie.SweepAngle = 360.000000000000000000
            ChartType = ctPie
            Fill.Color = 10061943
            LegendText = 'Serie 1'
            Labels.Fill.Color = 16775416
            Labels.Font.Charset = DEFAULT_CHARSET
            Labels.Font.Color = clWindowText
            Labels.Font.Height = -11
            Labels.Font.Name = 'Tahoma'
            Labels.Font.Style = []
            Labels.Format = '%.2f'
            Labels.OffsetY = -10.000000000000000000
            Labels.Stroke.Color = clGray
            Markers.Fill.Color = 10061943
            Markers.Height = 10.000000000000000000
            Markers.Stroke.Color = 5197615
            Markers.Visible = True
            Markers.Width = 10.000000000000000000
            MaxX = 10.000000000000000000
            MaxY = 10.000000000000000000
            MaxYOffsetPercentage = 10.000000000000000000
            Offset3DX = 15.000000000000000000
            Offset3DY = 15.000000000000000000
            Points = <
              item
                Annotations = <>
                YValue = 146.000000000000000000
                YValueSecond = 106.000000000000000000
                YValueVariable = 126.000000000000000000
                YValueLow = -6.000000000000000000
                YValueClose = 152.000000000000000000
                YValueHigh = 146.000000000000000000
                YValueOpen = 147.000000000000000000
                YValueMedian = 149.000000000000000000
              end
              item
                Annotations = <>
                XValue = 1.000000000000000000
                YValue = 89.000000000000000000
                YValueSecond = 49.000000000000000000
                YValueVariable = 69.000000000000000000
                YValueLow = 13.000000000000000000
                YValueClose = 91.000000000000000000
                YValueHigh = 89.000000000000000000
                YValueOpen = 98.000000000000000000
                YValueMedian = 98.000000000000000000
              end
              item
                Annotations = <>
                XValue = 2.000000000000000000
                YValue = 29.000000000000000000
                YValueSecond = -11.000000000000000000
                YValueVariable = 9.000000000000000000
                YValueLow = 41.000000000000000000
                YValueClose = 37.000000000000000000
                YValueHigh = 29.000000000000000000
                YValueOpen = 33.000000000000000000
                YValueMedian = 37.000000000000000000
              end
              item
                Annotations = <>
                XValue = 3.000000000000000000
                YValue = 130.000000000000000000
                YValueSecond = 90.000000000000000000
                YValueVariable = 110.000000000000000000
                YValueLow = -10.000000000000000000
                YValueClose = 138.000000000000000000
                YValueHigh = 130.000000000000000000
                YValueOpen = 123.000000000000000000
                YValueMedian = 124.000000000000000000
              end
              item
                Annotations = <>
                XValue = 4.000000000000000000
                YValue = 26.000000000000000000
                YValueSecond = -14.000000000000000000
                YValueVariable = 6.000000000000000000
                YValueLow = 70.000000000000000000
                YValueClose = 35.000000000000000000
                YValueHigh = 26.000000000000000000
                YValueOpen = 34.000000000000000000
                YValueMedian = 32.000000000000000000
              end
              item
                Annotations = <>
                XValue = 5.000000000000000000
                YValue = 40.000000000000000000
                YValueSecond = 27.000000000000000000
                YValueVariable = 20.000000000000000000
                YValueLow = 71.000000000000000000
                YValueClose = 44.000000000000000000
                YValueHigh = 40.000000000000000000
                YValueOpen = 43.000000000000000000
                YValueMedian = 47.000000000000000000
              end
              item
                Annotations = <>
                XValue = 6.000000000000000000
                YValue = 136.000000000000000000
                YValueSecond = 96.000000000000000000
                YValueVariable = 116.000000000000000000
                YValueLow = 3.000000000000000000
                YValueClose = 144.000000000000000000
                YValueHigh = 136.000000000000000000
                YValueOpen = 141.000000000000000000
                YValueMedian = 136.000000000000000000
              end
              item
                Annotations = <>
                XValue = 7.000000000000000000
                YValue = 107.000000000000000000
                YValueSecond = 67.000000000000000000
                YValueVariable = 87.000000000000000000
                YValueLow = -12.000000000000000000
                YValueClose = 110.000000000000000000
                YValueHigh = 107.000000000000000000
                YValueOpen = 109.000000000000000000
                YValueMedian = 112.000000000000000000
              end
              item
                Annotations = <>
                XValue = 8.000000000000000000
                YValue = 106.000000000000000000
                YValueSecond = 66.000000000000000000
                YValueVariable = 86.000000000000000000
                YValueLow = 16.000000000000000000
                YValueClose = 100.000000000000000000
                YValueHigh = 106.000000000000000000
                YValueOpen = 98.000000000000000000
                YValueMedian = 95.000000000000000000
              end
              item
                Annotations = <>
                XValue = 9.000000000000000000
                YValue = 71.000000000000000000
                YValueSecond = 31.000000000000000000
                YValueVariable = 51.000000000000000000
                YValueLow = 50.000000000000000000
                YValueClose = 73.000000000000000000
                YValueHigh = 71.000000000000000000
                YValueOpen = 65.000000000000000000
                YValueMedian = 60.000000000000000000
              end
              item
                Annotations = <>
                XValue = 10.000000000000000000
                YValue = 138.000000000000000000
                YValueSecond = 98.000000000000000000
                YValueVariable = 118.000000000000000000
                YValueLow = -11.000000000000000000
                YValueClose = 139.000000000000000000
                YValueHigh = 138.000000000000000000
                YValueOpen = 134.000000000000000000
                YValueMedian = 137.000000000000000000
              end>
            Legend.Fill.Color = 16775416
            Legend.Font.Charset = DEFAULT_CHARSET
            Legend.Font.Color = clWindowText
            Legend.Font.Height = -11
            Legend.Font.Name = 'Tahoma'
            Legend.Font.Style = []
            Legend.Left = -10.000000000000000000
            Legend.Stroke.Color = clGray
            ShowInLegend = False
            Stroke.Color = 5197615
            XGrid.Visible = True
            XValues.MajorUnit = 1.000000000000000000
            XValues.MajorUnitFont.Charset = DEFAULT_CHARSET
            XValues.MajorUnitFont.Color = clWindowText
            XValues.MajorUnitFont.Height = -11
            XValues.MajorUnitFont.Name = 'Tahoma'
            XValues.MajorUnitFont.Style = []
            XValues.MajorUnitFormat = '%.0f'
            XValues.MajorUnitSpacing = 5.000000000000000000
            XValues.MajorUnitTickMarkSize = 10.000000000000000000
            XValues.MajorUnitTickMarkColor = clSilver
            XValues.MinorUnitFont.Charset = DEFAULT_CHARSET
            XValues.MinorUnitFont.Color = clWindowText
            XValues.MinorUnitFont.Height = -11
            XValues.MinorUnitFont.Name = 'Tahoma'
            XValues.MinorUnitFont.Style = []
            XValues.MinorUnitFormat = '%.0f'
            XValues.MinorUnitSpacing = 5.000000000000000000
            XValues.MinorUnitTickMarkSize = 7.000000000000000000
            XValues.MinorUnitTickMarkColor = clSilver
            XValues.Title.Font.Charset = DEFAULT_CHARSET
            XValues.Title.Font.Color = clWindowText
            XValues.Title.Font.Height = -11
            XValues.Title.Font.Name = 'Tahoma'
            XValues.Title.Font.Style = []
            XValues.Title.TextMargins.Left = 0
            XValues.Title.TextMargins.Top = 0
            XValues.Title.TextMargins.Right = 0
            XValues.Title.TextMargins.Bottom = 0
            XValues.Title.Text = 'X-Axis Serie 1'
            YGrid.Visible = True
            YValues.MajorUnit = 1.000000000000000000
            YValues.MajorUnitFont.Charset = DEFAULT_CHARSET
            YValues.MajorUnitFont.Color = clWindowText
            YValues.MajorUnitFont.Height = -11
            YValues.MajorUnitFont.Name = 'Tahoma'
            YValues.MajorUnitFont.Style = []
            YValues.MajorUnitFormat = '%.2f'
            YValues.MajorUnitSpacing = 5.000000000000000000
            YValues.MajorUnitTickMarkSize = 10.000000000000000000
            YValues.MajorUnitTickMarkColor = clSilver
            YValues.MinorUnitFont.Charset = DEFAULT_CHARSET
            YValues.MinorUnitFont.Color = clWindowText
            YValues.MinorUnitFont.Height = -11
            YValues.MinorUnitFont.Name = 'Tahoma'
            YValues.MinorUnitFont.Style = []
            YValues.MinorUnitFormat = '%.2f'
            YValues.MinorUnitSpacing = 5.000000000000000000
            YValues.MinorUnitTickMarkSize = 7.000000000000000000
            YValues.MinorUnitTickMarkColor = clSilver
            YValues.Title.Font.Charset = DEFAULT_CHARSET
            YValues.Title.Font.Color = clWindowText
            YValues.Title.Font.Height = -11
            YValues.Title.Font.Name = 'Tahoma'
            YValues.Title.Font.Style = []
            YValues.Title.TextMargins.Left = 0
            YValues.Title.TextMargins.Top = 0
            YValues.Title.TextMargins.Right = 0
            YValues.Title.TextMargins.Bottom = 0
            YValues.Title.Text = 'Y-Axis Serie 1'
          end>
        Title.Fill.Kind = gfkNone
        Title.Fill.Color = 16775416
        Title.Stroke.Color = clGray
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Title.Height = 35.000000000000000000
        Title.TextMargins.Left = 3
        Title.TextMargins.Top = 3
        Title.TextMargins.Right = 3
        Title.TextMargins.Bottom = 3
        Title.Text = 'TMS FNC Chart'
        XAxis.Fill.Kind = gfkNone
        XAxis.Fill.Color = 16775416
        XAxis.Stroke.Color = clGray
        XAxis.Height = 35.000000000000000000
        YAxis.Fill.Kind = gfkNone
        YAxis.Fill.Color = 16775416
        YAxis.Stroke.Color = clGray
        YAxis.Width = 35.000000000000000000
        Align = alClient
        TabOrder = 0
      end
    end
    object TMSFNCPanel3: TTMSFNCPanel
      Left = 0
      Top = 190
      Width = 369
      Height = 105
      Align = alClient
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 2
      Sections = <>
      SectionsAppearance.Font.Charset = DEFAULT_CHARSET
      SectionsAppearance.Font.Color = clWindowText
      SectionsAppearance.Font.Height = -11
      SectionsAppearance.Font.Name = 'Tahoma'
      SectionsAppearance.Font.Style = []
      SectionsAppearance.Fill.Color = 15790320
      Header.Text = 'Flight Log'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
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
      object WebMemo1: TWebMemo
        Left = 0
        Top = 28
        Width = 369
        Height = 77
        Align = alClient
        AutoSize = False
        Lines.Strings = (
          '12:00:01 YouTube Stream Live'
          '12:10:12 Payload XYZ Online'
          '12:20:12 Balloon Fill Started')
        SelLength = 0
        SelStart = 90
      end
    end
    object WebSplitter3: TWebSplitter
      Left = 0
      Top = 185
      Width = 369
      Height = 5
      Align = alTop
      ChildOrder = 5
      Color = clBtnFace
    end
    object WebSplitter5: TWebSplitter
      Left = 0
      Top = 295
      Width = 369
      Height = 5
      Align = alBottom
      ChildOrder = 5
      Color = clBtnFace
    end
  end
  object pnlTop: TWebPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 60
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsSingle
    ChildOrder = 2
    object pnlUTC: TWebPanel
      Left = 919
      Top = 0
      Width = 150
      Height = 60
      Align = alRight
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'CURRENT UTC'
    end
    object pnlServerStatus: TWebPanel
      Left = 0
      Top = 0
      Width = 150
      Height = 60
      Align = alLeft
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'SERVER STATUS'
      ChildOrder = 1
    end
    object pnlTitle: TWebPanel
      Left = 150
      Top = 0
      Width = 769
      Height = 60
      Align = alClient
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'FLIGHT TITLE'
      ChildOrder = 1
    end
  end
  object WebSplitter2: TWebSplitter
    Left = 914
    Top = 60
    Width = 5
    Height = 615
    Align = alRight
    ChildOrder = 3
    Color = clBtnFace
    OnMoved = WebSplitter4Moved
  end
  object pnlCentre: TWebPanel
    Left = 374
    Top = 60
    Width = 540
    Height = 615
    Align = alClient
    BorderColor = clSilver
    BorderStyle = bsSingle
    Caption = 'pnlCentre'
    ChildOrder = 6
    object pnlCentreBottom: TWebPanel
      Left = 0
      Top = 318
      Width = 540
      Height = 297
      Align = alBottom
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'WebPanel3'
      ChildOrder = 4
      object pnlSSDV: TWebPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 297
        Align = alLeft
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'SSDV'
        ChildOrder = 4
      end
      object pnlYouTube: TWebPanel
        Left = 310
        Top = 0
        Width = 230
        Height = 297
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'YOUTUBE'
        ChildOrder = 4
      end
      object WebSplitter7: TWebSplitter
        Left = 305
        Top = 0
        Width = 5
        Height = 297
        Align = alLeft
        ChildOrder = 5
        Color = clBtnFace
        OnMoved = WebSplitter4Moved
      end
    end
    object WebSplitter4: TWebSplitter
      Left = 0
      Top = 313
      Width = 540
      Height = 5
      Align = alBottom
      ChildOrder = 5
      Color = clBtnFace
      OnMoved = WebSplitter4Moved
    end
    object pnlCentreTop: TWebPanel
      Left = 0
      Top = 0
      Width = 540
      Height = 313
      Align = alClient
      BorderColor = clSilver
      BorderStyle = bsSingle
      ChildOrder = 4
      object WebSplitter6: TWebSplitter
        Left = 268
        Top = 0
        Width = 5
        Height = 313
        Align = alLeft
        ChildOrder = 5
        Color = clBtnFace
        OnMoved = WebSplitter4Moved
      end
      object pnl3D: TWebPanel
        Left = 273
        Top = 0
        Width = 267
        Height = 313
        Align = alClient
        BorderColor = clSilver
        BorderStyle = bsSingle
        Caption = 'CESIUM'
        ChildOrder = 4
        object WebBrowserControl1: TWebBrowserControl
          Left = 0
          Top = 0
          Width = 267
          Height = 313
          Align = alClient
          Sandbox = []
        end
      end
      object pnlMap: TWebPanel
        Left = 0
        Top = 0
        Width = 268
        Height = 313
        Align = alLeft
        BorderColor = clSilver
        BorderStyle = bsNone
        Caption = 'MAP'
        ChildOrder = 1
        object GMap: TTMSFNCGoogleMaps
          Left = 0
          Top = 0
          Width = 268
          Height = 313
          AdaptToStyle = True
          Align = alClient
          ParentDoubleBuffered = False
          DoubleBuffered = True
          TabOrder = 0
          Visible = False
          Polylines = <>
          Polygons = <>
          Circles = <>
          Rectangles = <>
          Markers = <>
          Options.DefaultLatitude = 40.689247000000000000
          Options.DefaultLongitude = -74.044501999999990000
          KMLLayers = <>
          Clusters = <>
        end
      end
    end
  end
  object pnlRight: TWebPanel
    Left = 919
    Top = 60
    Width = 150
    Height = 615
    Align = alRight
    BorderColor = clSilver
    BorderStyle = bsSingle
    Caption = 'WebPanel1'
    ChildOrder = 1
    object WebPanel15: TWebPanel
      Left = 0
      Top = 300
      Width = 150
      Height = 150
      Align = alTop
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'PAYLOAD 3'
      ChildOrder = 1
    end
    object WebPanel18: TWebPanel
      Left = 0
      Top = 150
      Width = 150
      Height = 150
      Align = alTop
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'PAYLOAD 2'
      ChildOrder = 1
    end
    object WebPanel19: TWebPanel
      Left = 0
      Top = 0
      Width = 150
      Height = 150
      Align = alTop
      BorderColor = clSilver
      BorderStyle = bsSingle
      Caption = 'PAYLOAD 1'
      ChildOrder = 1
    end
  end
  object tmrLoad: TWebTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrLoadTimer
    Left = 438
    Top = 316
  end
end
