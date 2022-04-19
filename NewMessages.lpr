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
  Forms, indylaz, USend, umain, users, uend, selectuser, adduser, uimage, 
uselplat
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfUsers, fUsers);
  Application.CreateForm(TfSelectU, fSelectU);
  Application.CreateForm(TFSend, FSend);
  Application.CreateForm(Tfend, fend);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TfAddUser, fAddUser);
  Application.CreateForm(TfImage, fImage);
  Application.CreateForm(TFSelPlat, FSelPlat);
  Application.Run;
end.

