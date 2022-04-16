unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ExtDlgs, SelectUser, UEnd, users, LazUTF8, uImage, IdAttachmentFile;

type

  { TFSend }

  TFSend = class(TForm)
    BDell: TSpeedButton;
    BGo: TButton;
    BBack: TButton;
    ETopic: TEdit;
    Fon: TImage;
    Image: TImage;
    LText: TLabel;
    LAdd: TLabel;
    LTopic: TLabel;
    MText: TMemo;
    BAdd: TSpeedButton;
    OpenPicture: TOpenPictureDialog;
    procedure BAddClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
    procedure BDellClick(Sender: TObject);
    procedure BGoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ImageDblClick(Sender: TObject);
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

procedure TFSend.BDellClick(Sender: TObject);
begin
  BDell.Visible:=False;
  Image.Visible:=False;
  BAdd.Visible:=True;
  LAdd.Visible:=True;
  OpenPicture.FileName:='';
  Image.Picture:=nil;
end;

procedure TFSend.BAddClick(Sender: TObject);
begin
  ShowMessage('Внимание!'+#13+'На некоторых почтовых серверах изображение может не отображаться.');
  if OpenPicture.Execute then
  begin
    Image.Picture.LoadFromFile(OpenPicture.FileName);
    LAdd.Visible:=False;
    BAdd.Visible:=False;
    Image.Visible:=True;
    BDell.Visible:=True;
  end;
end;

procedure TFSend.BGoClick(Sender: TObject);
begin
  if UTF8Length(MText.Lines.Text) = 0 then
  begin
    ShowMessage('Вы не ввели сообщение!');
    exit;
  end;
  textm:= MText.Text;
  topic:=ETopic.Caption;
  if OpenPicture.FileName<>'' then
   Filepath:=OpenPicture.FileName;
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
  BDell.Visible:=false;
  ActiveControl := nil;
end;

procedure TFSend.ImageDblClick(Sender: TObject);
begin
  fImage.Height:=496;
  fImage.Image.Height:=496;
  fImage.Image.Picture:=fSend.Image.Picture;
  if fImage.Image.Picture.Height>=fImage.Image.Height then
    fImage.Image.Width:=fImage.Image.Height * fImage.Image.Picture.Width div fImage.Image.Picture.Height
  else
    begin
      fImage.Image.Width:=fImage.Image.Picture.Width;
      fImage.Image.Height:=fImage.Image.Picture.Height;
    end;

  fImage.Width:=fImage.Image.Width;
  fImage.Height:=fImage.Image.Height;
  fImage.ShowModal;
end;

end.

