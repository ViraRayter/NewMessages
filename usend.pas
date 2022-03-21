unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFSend }

  TFSend = class(TForm)
    Button1: TButton;
    ETopic: TEdit;
    Image1: TImage;
    LText: TLabel;
    LTopic: TLabel;
    MText: TMemo;
  private

  public

  end;

var
  FSend: TFSend;

implementation

{$R *.lfm}

end.

