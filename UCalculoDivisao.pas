unit UCalculoDivisao;

interface

uses
  UDados;

type
  TCalculoDivisao = class

  public
    procedure CalcularDivisao(dados: TDados);

  end;

implementation

{ TCalculoDivisao }

procedure TCalculoDivisao.CalcularDivisao(dados: TDados);
begin
  if dados.Parametro = '÷' then
  begin
    if dados.Passo = 4 then
    begin
      Dados.Resultado := dados.Resultado/dados.Numero2;
    end
    else if dados.Passo = 3 then
    begin
      Dados.Resultado := dados.Numero1/dados.Numero2;
    end;
  end;
end;

end.
