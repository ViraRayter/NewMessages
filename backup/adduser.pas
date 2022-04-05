unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users;

type

  { TfAddUser }

  TfAddUser = class(TForm)
    BAdd: TButton;
    BBack: TButton;
    Plat: TComboBox;
    EUserName: TEdit;
    Fon: TImage;
    LUserName: TLabel;
    procedure BAddClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TfAddUser.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TfAddUser.FormShow(Sender: TObject);
begin
  EUserName.Text:='';
  Plat.ItemIndex:=0;
  ActiveControl := nil;
end;

procedure TfAddUser.BAddClick(Sender: TObject);
begin
  BBackClick(Sender);
end;

end.

