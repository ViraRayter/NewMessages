unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFSend }

  TFSend = class(TForm)
    Button1: TButton;
    ETopic: TEdit;
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

