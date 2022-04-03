unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, AddUser, uSend, Users;

type

  { TfSelectU }

  TfSelectU = class(TForm)
    bBack: TButton;
    bAdd: TButton;
    bNext: TButton;
    CheckUsers: TCheckListBox;
    Image1: TImage;
    Label1: TLabel;
    procedure bAddClick(Sender: TObject);
    procedure bBackClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
  private

  public

  end;

var
  fSelectU: TfSelectU;

implementation

uses uMain;
{$R *.lfm}

{ TfSelectU }


procedure TfSelectU.bNextClick(Sender: TObject);
begin
<<<<<<< HEAD
  FSend.Show;
  fSelectU.Hide;
=======
  fSelectU.Visible:=false;
  FSend.ShowModal;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end;

procedure TfSelectU.bBackClick(Sender: TObject);
begin
<<<<<<< HEAD
  Main.Show;
  fSelectU.Hide;
=======
  fSelectU.Visible:=false;
  fUsers.ShowModal;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end;

procedure TfSelectU.bAddClick(Sender: TObject);
begin
<<<<<<< HEAD
  fAddUser.Show;
  fSelectU.Hide;
=======
  fSelectU.Visible:=False;
  fAddUser.ShowModal;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end;

end.

