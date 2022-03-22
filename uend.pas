unit uend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { Tfend }

  Tfend = class(TForm)
    bExit: TButton;
    Image1: TImage;
    LabelEnd: TLabel;
    procedure bExitClick(Sender: TObject);
  private

  public

  end;

var
  fend: Tfend;

implementation

uses usend;
{$R *.lfm}

{ Tfend }

procedure Tfend.bExitClick(Sender: TObject);
begin
  fend.Visible:=false;
  fsend.ShowModal;
end;

end.

