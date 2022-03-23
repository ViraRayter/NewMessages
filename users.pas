unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx;

type

  { TfUsers }

  TfUsers = class(TForm)
    BBack: TButton;
    bNext: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
  private

  public

  end;

var
  fUsers: TfUsers;

implementation
{$R *.lfm}

{ TfUsers }

end.

