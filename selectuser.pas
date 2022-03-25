unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, AddUser;

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

uses usend,users;
{$R *.lfm}

{ TfSelectU }


procedure TfSelectU.bNextClick(Sender: TObject);
begin
  fSelectU.Visible:=false;
  FSend.ShowModal;
end;

procedure TfSelectU.bBackClick(Sender: TObject);
begin
  fSelectU.Visible:=false;
  fUsers.ShowModal;
end;

procedure TfSelectU.bAddClick(Sender: TObject);
begin
  fSelectU.Visible:=False;
  fAddUser.ShowModal;
end;

end.

