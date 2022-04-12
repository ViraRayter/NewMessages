unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, AddUser,umain;

type

  { TfSelectU }

  TfSelectU = class(TForm)
    BBack: TButton;
    BAdd: TButton;
    BNext: TButton;
    Fon: TImage;
    Label1: TLabel;
    LCheck: TLabel;
    Field: TScrollBox;
    procedure BAddClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fSelectU: TfSelectU;

implementation

uses usend,users;
{$R *.lfm}

{ TfSelectU }


procedure TfSelectU.BNextClick(Sender: TObject);
begin
  fSelectU.Hide;
  FSend.Show;
end;

procedure TfSelectU.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CloseAction:=caNone;
end;

procedure TfSelectU.FormShow(Sender: TObject);
const n:array[1..3] of string = ('E-mail','VK','Discord');
var i,PL,x,yn,yr:integer;
begin
  ActiveControl := nil;
  with fUsers do begin
  SQLQ.Close;
  SQLQ.SQL.Text:='select Count(*) as Количество from Адреса where Пользователь = :L';
  SQLQ.ParamByName('L').AsString :=Name;
  SQLQ.Open;
  Kol:=SQLQ.Fields.FieldByName('Количество').AsInteger;
  end;
  SetLength(resip,Kol);
  i:=0;x:=0;yn:=20;
  for PL:=1 to 3 do
  if platsel[Pl]=true then begin
   platname[Pl]:=TLabel.Create(self);
   platname[Pl].Parent:=Field;
   platname[Pl].Top:=x;
   platname[Pl].Left:=yn;
   platname[Pl].Caption:=n[PL];
   platname[Pl].Font.Style:=[fsBold];
   x:=x+16;
   with fUsers do begin
   SQLQ.Close;
   SQLQ.SQL.Text:='select Данные from Адреса where Пользователь = :L  and Платформа= :p';
   SQLQ.ParamByName('L').AsString :=Name;
   SQLQ.ParamByName('p').AsInteger :=PL;
   SQLQ.Open;
   SQLQ.First;
   while not SQLQ.EOF do begin
     with FSelectU do begin
     resip[i]:=TCheckBox.Create(self);
     resip[i].Parent:=Field;
     resip[i].Top:=x;
     resip[i].Caption:=fUsers.SQLQ.Fields.FieldByName('Данные').AsString;
     end;
     inc(i); SQLQ.Next; x:=x+16;
     end;
    end;
    x:=x+16;
  end;
end;

procedure TfSelectU.BBackClick(Sender: TObject);
begin
  Main.Show;
  fSelectU.Hide;
end;

procedure TfSelectU.BAddClick(Sender: TObject);
begin
  fSelectU.Hide;
  fAddUser.Show;
end;

end.

