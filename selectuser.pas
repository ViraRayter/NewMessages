unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, AddUser, uSend;

type

  { TfSelectU }

  TfSelectU = class(TForm)
    BBack: TButton;
    BAdd: TButton;
    BNext: TButton;
    CheckUsers: TCheckListBox;
    Fon: TImage;
    LCheck: TLabel;
    procedure BAddClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
  private

  public

  end;

var
  fSelectU: TfSelectU;

implementation

uses uMain;
{$R *.lfm}

{ TfSelectU }


procedure TfSelectU.BNextClick(Sender: TObject);
begin
  fSelectU.Visible:=false;
  FSend.ShowModal;
end;

procedure TfSelectU.BBackClick(Sender: TObject);
begin
<<<<<<< HEAD
  Main.Show;
  fSelectU.Hide;
=======
  fSelectU.Visible:=false;
  fUsers.ShowModal;
>>>>>>> parent of af44fe1 (Созданы некоторые переходы между формами)
end;

procedure TfSelectU.BAddClick(Sender: TObject);
begin
  fSelectU.Visible:=False;
  fAddUser.ShowModal;
end;

end.

