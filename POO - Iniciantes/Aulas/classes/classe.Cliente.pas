unit classe.Cliente;

interface

uses classe.Pessoa, classe.Endereco;

type
  TCliente = class(TPessoa)
  private
    FValorCredito: Currency; //tem que criar
    FEndereco: TEndereco;  //tem que criar
    procedure SetEndereco(const Value: TEndereco);
    procedure setValorCredito(const Value: Currency);
  public
    constructor Create; overload;
    constructor Create(Value: string); overload;
    constructor Create(Value: TPessoa); overload;
    destructor Destroy; reintroduce;
    property Endereco: TEndereco read FEndereco write SetEndereco; //tem que criar - depois usa o atalho
    //
    function RetornaNome: string; override;
    //Sinaliza dizendo que essa função aqui é a mesma da classe TPessoa mas eu estou reescrevendo ela aqui
    //Se a função não for reescrita ela não funciona, ela assume a da classe pai
    function MetodoAbstrato: string; override;
    property ValorCredito: Currency read FValorCredito write setValorCredito; //tem que criar - depois usa o atalho
  end;

//Herança(inherited - herdado)
//inherited - Quando ele encontra isso, ele vai na classe pai na função que está sendo sobreescrita
           // executa o que está la primeiro, depois ele volta e continua a execução do código que está abaixo ou
           // poderia fazer ao contratio, executar o que está acima primeiro e depois executar o que está la.

//Toda Classe herda do TObjetc Todo metodo CREATE usar um constructor
//Constructor são os métodos construtores das classe, por convenção é usado 'constructor create'
//é usado sempre qeu a classe for criada, ele disse através de warning que metodo destroy é um metodo da classe objetct, porém podemos
//coular usando uma diretiva chamada reintroduce-reescrevendo esse metodo
// O Destroy na classe serve para limpar o objeto de memória, destruir o objeto.

//Quando é usado reintroduce, eu to dizendo que to ocultando a mensagem no compilador, mas estou dizendo que ele
// não vai usar mais o camarada da classe pai e respeitar o que está na classe filho. Vai esquecer. Se eu uso override eu estou dizendo que eu estou reescrevendo
//o método eu ainda uso as dependencias de lá. Quando eu dou um free
//Se usar override ele chamada o destroy da minha classe, ela mesmo faz o destroy, além de limpar ela o que ue implementar no meu destoy
//Se eu usar o reintroduce ele não passa pelo meu destroy, ele chama o destroy do tObjetc, ele oculta os warnings do compilador porém
//é obrigado a chamar o destroy
//Quando criou o override ele cria dependencia, é chamado o freedo tobjetc, porém o destroy foi reescrito então eu executo ele lá onde foi reescrito


implementation

{ TCliente }

constructor TCliente.Create;
begin
  FEndereco := TEndereco.Create;
  Nome := 'Novo Cliente';
end;

constructor TCliente.Create(Value: String);
begin
  Nome := Value;
end;

constructor TCliente.Create(Value: TPessoa);
begin
  Nome     := Value.Nome;
  DataNasc := Value.DataNasc;
  Sexo     := Value.Sexo;
end;

destructor TCliente.Destroy;
begin
  FEndereco.Free;
end;

function TCliente.MetodoAbstrato: string;
begin
  Result := 'Eu sou o metodo abstrato da classe TPessoa implementado na classe TCliente';
end;

function TCliente.RetornaNome: string;
begin
  inherited;
  Result := 'Eu sou filha de ' + Nome;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.setValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
