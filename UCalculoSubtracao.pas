unit UCalculoSubtracao;

interface

uses
  UDados;

type
  TCalculoSubtracao = class

  public
    procedure CalcularSubtracao(dados : TDados);

  end;

implementation

uses
  System.SysUtils;

{ TCalculoSubtracao }

procedure TCalculoSubtracao.CalcularSubtracao(dados: TDados);
begin
  if dados.Parametro = '-' then
  begin
    if dados.Passo = 4 then
    begin
      Dados.Resultado := dados.Resultado-dados.Numero2;
    end
    else if dados.Passo = 3 then
    begin
      Dados.Resultado := dados.Numero1-dados.Numero2;
    end;
  end;
end;

end.
