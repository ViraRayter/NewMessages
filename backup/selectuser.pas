unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, AddUser;

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

uses usend,users;
{$R *.lfm}

{ TfSelectU }


procedure TfSelectU.BNextClick(Sender: TObject);
begin
  FSend.ShowModal;
  fSelectU.Hide;
end;

procedure TfSelectU.BBackClick(Sender: TObject);
begin
  fUsers.ShowModal;
  fSelectU.Hide;
end;

procedure TfSelectU.BAddClick(Sender: TObject);
begin
  fAddUser.ShowModal;
  fSelectU.Hide;
end;

end.

