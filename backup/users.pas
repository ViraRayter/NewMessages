unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, IdSMTP, IdSSLOpenSSL, IdMailBox, IdMessage, Umain, SQLDB,
  SQLite3Conn, IdText, IdExplicitTLSClientServerBase, LazUTF8, IdAttachmentFile;

type

  { TfUsers }
  TResipArray = array of  TCheckBox;
  TResAdrArray = array of string[255];
  TfUsers = class(TForm)
    BNext: TButton;
    EName: TEdit;
    EPassword: TEdit;
    Fon: TImage;
    IdMess: TIdMessage;
    IdSMTP: TIdSMTP;
    IdOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    LName: TLabel;
    LPassword: TLabel;
    SQLC: TSQLite3Connection;
    SQLQ: TSQLQuery;
    SQLT: TSQLTransaction;
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Encipher(toCode, K: string): string;
    function  Decipher(toDecode, K: string): string;
  private

  public

  end;
const
  email:string ='newmessagesv@rambler.ru';
  site:string='smtp.rambler.ru';
  port:integer=465;
  password:string='testpassword123V';
var
  fUsers: TfUsers;
  Name,textm,topic,filepath:string;
  plat:0..3; //выбор платформы при авторизации
  platsel: array[1..3] of boolean;//выбранные платформы для рассылки
  platname: array[1..3] of TLabel;//Переменные для надписей на SelectU
  KolRes:array[1..3]of integer; //Количество выбранных адресов (по платформе)
  KolOnPlat:array[0..3] of integer;   //Количество адресов по платформе
  resip: array [1..3] of TResipArray;//чекбоксы получателей
  Kol:integer; //Kol количество адресов в базе пользователя
  ResAdr:array [1..3] of TResAdrArray;//выбранные адреса для email, вебхуки для Дискорда
  errors:integer;
implementation
uses md5;
{$R *.lfm}

{ TfUsers }

function hash(password: string):string; // хеширование паролей
begin
 password:=MD5Print(MD5String(password));
 password:=MD5Print(MD5String(password));
 hash:=copy(password,1,5)+'e3'+copy(password,6,17)+'7b'+copy(password,23,10);
end;


function TfUsers.Encipher(toCode, K: string): string; // шифрование
var i, T: integer;
begin
  for i := 1 to length(toCode) do begin
    T := (Ord(toCode[ i ])

      +
      (Ord(K[(pred(i) mod length(K)) + 1]) - Ord('0'))

         );
    if T >= 127 then
     T:=T-126+32;
    toCode[ i ] := Chr(T);
  end;
  Encipher := toCode;
end;

function TfUsers.Decipher(toDecode, K: string): string; // расшифрование
var i, T: integer;
begin
  for i := 1 to length(toDecode) do begin
    T := (Ord(toDecode[i])

      -
      (Ord(K[(pred(i) mod length(K)) + 1]) - Ord('0'))

         );
    if T < 32 then T:=T+126-32;
    toDecode[ i ] := Chr(T);
  end;
  Decipher := toDecode;
end;

procedure TfUsers.BNextClick(Sender: TObject);
begin
 if Plat=0 then begin    //Авторизация в нашем аккаунте

  if UTF8Length(EName.Text)<5 then
  begin
    ShowMessage('Логин не может быть меньше 5 символов!');
    EName.SetFocus;
    exit;
  end;

  if UTF8Length(EPassword.Text)<8 then
  begin
    ShowMessage('Пароль не может быть меньше 8 символов!');
    EPassword.SetFocus;
    exit;
  end;

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

