unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, Umain, SQLDB, SQLite3Conn;

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
    SQLC: TSQLite3Connection;
    SQLQ: TSQLQuery;
    SQLT: TSQLTransaction;
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fUsers: TfUsers;
  Name:string;
implementation
{$R *.lfm}

{ TfUsers }

procedure TfUsers.BNextClick(Sender: TObject);
begin
  SQLQ.Close;
  SQLQ.SQL.Text:='select * from Пользоаватели where Логин = :L';
  SQLQ.ParamByName('L').AsString :=EName.Text;
  SQLQ.Open;
  // Если аккаунта не существует
  if SQLQ.EOF then
   if MessageDlg('Такого аккаунта не существует'+#13+'Создать?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes
   then
     try
     SQLQ.Close;
     SQLQ.SQL.Text := 'insert into Пользователи(Логин,Пароль) values(:n,:p);';
     SQLQ.ParamByName('n').AsString := EName.Text;
     SQLQ.ParamByName('p').AsString := EPassword.Text;
     SQLQ.ExecSQL;
     SQLT.Commit;
     ShowMessage('Аккаунт успешно создан');
     except
      ShowMessage('Ошибка создания аккаунта');
   end
   else exit
  //Если аккаунт существует
  else
   //Проверяем правильность пароля
    If SQLQ.Fields.FieldByName('Пароль').AsString<>EPassword.Text then
     Begin
     ShowMessage('Неправильный пароль');
     exit;
     end;
  Name:=EName.Text;
  Main.Show;
  FUsers.Hide;
end;

procedure TfUsers.FormCreate(Sender: TObject);
begin
    try
    SQLC.Open;
    SQLT.Active := True;
  except   // если не удалось то выводим сообщение о ошибке
    ShowMessage('Ошибка подключения к базе!');
  end;
end;

procedure TfUsers.FormShow(Sender: TObject);
begin
  EName.Text:='';
  EPassword.Text:='';
  ActiveControl := nil;
end;

procedure TfUsers.BBackClick(Sender: TObject);
begin
 BNextClick(Sender);
end;

end.

