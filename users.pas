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
    LMain: TLabel;
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
  plat:0..3;
implementation
uses md5;
{$R *.lfm}

{ TfUsers }

function hash(password: string):string;
begin
 password:=MD5Print(MD5String(password));
 password:=MD5Print(MD5String(password));
 hash:=copy(password,1,5)+'h3'+copy(password,6,17)+'7b'+copy(password,23,10);
end;

procedure TfUsers.BNextClick(Sender: TObject);
begin
 if Plat=0 then begin    //Авторизация в нашем аккаунте
  SQLQ.Close;
  SQLQ.SQL.Text:='select * from Пользователи where Логин = :L';
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
     SQLQ.ParamByName('p').AsString := hash(EPassword.Text);
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
    If SQLQ.Fields.FieldByName('Пароль').AsString<>hash(EPassword.Text) then
     Begin
     ShowMessage('Неправильный пароль');
     exit;
     end;
  Name:=EName.Text;
  end
  //Внесение данных от аккаунтов в сети
  else begin
    SQLQ.Close;

     case Plat of
     1: begin
       SQLQ.SQL.Text := 'update Пользователи Set E-mail = :n , Пароль_E-mail=:p where Логин=:name';
     end;
     2: begin
       SQLQ.SQL.Text := 'update Пользователи Set Логин_ВК = :n , Пароль_ВК=:p where Логин=:name';
     end;
     3: begin
        SQLQ.SQL.Text := 'update Пользователи Set Логин_Discord = :n , Пароль_Discord=:p where Логин=:name';
     end;
     end;
     SQLQ.ParamByName('n').AsString := EName.Text;
     SQLQ.ParamByName('p').AsString := hash(EPassword.Text);
     SQLQ.ParamByName('name').AsString := Name;
     SQLQ.ExecSQL;
     SQLT.Commit;
  end;
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
 Main.Show;
 FUsers.Hide;
end;

end.

