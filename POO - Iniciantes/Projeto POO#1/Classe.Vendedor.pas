unit Classe.Vendedor;

interface

uses
  Classe.Pessoa;

type
  TVendedor = Class(TPessoa)
  private
    FComissao: Currency;
    procedure SetComissao(const Value: Currency);
  public
    property Comissao: Currency read FComissao write SetComissao;
    function calcularSalario: Currency; override;
  End;

implementation

{ TVendedor }

function TVendedor.calcularSalario: Currency;
begin
  Result :=  Salario + Comissao;
end;

procedure TVendedor.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

end.
