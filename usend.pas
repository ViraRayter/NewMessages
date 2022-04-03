unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
<<<<<<< HEAD
  Buttons, uEnd;
=======
  Buttons;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)

type

  { TFSend }

  TFSend = class(TForm)
    BGo: TButton;
    BBack: TButton;
    ETopic: TEdit;
    Fon: TImage;
    LText: TLabel;
    LAdd: TLabel;
    LTopic: TLabel;
    MText: TMemo;
    BAdd: TSpeedButton;
  private

  public

  end;

var
  FSend: TFSend;

implementation

uses uMain;

{$R *.lfm}

end.

