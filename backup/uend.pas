unit uend;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  users, IdText, IdExplicitTLSClientServerBase,IdAttachmentFile, tgsendertypes,fptelegram;

type

  { Tfend }
  TMyBot = class(TTelegramSender);
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
  { // код очистки бд
  with fUsers do begin
    SQlQ.Close;
    SQLQ.SQL.Text:='delete from Адреса';
    SQLQ.ExecSQL;
    SQLT.Commit;
  end;
  }

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
const AToken:string ='5307772407:AAFbFOnOzXOos6wnMCbmjFssimglfSy-AVs';
var i:integer;
  txtpart, htmpart : TIdText;
  imgpart : TIdAttachmentFile;
  ABot: TMyBot;
begin
  ActiveControl:= nil;

  if platsel[1]=true then
   with FUsers do begin
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
     htmpart.Body.Add('<img src="'+filepath+'" border="0">');
   for i:=1 to length(textm) do
    if textm[i]=#13 then begin
      delete(textm,i,1);
      insert('<br />',textm,i);
    end;
   htmpart.Body.Add(textm+'</body></html>');
   htmpart.ParentPart := 1;

   {if filepath<>'' then begin
   imgpart := TIdAttachmentFile.Create(IdMess.MessageParts, filepath);
   imgpart.ContentType := 'image/jpeg';
   imgpart.ContentDisposition := 'inline';
   imgpart.ContentID := filepath;
   imgpart.DisplayName := filepath;
   imgpart.ParentPart := 1;
   end;}
   try
   IdSMTP.Connect();
   for i:=0 to KolRes[1]-1 do begin
    IdMess.Recipients.EMailAddresses:=ResAdr[1][i];
    try
    IdSMTP.Send(IdMess);
    except
    inc(errors);
    end;
   end
   except
     ShowMessage('Подключиться к почте не удалоссь');
   end;
   IdSMTP.Disconnect();

  end;

  try
  ABot:=TMyBot.Create(AToken);
  for i:=0 to KolRes[2]-1 do begin
   if (filepath='') then
     ABot.sendMessage(StrToInt(ResAdr[2][i]), textm)
   else
      ABot.sendPhoto(StrToInt(ResAdr[2][i]), filepath, textm)
  end;
  finally
    ABot.Free;
  end;
end;

end.

