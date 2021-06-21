unit UCalculoAdicao;

interface

uses
  UDados;

type
  TCalculoAdicao = class

  public
    procedure CalcularAdicao(dados : TDados);

  end;

implementation

{ TCalculoAdicao }

procedure TCalculoAdicao.CalcularAdicao(dados: TDados);
begin
  if dados.Parametro = '+' then
  begin
    if dados.Passo = 4 then
    begin
      Dados.Resultado := dados.Resultado+dados.Numero2;
    end
    else if dados.Passo = 3 then
    begin
      Dados.Resultado := dados.Numero1+dados.Numero2;
    end;
  end;
end;

end.
