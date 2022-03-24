unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, Selectuser;

type

  { TfUsers }

  TfUsers = class(TForm)
    BBack: TButton;
    bNext: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure bNextClick(Sender: TObject);
  private

  public

  end;

var
  fUsers: TfUsers;

implementation
{$R *.lfm}

{ TfUsers }

procedure TfUsers.bNextClick(Sender: TObject);
begin
  fUsers.Visible:=false;
  fSelectU.ShowModal;
end;

end.

