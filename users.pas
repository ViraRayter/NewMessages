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
    BNext: TButton;
    EName: TEdit;
    EPassword: TEdit;
    Fon: TImage;
    LName: TLabel;
    LPassword: TLabel;
    procedure BNextClick(Sender: TObject);
  private

  public

  end;

var
  fUsers: TfUsers;

implementation

uses uMain;
{$R *.lfm}

{ TfUsers }

procedure TfUsers.BNextClick(Sender: TObject);
begin
  Main.Show;
  fUsers.Hide;
end;

end.

