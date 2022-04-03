unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
<<<<<<< HEAD
  Buttons, selectuser, adduser, uSend, uEnd, Users;
=======
  Buttons;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)

type

  { TMain }

  TMain = class(TForm)
    BBack: TButton;
<<<<<<< HEAD
    bMail: TButton;
    bVK: TButton;
    bDiscord: TButton;
=======
    BNext: TButton;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
    Fon: TImage;
    LMain: TLabel;
    BMail: TToggleBox;
    BVK: TToggleBox;
    BDiscord: TToggleBox;
    BAuthMail: TSpeedButton;
    BAuthVK: TSpeedButton;
    BAuthDiscord: TSpeedButton;
<<<<<<< HEAD
    procedure BAuthDiscordClick(Sender: TObject);
    procedure BAuthMailClick(Sender: TObject);
    procedure BAuthVKClick(Sender: TObject);
    procedure bDiscordClick(Sender: TObject);
    procedure bMailClick(Sender: TObject);
    procedure bVKClick(Sender: TObject);
=======
    procedure BDiscordClick(Sender: TObject);
    procedure BMailClick(Sender: TObject);
    procedure BVKClick(Sender: TObject);
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
  private

  public

  end;

var
  Main: TMain;

implementation

{$R *.lfm}

{ TMain }

<<<<<<< HEAD
procedure TMain.bMailClick(Sender: TObject);
begin
  fSelectU.Show;
  Main.Hide;
end;

procedure TMain.bDiscordClick(Sender: TObject);
begin
  fSelectU.Show;
  Main.Hide;
end;

procedure TMain.BAuthMailClick(Sender: TObject);
begin
  fUsers.Show;
  Main.Hide;
end;

procedure TMain.BAuthDiscordClick(Sender: TObject);
begin
  fUsers.Show;
  Main.Hide;
end;

procedure TMain.BAuthVKClick(Sender: TObject);
begin
  fUsers.Show;
  Main.Hide;
end;

procedure TMain.bVKClick(Sender: TObject);
begin
  fSelectU.Show;
  Main.Hide;
end;

{ TMain }

=======

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

>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end.

