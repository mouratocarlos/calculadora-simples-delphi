unit UCalculoMultiplicacao;

interface

uses
  UDados;

type
  TCalculoMultiplicacao = class

  public
    procedure CalcularMultiplicacao(dados : TDados);

  end;

implementation

{ TCalculoMultiplicacao }

procedure TCalculoMultiplicacao.CalcularMultiplicacao(dados: TDados);
begin
  if dados.Parametro = 'x' then
  begin
    if dados.Passo = 4 then
    begin
      Dados.Resultado := dados.Resultado*dados.Numero2;
    end
    else if dados.Passo = 3 then
    begin
      Dados.Resultado := dados.Numero1*dados.Numero2;
    end;
  end;
end;

end.
