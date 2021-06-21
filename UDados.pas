unit UDados;

interface

type

  TDados = class

  private
    FResultado          : Double;
    FPasso              : Integer;
    FParametro          : String;
    FNumero2            : Double;
    FNumero1            : Double;
    FNumero2Concatenado : String;
    FNumero1Concatenado : String;

    procedure setResultado(const Value: Double);
    procedure setPasso(const Value: Integer);
    procedure setParametro(const Value: String);
    procedure setNumero1(const Value: Double);
    procedure setNumero1Concatenado(const Value: String);
    procedure setNumero2(const Value: Double);
    procedure setNumero2Concatenado(const Value: String);

  public
    property Numero1            : Double  read FNumero1            write setNumero1;
    property Numero2            : Double  read FNumero2            write setNumero2;
    property Resultado          : Double  read FResultado          write setResultado;
    property Passo              : Integer read FPasso              write setPasso;
    property Parametro          : String  read FParametro          write setParametro;
    property Numero1Concatenado : String  read FNumero1Concatenado write setNumero1Concatenado;
    property Numero2Concatenado : String  read FNumero2Concatenado write setNumero2Concatenado;

  end;

implementation

{ TDados }

procedure TDados.setNumero1(const Value: Double);
begin
  FNumero1 := Value;
end;

procedure TDados.setNumero1Concatenado(const Value: String);
begin
  FNumero1Concatenado := Value;
end;

procedure TDados.setNumero2(const Value: Double);
begin
  FNumero2 := Value;
end;

procedure TDados.setNumero2Concatenado(const Value: String);
begin
  FNumero2Concatenado := Value;
end;

procedure TDados.setParametro(const Value: String);
begin
  FParametro := Value;
end;

procedure TDados.setPasso(const Value: Integer);
begin
  FPasso := Value;
end;

procedure TDados.setResultado(const Value: Double);
begin
  FResultado := Value;
end;

end.
