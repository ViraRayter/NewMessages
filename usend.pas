unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, uEnd;

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
    procedure BGoClick(Sender: TObject);
  private

  public

  end;

var
  FSend: TFSend;

implementation

uses uMain;

{$R *.lfm}

{ TFSend }


procedure TFSend.BGoClick(Sender: TObject);
begin
  fEnd.ShowModal;
  fSend.Hide;
  Main.Show;
end;

end.

