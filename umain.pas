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
    procedure BDiscordClick(Sender: TObject);
    procedure BMailClick(Sender: TObject);
    procedure BVKClick(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;

implementation
uses users;
{$R *.lfm}

{ TMain }


procedure TMain.BMailClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

procedure TMain.BDiscordClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

procedure TMain.BVKClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

end.

