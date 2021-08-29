unit Classe.Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FNome: String;
    FFuncao: String;
    FSalario: Currency;
    procedure SetNome(const Value: String);
    procedure SetSalario(const Value: Currency);
  public
    property Nome: String read FNome write SetNome;
    property Salario: Currency read FSalario write SetSalario;
    function calcularSalario: Currency; Virtual;
  end;

implementation

{ TPessoan }

procedure TPessoa.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Nome não pode ser vazio.');
  FNome := Value;
end;

function TPessoa.calcularSalario: Currency;
begin
  Result := Salario;
end;

procedure TPessoa.SetSalario(const Value: Currency);
begin
  if Value <= 0 then
    raise Exception.Create('Salário não pode ser menor ou igual a 0.');
  FSalario := Value;
end;

end.
