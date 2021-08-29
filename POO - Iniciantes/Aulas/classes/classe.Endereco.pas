unit classe.Endereco;

interface

type
  TEndereco = class
  private
    FLogradouro: string;
    FNumero: integer;
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: integer);
  public
    constructor Create;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Numero: integer read FNumero write SetNumero;

  end;

implementation



{ TEndereco }

constructor TEndereco.Create;
begin
  Logradouro := 'Sem endereço';
  Numero     := 0;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

end.
