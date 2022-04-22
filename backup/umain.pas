unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TMain }

  TMain = class(TForm)
    BBack: TButton;
    BNext: TButton;
    Fon: TImage;
    LMain: TLabel;
    BMail: TToggleBox;
    BTelegram: TToggleBox;
    BDiscord: TToggleBox;
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;

implementation
uses users,selectuser;
{$R *.lfm}

{ TMain }

procedure TMain.BNextClick(Sender: TObject);
begin
 if (BMail.Checked = False) and (BTelegram.Checked = False) and (BDiscord.Checked = False) then
 begin
   ShowMessage('Выберите хотя бы одну платформу!');
   exit;
 end;
 platsel[1]:=BMail.Checked;
 platsel[2]:=BTelegram.Checked;
 platsel[3]:=BDiscord.Checked;
 FSelectU.Show;
 Main.Hide;
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  platsel[1]:=false;
  platsel[2]:=false;
  platsel[3]:=false;
  BMail.Checked:=False;
  BTelegram.Checked:=False;
  BDiscord.Checked:=False;
  ActiveControl := nil;
end;

procedure TMain.BBackClick(Sender: TObject);
begin
 FUsers.Show;
 Name:='';
 Main.Hide;
end;

{ TMain }


{ TMain }


end.

