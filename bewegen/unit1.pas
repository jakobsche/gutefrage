unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Shape1: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses LCLType;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  case Key of
    VK_LEFT: Shape1.Left := Shape1.Left - 8;
    VK_RIGHT: Shape1.Left := Shape1.Left + 8;
    VK_UP: Shape1.Top := Shape1.Top - 8;
    VK_DOWN: Shape1.Top := Shape1.Top + 8;
  end;
end;

end.

