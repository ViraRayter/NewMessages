unit umain;

{$mode objfpc}{$H+}

interface

uses
<<<<<<< HEAD
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
<<<<<<< HEAD
  Buttons, selectuser, adduser, uSend, uEnd, Users;
=======
  Buttons;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
=======
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;
>>>>>>> parent of b110a2a (Change MainForm)

type

  { TMain }

  TMain = class(TForm)
<<<<<<< HEAD
    BBack: TButton;
    BNext: TButton;
<<<<<<< HEAD
    bMail: TButton;
    bVK: TButton;
    bDiscord: TButton;
    Fon: TImage;
    LMain: TLabel;
    BAuthMail: TSpeedButton;
    BAuthVK: TSpeedButton;
    BAuthDiscord: TSpeedButton;
    procedure BAuthDiscordClick(Sender: TObject);
    procedure BAuthMailClick(Sender: TObject);
    procedure BAuthVKClick(Sender: TObject);
    procedure bDiscordClick(Sender: TObject);
    procedure bMailClick(Sender: TObject);
    procedure bVKClick(Sender: TObject);
=======
    Fon: TImage;
    LMain: TLabel;
    BMail: TToggleBox;
    BVK: TToggleBox;
    BDiscord: TToggleBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure BDiscordClick(Sender: TObject);
    procedure BMailClick(Sender: TObject);
    procedure BVKClick(Sender: TObject);
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
=======
    bMail: TButton;
    bVK: TButton;
    bDiscord: TButton;
    Image1: TImage;
    LabelMain: TLabel;
    procedure bDiscordClick(Sender: TObject);
    procedure bMailClick(Sender: TObject);
    procedure bVKClick(Sender: TObject);
>>>>>>> parent of b110a2a (Change MainForm)
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

>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end.

