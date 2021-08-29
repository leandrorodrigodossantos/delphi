unit View.Principial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa,
  Classe.Vendedor, Classe.Administrativo;

type
  TEnumFuncao = (tpAdministrativo, tpVendedor, tpFuncionario);

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cbFuncao: TComboBox;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtSalario: TEdit;
    Label4: TLabel;
    edtBonus: TEdit;
    btnCadastrar: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    memInformacoes: TMemo;
    btnCalcularSalario: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnCalcularSalarioClick(Sender: TObject);
  private
    procedure fnc_IncluirAdministrativo;
    procedure fnc_IncluirVendedor;
    procedure fnc_IncluirFuncionario;
    procedure fnc_ExibirDados(Pos: Integer);
    { Private declarations }
  public
    { Public declarations }
    Funcionario: Array [1 .. 100] of TPessoa;
    QtdFunc: Integer;
    RegAtual: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAnteriorClick(Sender: TObject);
begin
  if RegAtual <= 0 then
    Exit;
  RegAtual := RegAtual - 1;
  fnc_ExibirDados(RegAtual);
end;

procedure TForm1.btnCadastrarClick(Sender: TObject);
begin
  try
    Case TEnumFuncao(cbFuncao.ItemIndex) of
      tpAdministrativo:
        begin
          fnc_IncluirAdministrativo;
        end;
      tpVendedor:
        begin
          fnc_IncluirVendedor;
        end;
      tpFuncionario:
        begin
          fnc_IncluirFuncionario;
        end;
    end;
    Inc(QtdFunc);
  except
    raise Exception.Create('Erro ao cadastrar funcionário.');
  end;
end;

procedure TForm1.btnCalcularSalarioClick(Sender: TObject);
var
  Total: Currency;
  I: Integer;
begin
  Total := 0;
  for I := 0 to QtdFunc - 1 do
  begin
    Total := Total + Funcionario[I].calcularSalario;
  end;
  memInformacoes.Lines.Add('Seu salário é de RS: ' + CurrToStr(Total));
end;

procedure TForm1.btnProximoClick(Sender: TObject);
begin
  if RegAtual >= QtdFunc - 1 then
    Exit;
  RegAtual := RegAtual + 1;
  fnc_ExibirDados(RegAtual);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  QtdFunc := 0;
  RegAtual := 0;
end;

procedure TForm1.fnc_ExibirDados(Pos: Integer);
begin
  edtNome.Text := Funcionario[RegAtual].Nome;
  edtSalario.Text := CurrToStr(Funcionario[RegAtual].Salario);
  if Funcionario[RegAtual].ClassName = 'TAdministrativo' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TAdministrativo(Funcionario[RegAtual]).Bonus);
    cbFuncao.ItemIndex := Integer(tpAdministrativo);
  end;

  if Funcionario[RegAtual].ClassName =  'TVendedor' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TVendedor(Funcionario[RegAtual]).Comissao);
    cbFuncao.ItemIndex := Integer(tpVendedor);
  end;

  if Funcionario[RegAtual].ClassName =  'TPessoa' then
  begin
    edtBonus.Enabled := False;
    edtBonus.Text := '';
    cbFuncao.ItemIndex := Integer(tpFuncionario);
  end;

end;

procedure TForm1.fnc_IncluirAdministrativo;
begin
  // Para ter acesso as informações dos filhos
  // Se tipifica a Objeto Funcionario da forma abaixo
  // Ele é um array de TPessoa, mas quando se tipifica,
  // é possivel acessar o restante das informações do filho, no caso o Administrativo
  Funcionario[QtdFunc] := TAdministrativo.Create;
  TAdministrativo(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TAdministrativo(Funcionario[QtdFunc]).Salario := StrToCurr(edtSalario.Text);
  TAdministrativo(Funcionario[QtdFunc]).Bonus := StrToCurr(edtBonus.Text);
end;

procedure TForm1.fnc_IncluirVendedor;
begin
  // Para ter acesso as informações dos filhos
  // Se tipifica a Objeto Funcionario da forma abaixo
  // Ele é um array de TPessoa, mas quando se tipifica,
  // é possivel acessar o restante das informações do filho, no caso o Administrativo
  Funcionario[QtdFunc] := TVendedor.Create;
  TVendedor(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TVendedor(Funcionario[QtdFunc]).Salario := StrToCurr(edtSalario.Text);
  TVendedor(Funcionario[QtdFunc]).Comissao := StrToCurr(edtBonus.Text);
end;

procedure TForm1.fnc_IncluirFuncionario;
begin
  // Para ter acesso as informações dos filhos
  // Se tipifica a Objeto Funcionario da forma abaixo
  // Ele é um array de TPessoa, mas quando se tipifica,
  // é possivel acessar o restante das informações do filho, no caso o Administrativo
  Funcionario[QtdFunc] := TPessoa.Create;
  Funcionario[QtdFunc].Nome := edtNome.Text;
  Funcionario[QtdFunc].Salario := StrToCurr(edtSalario.Text);
end;

end.
