unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  NewtonsMethod;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    NewtonsMeth: TNewtonsMethod;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private

  public

  end;

function Potenz(x: Extended): Extended;

function Ableitung(x: Extended): Extended;

function RechteSeite(x: Extended): Extended;

var
  Form1: TForm1;

implementation

uses InputFrm;

{$R *.lfm}

var
  Exponent, Argument: Extended;

function Potenz(x: Extended): Extended;
begin
  Result := exp(Exponent * ln(x))
end;

function Ableitung(x: Extended): Extended;
begin
  Result := Exponent * exp((Exponent - 1) * ln(x))
end;

function RechteSeite(x: Extended): Extended;
begin
  Result := Potenz(x) - Argument
end;

{ TForm1 }

procedure TForm1.ImageClick(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  R: Extended;
begin
  case InputForm.ShowModal of
    mrOK: begin
        Argument := InputForm.Potenz;
        Exponent := InputForm.Exponent;
        NewtonsMeth.InitialGuess := InputForm.Start;
        R := NewtonsMeth.Root;
        case NewtonsMeth.CalcStatus of
          csOK: ShowMessageFmt('Die %d. Wurzel aus %g ist %g nach %d Schritten.', [InputForm.Exponent,
            InputForm.Potenz, R, NewtonsMeth.CalcCycles]);
          csBadInitialGuess: ShowMessage('Der Startwert ist ungeeignet');
          csDerivateIsZero: ShowMessage('Abbruch weil die Ableitung 0 wurde.');
          csFunctionDivergent: ShowMessageFmt('Das Verfahren divergiert nach %d Schritten.', [NewtonsMeth.CalcCycles]);
          csDifferencesNotToZero: ShowMessage('Die Differenzenfolge der Schritte geht nicht gegen 0');
          else ShowMessageFmt('Verfahren nicht erfolgreich nach %d Schritten.', [NewtonsMeth.CalcCycles])
        end;
      end;
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  NewtonsMeth.ToAnalyse := @RechteSeite;
  NewtonsMeth.Derivate := @Ableitung;
end;

end.

