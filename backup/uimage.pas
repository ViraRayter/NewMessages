unit uimage;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TfImage }

  TfImage = class(TForm)
    Image: TImage;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  fImage: TfImage;

implementation

{$R *.lfm}

{ TfImage }

procedure TfImage.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  fImage.Height:=496;
  Image.Height:=496;
end;

end.

