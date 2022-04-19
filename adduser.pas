unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users, SQLite3Conn, SQLDB,uselplat;

type

  { TfAddUser }

  TfAddUser = class(TForm)
    BAdd: TButton;
    BBack: TButton;
    EWebhook: TEdit;
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
  fselplat.Show;
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
  EWebhook.Text:='';
  ActiveControl := nil;
end;

procedure TfAddUser.BAddClick(Sender: TObject);
begin
  if (EUserName.Text='') or ((plat=3) and (EWebhook.Text='')) then begin
  ShowMessage('Введите данные!');
  exit;
  end;
  with fUsers do begin
   SQLQ.Close;
   SQLQ.SQL.Text:='insert into Адреса(Данные,Пользователь,Платформа,Вебхук) values(:n,:p,:pl,:w);';
   SQLQ.ParamByName('n').AsString:=EUserName.Text;
   SQLQ.ParamByName('p').AsString:=Name;
   SQLQ.ParamByName('pl').AsInteger:=plat;
   SQLQ.ParamByName('w').AsString:=Encipher(EWebhook.Text,'2946');
   SQLQ.ExecSQL;
   SQLT.Commit;
  end;
  fselectu.Show;
  fAddUser.Hide;
end;

end.

