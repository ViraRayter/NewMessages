unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, selectuser;

type

  { TMain }

  TMain = class(TForm)
    BBack: TButton;
    BNext: TButton;
    bMail: TButton;
    bVK: TButton;
    bDiscord: TButton;
    Fon: TImage;
    LMain: TLabel;
    BAuthMail: TSpeedButton;
    BAuthVK: TSpeedButton;
    BAuthDiscord: TSpeedButton;
  private

  public

  end;

var
  Main: TMain;

implementation
uses users;
{$R *.lfm}

{ TMain }

end.

