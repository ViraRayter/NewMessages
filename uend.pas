unit uend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { Tfend }

  Tfend = class(TForm)
    BExit: TButton;
    Fon: TImage;
    LEnd: TLabel;
    procedure BExitClick(Sender: TObject);
  private

  public

  end;

var
  fend: Tfend;

implementation

uses umain;
{$R *.lfm}

{ Tfend }

procedure Tfend.BExitClick(Sender: TObject);
begin
  fend.hide;
  Main.Show;
end;

end.

