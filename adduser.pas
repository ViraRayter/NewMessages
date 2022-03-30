unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TfAddUser }

  TfAddUser = class(TForm)
    BAdd: TButton;
    BBack: TButton;
    EUserName: TEdit;
    Fon: TImage;
    LUserName: TLabel;
  private

  public

  end;

var
  fAddUser: TfAddUser;

implementation

{$R *.lfm}

end.

