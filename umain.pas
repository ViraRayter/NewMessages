unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TMain }

  TMain = class(TForm)
    bMail: TButton;
    bVK: TButton;
    bDiscord: TButton;
    Image1: TImage;
    LabelMain: TLabel;
    procedure bDiscordClick(Sender: TObject);
    procedure bMailClick(Sender: TObject);
    procedure bVKClick(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;

implementation
uses users;
{$R *.lfm}

{ TMain }


procedure TMain.bMailClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

procedure TMain.bDiscordClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

procedure TMain.bVKClick(Sender: TObject);
begin
  Main.Visible:=false;
  fUsers.ShowModal;
end;

end.

