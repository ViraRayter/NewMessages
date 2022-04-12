unit uend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users;

type

  { Tfend }

  Tfend = class(TForm)
    BExit: TButton;
    Fon: TImage;
    LEnd: TLabel;
    procedure BExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fend: Tfend;

implementation

uses umain;
{$R *.lfm}

{ Tfend }

procedure Tfend.BExitClick(Sender: TObject);
begin
  fend.hide;
  Main.Show;
end;

procedure Tfend.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure Tfend.FormShow(Sender: TObject);
begin
  ActiveControl:= nil;
end;

end.

