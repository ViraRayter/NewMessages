unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TMain }

  TMain = class(TForm)
    BMail: TButton;
    BVK: TButton;
    BDiscord: TButton;
    Fon: TImage;
    LMain: TLabel;
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

