unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TfAddUser }

  TfAddUser = class(TForm)
    BAdd: TButton;
    BBack: TButton;
    EUserName: TEdit;
    Fon: TImage;
    LUserName: TLabel;
    procedure BAddClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
  private

  public

  end;

var
  fAddUser: TfAddUser;

implementation
  uses SelectUser;
{$R *.lfm}

{ TfAddUser }

procedure TfAddUser.BBackClick(Sender: TObject);
begin
  fSelectU.Show;
  fAddUser.Hide;
end;

procedure TfAddUser.BAddClick(Sender: TObject);
begin
  BBackClick(Sender);
end;

end.

