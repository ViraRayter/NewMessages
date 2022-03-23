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
    BNext: TButton;
    EName: TEdit;
    EPass: TEdit;
    Fon: TImage;
    LName: TLabel;
    LPass: TLabel;
  private

  public

  end;

var
  fUsers: TfUsers;

implementation
{$R *.lfm}

{ TfUsers }

end.

