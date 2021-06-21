unit UConcatenaResultado;

interface

uses
  System.Classes, UDados, UCalculoResultado;

type
  TConcatenaResultado = class

  private
    FCalculoResultado : TCalculoResultado;

  public
    function concatenarResultado(const Numero: String; dados : TDados; lista: TStrings): String;

  end;

implementation

uses
  System.SysUtils;

{ TConcatenaResultado }

function TConcatenaResultado.concatenarResultado(const Numero: String; dados : TDados; lista: TStrings): String;
begin
  if dados.Passo = 1 then
  begin
    lista.Delete(0);

    Dados.Numero1Concatenado := Dados.Numero1Concatenado+Numero;
  end
  else if dados.Passo = 2 then
  begin
    lista.Delete(2);

    Dados.Numero2Concatenado := Dados.Numero2Concatenado+Numero;
  end;

  FCalculoResultado.CalcularDados(dados, lista);
end;


end.
