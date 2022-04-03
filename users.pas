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
<<<<<<< HEAD
  Main.Show;
  fUsers.Hide;
=======
  fUsers.Visible:=false;
  fSelectU.ShowModal;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end;

end.

