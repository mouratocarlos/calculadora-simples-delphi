unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UCalculoResultado, UDados, UConcatenaResultado, Vcl.ExtCtrls,
  System.Classes;

type
  TFormPrincipal = class(TForm)
    ButtonNumero1: TButton;
    ButtonNumero2: TButton;
    ButtonNumero3: TButton;
    ButtonNumero4: TButton;
    ButtonNumero5: TButton;
    ButtonNumero6: TButton;
    ButtonNumero7: TButton;
    ButtonNumero8: TButton;
    ButtonNumero9: TButton;
    ButtonNumero0: TButton;
    ButtonLimpar: TButton;
    ButtonResultado: TButton;
    MemoResultado: TMemo;
    ButtonDivisor: TButton;
    ButtonMultiplicador: TButton;
    ButtonSubtracao: TButton;
    ButtonAdicao: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonNumero0Click(Sender: TObject);
    procedure ButtonLimparClick(Sender: TObject);
    procedure ButtonResultadoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonAdicaoClick(Sender: TObject);
  private
    { Private declarations }
    FCalculoResultado   : TCalculoResultado;
    FDados              : TDados;
    FConcatenaResultado : TConcatenaResultado;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.ButtonAdicaoClick(Sender: TObject);
begin
  if (FDados.Passo = 3)
   or (FDados.Passo = 4) then
  begin
    FDados.Numero1Concatenado := FloatToStr(FDados.Resultado);
    FDados.Numero2Concatenado := '0';
    MemoResultado.Clear;
    MemoResultado.Lines.Add(FDados.Numero1Concatenado);
    FDados.Parametro := (Sender as TButton).Caption;
    MemoResultado.Lines.Add(FDados.Parametro);

    FDados.Passo     := 2;

    ButtonResultado.SetFocus;

    FCalculoResultado.CalcularDados(FDados,
     MemoResultado.Lines);
  end
  else if (FDados.Parametro = (Sender as TButton).Caption) then
  begin
    ButtonResultado.Click;
  end
  else if FDados.Numero1Concatenado <> '0' then
  begin
    MemoResultado.Lines.Add((Sender as TButton).Caption);

    FDados.Parametro := (Sender as TButton).Caption;
    FDados.Passo     := 2;

    ButtonResultado.SetFocus;

    FCalculoResultado.CalcularDados(FDados,
     MemoResultado.Lines);
  end;
end;

procedure TFormPrincipal.ButtonLimparClick(Sender: TObject);
begin
  FCalculoResultado.limparResultado(FDados,
   MemoResultado.Lines,
    ButtonResultado);
end;

procedure TFormPrincipal.ButtonNumero0Click(Sender: TObject);
begin
  if (FDados.Passo = 3)
   or (FDados.Passo = 4) then
  begin
    ButtonLimpar.Click;
  end;

  ButtonResultado.SetFocus;
  FConcatenaResultado.concatenarResultado((Sender as TButton).Caption,
   FDados,
    MemoResultado.Lines);
end;

procedure TFormPrincipal.ButtonResultadoClick(Sender: TObject);
begin
  if FDados.Passo <> 4 then
  begin
    FDados.Passo := 3;
  end;

  FCalculoResultado.CalcularDados(FDados,
   MemoResultado.Lines);
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCalculoResultado);
  FreeAndNil(FDados);
  FreeAndNil(FConcatenaResultado);
end;

procedure TFormPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_NUMPAD0 then
  begin
    ButtonNumero0.Click;
  end
  else if (Key = VK_NUMPAD1) then
  begin
    ButtonNumero1.Click;
  end
  else if Key = VK_NUMPAD2 then
  begin
    ButtonNumero2.Click;
  end
  else if Key = VK_NUMPAD3 then
  begin
    ButtonNumero3.Click;
  end
  else if Key = VK_NUMPAD4 then
  begin
    ButtonNumero4.Click;
  end
  else if Key = VK_NUMPAD5 then
  begin
    ButtonNumero5.Click;
  end
  else if Key = VK_NUMPAD6 then
  begin
    ButtonNumero6.Click;
  end
  else if Key = VK_NUMPAD7 then
  begin
    ButtonNumero7.Click;
  end
  else if Key = VK_NUMPAD8 then
  begin
    ButtonNumero8.Click;
  end
  else if Key = VK_NUMPAD9 then
  begin
    ButtonNumero9.Click;
  end
  else if Key = VK_ADD then
  begin
    ButtonAdicao.Click;
  end
  else if Key = VK_SUBTRACT then
  begin
    ButtonSubtracao.Click;
  end
  else if Key = VK_MULTIPLY then
  begin
    ButtonMultiplicador.Click;
  end
  else if Key = VK_DIVIDE then
  begin
    ButtonDivisor.Click;
  end
  else if (Key = VK_OEM_PLUS) then
  begin
    ButtonResultado.Click;
  end
  else if (Key = VK_BACK)
    or (Key = VK_ESCAPE) then
  begin
    ButtonLimpar.Click;
  end;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  FCalculoResultado   := TCalculoResultado.Create;
  FDados              := TDados.Create;
  FConcatenaResultado := TConcatenaResultado.Create;

  ButtonLimpar.Click;
end;


end.
