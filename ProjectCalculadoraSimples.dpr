program ProjectCalculadoraSimples;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {FormPrincipal},
  UDados in 'UDados.pas',
  UConcatenaResultado in 'UConcatenaResultado.pas',
  UCalculoSubtracao in 'UCalculoSubtracao.pas',
  UCalculoDivisao in 'UCalculoDivisao.pas',
  UCalculoAdicao in 'UCalculoAdicao.pas',
  UCalculoMultiplicacao in 'UCalculoMultiplicacao.pas',
  UCalculoResultado in 'UCalculoResultado.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Calculadora';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
