program NewMessages;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, USend, umain, users, uend, selectuser
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tfend, fend);
  Application.CreateForm(TfSelectU, fSelectU);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFSend, FSend);
  Application.CreateForm(TfUsers, fUsers);
  Application.Run;
end.

