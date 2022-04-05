unit USend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons,SelectUser,UEnd,users;

type

  { TFSend }

  TFSend = class(TForm)
    BDell: TSpeedButton;
    BGo: TButton;
    BBack: TButton;
    ETopic: TEdit;
    Fon: TImage;
    LText: TLabel;
    LAdd: TLabel;
    LTopic: TLabel;
    MText: TMemo;
    BAdd: TSpeedButton;
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
begin
  FEnd.Show;
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

end.

