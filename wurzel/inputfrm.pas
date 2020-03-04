unit InputFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TInputForm }

  TInputForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditExponent: TEdit;
    EditArgument: TEdit;
    EditStart: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    function GetArgument: Extended;
    function GetExponent: Longint;
    function GetStart: Extended;
    procedure SetArgument(AValue: Extended);
    procedure SetExponent(AValue: Longint);
    procedure SetStart(AValue: Extended);
  public
    property Potenz: Extended read GetArgument write SetArgument;
    property Exponent: Longint read GetExponent write SetExponent;
    property Start: Extended read GetStart write SetStart;
  end;

var
  InputForm: TInputForm;

implementation

{$R *.lfm}

{ TInputForm }

procedure TInputForm.FormCreate(Sender: TObject);
begin
  InputForm.Exponent := 3;
  InputForm.Potenz := 8;
  InputForm.Start := 3;
end;

function TInputForm.GetArgument: Extended;
begin
  Result := StrToFloat(EditArgument.Text)
end;

function TInputForm.GetExponent: Longint;
begin
  Result := StrToInt(EditExponent.Text);
end;

function TInputForm.GetStart: Extended;
begin
  Result := StrToFloat(EditStart.Text)
end;

procedure TInputForm.SetArgument(AValue: Extended);
begin
  EditArgument.Text := FloatToStr(AValue)
end;

procedure TInputForm.SetExponent(AValue: Longint);
begin
  EditExponent.Text := IntToStr(AValue)
end;

procedure TInputForm.SetStart(AValue: Extended);
begin
  EditStart.Text := FloatToStr(AValue)
end;

end.

