unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons,SelectUser,UEnd;

type

  { TFSend }

  TFSend = class(TForm)
    BAdd1: TSpeedButton;
    BGo: TButton;
    BBack: TButton;
    ETopic: TEdit;
    Fon: TImage;
    LText: TLabel;
    LAdd: TLabel;
    LTopic: TLabel;
    MText: TMemo;
    BAdd: TSpeedButton;
    procedure BBackClick(Sender: TObject);
    procedure BGoClick(Sender: TObject);
  private

  public

  end;

var
  FSend: TFSend;

implementation

{$R *.lfm}

{ TFSend }

procedure TFSend.BBackClick(Sender: TObject);
begin
  FSelectU.Show;
  FSend.Hide;
end;

procedure TFSend.BGoClick(Sender: TObject);
begin
  FEnd.Show;
  FSend.Hide;
end;

end.

