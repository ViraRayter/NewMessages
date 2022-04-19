unit uselplat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFSelPlat }

  TFSelPlat = class(TForm)
    BMail: TButton;
    BVK: TButton;
    BDiscord: TButton;
    BBack: TButton;
    Fon: TImage;
    LSelect: TLabel;
    procedure BBackClick(Sender: TObject);
    procedure BMailClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FSelPlat: TFSelPlat;

implementation
  uses selectuser,adduser,users;
{$R *.lfm}

{ TFSelPlat }

procedure TFSelPlat.BBackClick(Sender: TObject);
begin
  fSelplat.Hide;
  FSelectU.Show;
end;

procedure TFSelPlat.BMailClick(Sender: TObject);
begin
  fAddUser.Show;
  fSelplat.Hide;
  plat:=0;
  if Sender=BMail then begin
    fAddUser.EWebhook.Visible:=false;
    plat:=3
  end;
  if Sender=BVK then begin
    fAddUser.EWebhook.Visible:=false;
    plat:=3
  end;
  if Sender=BDiscord then begin
    fAddUser.EWebhook.Visible:=true;
    plat:=3
  end;
end;

procedure TFSelPlat.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Закрыть приложение?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then FUsers.Close
  else CanClose:=false;
end;

procedure TFSelPlat.FormShow(Sender: TObject);
begin
  ActiveControl := nil;
end;

end.

