unit uend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users, IdText, IdExplicitTLSClientServerBase,IdAttachmentFile;

type

  { Tfend }

  Tfend = class(TForm)
    BExit: TButton;
    Fon: TImage;
    LEnd: TLabel;
    procedure BExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fend: Tfend;

implementation

uses umain;
{$R *.lfm}

{ Tfend }

procedure Tfend.BExitClick(Sender: TObject);
begin
  textm:='';
  topic:='';
  filepath:='';
  fend.hide;
  Main.Show;
end;

procedure Tfend.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure Tfend.FormShow(Sender: TObject);
var i:integer;
  password:string;
  txtpart, htmpart : TIdText;
  imgpart : TIdAttachmentFile;
begin
  ActiveControl:= nil;

  with FUsers do begin
   SQLQ.Close;
   SQLQ.SQL.Text:='select Пароль_Email from Пользователи where Логин = :L';
   SQLQ.ParamByName('L').AsString :=Name;
   SQLQ.Open;
   password:=FUsers.Decipher(FUsers.SQLQ.Fields.FieldByName('Пароль_Email').AsString,'2946');
   SQLQ.Close;

   IdSMTP.Host :=site;
   IdSMTP.Port := port;
   IdSMTP.Username := email; //имя аккаунта
   IdSMTP.Password := password;  //пароль аккаунта

   IdMess.Clear();
   idMess.CharSet:='UTF8'; //котировка
   idMess.Body.Text:= textm; //текст письма
   idMess.Subject:=topic; //тема
   IdMess.From.Address:=email; //отправитель
   IdMess.ContentType := 'multipart/mixed';  //хз

   txtpart := TIdText.Create(IdMess.MessageParts);
   txtpart.ContentType := 'text/plain';

   txtpart := TIdText.Create(IdMess.MessageParts);
   txtpart.ContentType := 'multipart/related; type="text/html"';

   htmpart := TIdText.Create(IdMess.MessageParts, nil);
   htmpart.ContentType := 'text/html; charset=UTF-8'; // обяз кодировка
   htmpart.Body.Add('<html><head></head><body>');
   if filepath<>'' then
     htmpart.Body.Add('<img src="cid:'+filepath+'" /><br />');
   for i:=1 to length(textm) do
    if textm[i]=#13 then begin
      delete(textm,i,1);
      insert('<br />',textm,i);
    end;
   htmpart.Body.Add(textm+'</body></html>');
   htmpart.ParentPart := 1;

   if filepath<>'' then begin
   imgpart := TIdAttachmentFile.Create(IdMess.MessageParts, filepath);
   imgpart.ContentType := 'image/jpeg';
   imgpart.ContentDisposition := 'inline';
   imgpart.ContentID := filepath;
   imgpart.DisplayName := filepath;
   imgpart.ParentPart := 1;
   end;

   IdSMTP.Connect();
   if IdSMTP.Connected then
     for i:=0 to KolRes[1]-1 do begin
      IdMess.Recipients.EMailAddresses:=ResAdr[i];
      IdSMTP.Send(IdMess);
    end
   else ShowMessage('Подключиться к почте не удалоссь');
   IdSMTP.Disconnect();


  end;
end;

end.

