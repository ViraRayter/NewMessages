unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ExtDlgs, SelectUser, UEnd, users, LazUTF8, uImage, IdAttachmentFile, Discord;

type

  { TFSend }

  TFSend = class(TForm)
    BGo: TButton;
    BBack: TButton;
    ETopic: TEdit;
    EURL: TEdit;
    Fon: TImage;
    LText: TLabel;
    LAdd: TLabel;
    LTopic: TLabel;
    MText: TMemo;
    procedure BBackClick(Sender: TObject);
    procedure BGoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FSend: TFSend;

implementation

{$R *.lfm}

{ TFSend }

procedure TFSend.BBackClick(Sender: TObject);
begin
  FSelectU.Show;
  FSend.Hide;
end;

procedure TFSend.BGoClick(Sender: TObject);
var
  Discord: TDiscordMessage;
  Embeds: TDiscordEmbeds;
  DisImage: TDiscrodEmbedsImage;
  i: integer;
begin
  if UTF8Length(MText.Lines.Text) = 0 then
  begin
    ShowMessage('Вы не ввели сообщение!');
    exit;
  end;

  // e-mail
  textm:= MText.Text;
  if platsel[1]=true then
  begin
    topic:=ETopic.Caption;
  end;
  Filepath:=EURL.Text;

  // Дискорд
  if platsel[3]=true then
  begin
    for i:=0 to KolRes[3]-1 do
    begin
      Discord:=TDiscordMessage.Create(ResAdr[3][i]);
      try

        Discord.Content:=MText.Lines.Text;
        if not( EURL.Text='') then   begin
          Embeds := TDiscordEmbeds.Create;
          DisImage := TDiscrodEmbedsImage.Create;
          DisImage.URL :=Filepath;
          Embeds.SetImage(DisImage);
          FreeAndNil(Disimage);
          Discord.AddEmbeds(Embeds);
          FreeAndNil(Embeds);
        end;
        Discord.SendMessage;
      finally
        FreeAndNil(Discord);
      end;
    end;
  end;

  FEnd.Show;
  FEnd.LEnd.Caption:='Рассылка закончилась';
  FSend.Hide;
end;

procedure TFSend.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TFSend.FormShow(Sender: TObject);
begin
  ETopic.Text:='';
  MText.Text:='';
  EURL.Text:='';
  ActiveControl := nil;

end;

end.

