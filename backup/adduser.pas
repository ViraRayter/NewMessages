unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users, SQLite3Conn, SQLDB;

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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfAddUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CanClose:=false;
end;

procedure TfAddUser.FormShow(Sender: TObject);
begin
  EUserName.Text:='';
  Plat.ItemIndex:=0;
  ActiveControl := nil;
end;

procedure TfAddUser.BAddClick(Sender: TObject);
begin
  with fUsers do begin
   SQLQ.Close;
   SQLQ.SQL.Text:='insert into Адреса(Данные,Пользователь,Платформа) values(:n,:p,:pl);';
   SQLQ.ParamByName('n').AsString:=EUserName.Text;
   SQLQ.ParamByName('p').AsString:=Name;
   SQLQ.ParamByName('pl').AsInteger:=Plat.ItemIndex+1;
   SQLQ.ExecSQL;
   SQLT.Commit;
  end;
   BBackClick(Sender);
end;

end.

