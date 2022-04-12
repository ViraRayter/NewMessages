unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TMain }

  TMain = class(TForm)
    BBack: TButton;
    BNext: TButton;
    Fon: TImage;
    LMain: TLabel;
    BMail: TToggleBox;
    BVK: TToggleBox;
    BDiscord: TToggleBox;
    BAuthMail: TSpeedButton;
    BAuthVK: TSpeedButton;
    BAuthDiscord: TSpeedButton;
    procedure BAuthDiscordClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
    procedure BDiscordClick(Sender: TObject);
    procedure BMailClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BVKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Main: TMain;

implementation
uses users,selectuser;
{$R *.lfm}

{ TMain }

procedure TMain.BNextClick(Sender: TObject);
begin
 platsel[1]:=BMail.Checked;
 platsel[2]:=BVK.Checked;
 platsel[3]:=BDiscord.Checked;
 FSelectU.Show;
 Main.Hide;
end;

procedure TMain.BVKClick(Sender: TObject);
begin
   if BVK.Checked=true then
   if FUsers.SQLQ.Fields.FieldByName('Логин_ВК').AsString='' then begin
   beep;
   ShowMessage('Введите данные от аккаунта!');
   BVK.Checked:=false;
   BAuthDiscordClick(BAuthVK);
   end;
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  BMail.Checked:=False;
  BVk.Checked:=False;
  BDiscord.Checked:=False;
  ActiveControl := nil;
  with FUsers do begin
  SQLQ.Close;
  SQLQ.SQL.Text:='select * from Пользователи where Логин = :L';
  SQLQ.ParamByName('L').AsString :=Name;
  SQLQ.Open;
  end;
end;

procedure TMain.BAuthDiscordClick(Sender: TObject);
begin
if Sender = BAuthMail then
begin Plat:=1; FUsers.LMain.Caption:='Авторизация в e-mail' end;
if Sender = BAuthVK then
begin Plat:=2; FUsers.LMain.Caption:='Авторизация ВК' end;
if Sender = BAuthDiscord then
begin Plat:=3; FUsers.LMain.Caption:='Авторизация в Дискорд' end;
 FUsers.Show;
 FUsers.BBack.Visible:=true;
 Main.Hide;
end;

procedure TMain.BBackClick(Sender: TObject);
begin
 FUsers.Show;
 Plat:=0;
 Name:='';
 FUsers.LMain.Caption:='';
 FUsers.BBack.Visible:=false;
 Main.Hide;
end;

procedure TMain.BDiscordClick(Sender: TObject);
begin
   if BDiscord.Checked=true then
   if FUsers.SQLQ.Fields.FieldByName('Логин_Discord').AsString='' then begin
   beep;
   ShowMessage('Введите данные от аккаунта!');
   BDiscord.Checked:=false;
   BAuthDiscordClick(BAuthDiscord);
   end;
end;


procedure TMain.BMailClick(Sender: TObject);
begin
   if BMail.Checked=true then
   if FUsers.SQLQ.Fields.FieldByName('Email').AsString='' then begin
   beep;
   ShowMessage('Введите данные от аккаунта!');
   BMail.Checked:=false;
   BAuthDiscordClick(BAuthMail);
   end;
end;

{ TMain }


{ TMain }


end.

