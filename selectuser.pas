unit selectuser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  CheckLst, uselplat,umain;

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
var i,j,PL:integer;
begin
  //Email
  KolOnPlat[0]:=0;
  for PL:=1 to 3 do //перебираем платформы
  if platsel[PL]=true then begin //если платформу выбрали
  for i:=KolOnPlat[Pl-1] to KolOnPlat[Pl]-1 do //перебираем акки на плат
   if resip[i].Checked=true then
    inc(KolRes[PL]); //считаем кол-во выделенных
  SetLength(ResAdr[PL],KolRes[PL]);//устанавливаем размер массива
   j:=0;
  for i:=KolOnPlat[Pl-1] to KolOnPlat[Pl]-1 do
   if resip[i].Checked=true then begin
    ResAdr[PL][j]:=resip[i].Caption; //записываем данные в массив
    inc(j);
   end;
  end;

  If (KolRes[1]=0) and (KolRes[2]=0) and (Kolres[3]=0) then begin
   ShowMessage('Выберите хотя бы одного получателя!');
   exit;
  end;

  if platsel[3]=true then //считываем URL
    for i:=0 to j-1 do
      with fUsers do begin
      SQLQ.Close;
      SQLQ.SQL.Text:='select Вебхук from Адреса where Пользователь = :L and Данные=:w';
      SQLQ.ParamByName('L').AsString :=Name;
      SQLQ.ParamByName('w').AsString :=ResAdr[3][i];
      SQLQ.Open;
      ResAdr[3][i]:=FUsers.Decipher(SQLQ.Fields.FieldByName('Вебхук').AsString,'2946');
    end;

  fSelectU.Hide;
  with FSend do
  if platsel[1]=false then begin
   LTopic.Visible:=false;
   ETopic.Visible:=false;
  end
  else begin
   LTopic.Visible:=true;
   ETopic.Visible:=true;
  end;
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
var i,PL,x,yn,j:integer; // i,j счетчики адресов, PL счетчик платформ
                       //x переменная верт. расп, yn отступ для названия
begin
  ActiveControl := nil;
  for i:= Field.ControlCount - 1 downto 0 do
    Field.Controls[i].Free;
  KolRes[1]:=0;
  for i:=1 to 3 do SetLength(ResAdr[i],0);
  FSend.BDellClick(Sender);

  // считаем количество адресов вообще
  with fUsers do begin
  SQLQ.Close;
  SQLQ.SQL.Text:='select Count(*) as Количество from Адреса where Пользователь = :L';
  SQLQ.ParamByName('L').AsString :=Name;
  SQLQ.Open;
  Kol:=SQLQ.Fields.FieldByName('Количество').AsInteger;
  end;
  SetLength(resip,Kol);

  //Заполняем адреса с разделением по платформам
  i:=0;x:=0;yn:=20;
  KolOnPlat[1]:=0;KolOnPlat[2]:=0;KolOnPlat[3]:=0;
  for PL:=1 to 3 do
  if platsel[Pl]=true then begin
   platname[Pl]:=TLabel.Create(self);    //Название платформы
   platname[Pl].Parent:=Field;
   platname[Pl].Top:=x;
   platname[Pl].Left:=yn;
   platname[Pl].Caption:=n[PL];
   platname[Pl].Font.Style:=[fsBold];
   x:=x+16;

   //Заполнение адресов
   j:=0;
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
     inc(i);inc(j); SQLQ.Next; x:=x+16;
     end;
    end;
   KolOnPlat[PL]:=j;
    x:=x+16;  //Пустая строка
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
  fSelplat.BMail.Visible:=platsel[1];
  fSelplat.BVK.Visible:=platsel[2];
  fSelplat.BDiscord.Visible:=platsel[3];
  fSelplat.Show;
end;

end.

