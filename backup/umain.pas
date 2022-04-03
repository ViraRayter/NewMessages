unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Selectuser;

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
    procedure BNextClick(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;

implementation
uses users;
{$R *.lfm}

{ TMain }

procedure TMain.BNextClick(Sender: TObject);
begin
 FSelectU.Show;
 Main.Hide;
end;

procedure TMain.BAuthDiscordClick(Sender: TObject);
begin
 FUsers.Show;
 FUsers.BBack.Visible:=true;
 Main.Hide;
end;

{ TMain }


{ TMain }


end.

