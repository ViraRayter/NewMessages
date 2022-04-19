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
    procedure BAuthMailClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
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
 if (BMail.Checked = False) and (BVK.Checked = False) and (BDiscord.Checked = False) then
 begin
   ShowMessage('Выберите хотя бы одну платформу!');
   exit;
 end;
 FSelectU.Show;
 Main.Hide;
end;

procedure TMain.BVKClick(Sender: TObject);
begin
   with FUsers do begin
    SQLQ.Close;
    SQLQ.SQL.Text:='select * from Пользователи where Логин = :L';
    SQLQ.ParamByName('L').AsString :=Name;
    SQLQ.Open;
   end;
   if BVK.Checked=true then
   if FUsers.SQLQ.Fields.FieldByName('Логин_ВК').AsString='' then begin
   beep;
   ShowMessage('Введите данные от аккаунта!');
   BVK.Checked:=false;
   BAuthMailClick(BAuthVK);
   end;
   FUsers.SQLQ.Close;
end;

procedure TMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  platsel[1]:=false;
  platsel[2]:=false;
  platsel[3]:=false;
  BMail.Checked:=False;
  BVk.Checked:=False;
  BDiscord.Checked:=False;
  ActiveControl := nil;
end;

procedure TMain.BAuthMailClick(Sender: TObject);
begin
  if Sender = BAuthMail then begin
   ShowMessage('Внимание!'+#13+'Для того, чтобы провести рассылку,'
   +'вам необходимо в настройках почты включить "Доступ к почтовому ящику с помощью почтовых клиентов".');
   Plat:=1;
   FUsers.LMain.Caption:='Авторизация в e-mail';
   FUsers.GB.Visible:=true;
   FUsers.EName.TextHint:='пользователь@имя.почты';
   end;
   if Sender = BAuthVK then
   begin Plat:=2;
    FUsers.LMain.Caption:='Авторизация ВК';
    FUsers.GB.Visible:=false;
    FUsers.EName.TextHint:='id99999999';
   end;
end;

procedure TMain.BBackClick(Sender: TObject);
begin
 FUsers.Show;
 Plat:=0;
 Name:='';
 FUsers.EName.TextHint:='';
 FUsers.GB.Visible:=false;
 FUsers.LMain.Caption:='';
 FUsers.BBack.Visible:=false;
 Main.Hide;
end;


procedure TMain.BMailClick(Sender: TObject);
begin
   with FUsers do begin
    SQLQ.Close;
    SQLQ.SQL.Text:='select * from Пользователи where Логин = :L';
    SQLQ.ParamByName('L').AsString :=Name;
    SQLQ.Open;
    email:=SQLQ.Fields.FieldByName('Email').AsString;
    site:=SQLQ.Fields.FieldByName('Сервер').AsString;
    port:=SQLQ.Fields.FieldByName('Порт').AsInteger;
    SQLQ.Close;
   end;
   if BMail.Checked=true then
     if email='' then begin       //Если нет данных от аккаунта
     beep;
     ShowMessage('Введите данные от аккаунта!');
     BMail.Checked:=false;
     BAuthDiscordClick(BAuthMail);
   end;
end;

{ TMain }


{ TMain }


end.

