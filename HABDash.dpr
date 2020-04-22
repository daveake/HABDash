program HABDash;

uses
  Vcl.Forms,
  WEBLib.Forms,
  Main in 'Main.pas' {frmMain: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
