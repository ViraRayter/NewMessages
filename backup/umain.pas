unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TMain }

  TMain = class(TForm)
    BBack: TButton;
    BNext: TButton;
    Fon: TImage;
    LMain: TLabel;
    BMail: TToggleBox;
    BVK: TToggleBox;
    BDiscord: TToggleBox;
    BAuthMail: TSpeedButton;
    BAuthVK: TSpeedButton;
    BAuthDiscord: TSpeedButton;
    procedure BAuthDiscordClick(Sender: TObject);
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
 FSelectU.Show;
 Main.Hide;
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction.caNone;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  BMail.Checked:=False;
  BVk.Checked:=False;
  BDiscord.Checked:=False;
  ActiveControl := nil;
end;

procedure TMain.BAuthDiscordClick(Sender: TObject);
begin
 FUsers.Show;
 FUsers.BBack.Visible:=true;
 Main.Hide;
end;

procedure TMain.BBackClick(Sender: TObject);
begin
 FUsers.Show;
 FUsers.BBack.Visible:=false;
 Main.Hide;
end;

{ TMain }


{ TMain }


end.

