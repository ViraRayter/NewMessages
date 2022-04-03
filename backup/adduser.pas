unit adduser;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TfAddUser }

  TfAddUser = class(TForm)
    bAdd: TButton;
    bBack: TButton;
    eUserName: TEdit;
    Image1: TImage;
    Label1: TLabel;
  private

  public

  end;

var
  fAddUser: TfAddUser;

implementation

{$R *.lfm}

end.

