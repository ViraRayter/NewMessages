unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, Umain;

type

  { TfUsers }

  TfUsers = class(TForm)
    BBack: TButton;
    BNext: TButton;
    EName: TEdit;
    EPassword: TEdit;
    Fon: TImage;
    LName: TLabel;
    LPassword: TLabel;
    procedure BBackClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fUsers: TfUsers;

implementation
{$R *.lfm}

{ TfUsers }

procedure TfUsers.BNextClick(Sender: TObject);
begin
  Main.Show;
  FUsers.Hide;
end;

procedure TfUsers.FormShow(Sender: TObject);
begin
  EName.Text:='';
  EPassword.Text:='';
  ActiveControl := nil;
end;

procedure TfUsers.BBackClick(Sender: TObject);
begin
 BNextClick(Sender);
end;

end.

