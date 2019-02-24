unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Chart1: TChart;
    JoggerSeries: TLineSeries;
    CarSeries: TLineSeries;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses FormEx;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
const
  s0 = 200;
  v1 = 7.2E3 / 3600;
  t0 = s0 / v1;
  a2 = 1.5;
var
  t: Double;
begin
  FormAdjust(Self);
  JoggerSeries.AddXY(0, 0);
  JoggerSeries.AddXY(120, v1 * 120);
  CarSeries.AddXY(0, 0);
  CarSeries.AddXY(t0, 0);
  t := t0;
  while t <= 120 do begin
    CarSeries.AddXY(t, a2 / 2 * Sqr(t - t0));
    t := t + 1;
  end;
end;

end.

