unit users;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx;

type

  { TfUsers }

  TfUsers = class(TForm)
    bNext: TButton;
    Choose: TCheckComboBox;
    Label1: TLabel;
  private

  public

  end;

var
  fUsers: TfUsers;

implementation
{$R *.lfm}

{ TfUsers }

end.

