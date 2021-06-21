unit UCalculoResultado;

interface

uses
  UDados, System.Classes, UCalculoAdicao, UCalculoSubtracao, UCalculoDivisao,
  UCalculoMultiplicacao, Vcl.StdCtrls;

type
  TCalculoResultado = class

  private
    FCalculoAdicao        : TCalculoAdicao;
    FCalculoSubtracao     : TCalculoSubtracao;
    FCalculoMultiplicacao : TCalculoMultiplicacao;
    FCalculoDivisao       : TCalculoDivisao;

    procedure mensagemRetorno(dados : TDados; lista: TStrings);

  public
    procedure CalcularDados(dados : TDados; lista : TStrings);
    procedure limparResultado(dados: TDados; lista: TStrings;
     ButtonResultado: TButton);
    constructor Create;
    destructor  Destroy;

  end;

implementation

uses
  System.SysUtils;

{ TCalculo }

procedure TCalculoResultado.CalcularDados(dados : TDados; lista : TStrings);
begin
  Dados.Numero1 := StrToFloat(dados.Numero1Concatenado);
  Dados.Numero2 := StrToFloat(dados.Numero2Concatenado);

  if (dados.Passo = 3)
   or (dados.passo = 4)then
  begin
    if lista.IndexOf('=') <> -1 then
    begin
      dados.passo     := 4;
    end;

    FCalculoAdicao.CalcularAdicao(dados);
    FCalculoSubtracao.CalcularSubtracao(dados);
    FCalculoMultiplicacao.CalcularMultiplicacao(dados);
    FCalculoDivisao.CalcularDivisao(dados);
  end;

  mensagemRetorno(dados, lista);
end;

constructor TCalculoResultado.Create;
begin
  FCalculoAdicao        := TCalculoAdicao.Create;
  FCalculoSubtracao     := TCalculoSubtracao.Create;
  FCalculoMultiplicacao := TCalculoMultiplicacao.Create;
  FCalculoDivisao       := TCalculoDivisao.Create;
end;

destructor TCalculoResultado.Destroy;
begin
  FreeAndNil(FCalculoAdicao);
  FreeAndNil(FCalculoSubtracao);
  FreeAndNil(FCalculoMultiplicacao);
  FreeAndNil(FCalculoDivisao);
end;

procedure TCalculoResultado.limparResultado(dados: TDados; lista: TStrings;
  ButtonResultado : TButton);
begin
  lista.Clear;

  Dados.Numero1Concatenado := '0';
  Dados.Numero2Concatenado := '0';
  Dados.Parametro          := '';
  Dados.Numero1            := 0;
  Dados.Numero2            := 0;
  Dados.Resultado          := 0;
  Dados.Passo              := 1;
  ButtonResultado.SetFocus;
end;

procedure TCalculoResultado.mensagemRetorno(dados: TDados; lista: TStrings);
var
  numero1   : string;
  numero2   : string;
  resultado : string;
begin
  numero1   := FloatToStr(dados.Numero1);
  numero2   := FloatToStr(dados.Numero2);

  if dados.Passo = 1 then
  begin
    lista.Add(numero1)
  end
  else if (dados.Passo = 2)
   and not (dados.Numero2Concatenado = '0') then
  begin
    lista.Add(numero2);
  end
  else if (dados.Passo = 3)
   or (dados.passo = 4)then
  begin
    resultado := FloatToStr(dados.Resultado);
    lista.Add('=');
    lista.Add(resultado);
  end;
end;

end.
