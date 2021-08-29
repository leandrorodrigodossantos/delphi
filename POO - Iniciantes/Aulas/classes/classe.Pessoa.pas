unit classe.Pessoa;

interface

uses
 System.SysUtils;

type
  TPessoa = class
  strict private //ele priva a várivel, ele restringe o acesso a classe somente, ninguém além dela tem acesso.
    FSegredo: String; //Nem filhos, nem classes amigas, niguémm, somente ele.
  strict protected //Protege seus métodos e variaveis, restringe o acesso somente aos pais e filhos
    FSoFilhos: String; // Não deixa que nenhuma classe amiga mesmo dentro do pai acesse a informação
  private //Somente que é da classe
    FNome: String;
    FEtnia: String;
    FSexo: String;
    FDataNasc: String;
    function getNome: String;
    procedure setNome(Value: String);
    function getEtnia: string;
    procedure setEtnia(const Value: String);
    function getSexo: String;
    procedure setSexo(const Value: String);
    function getDataNasc: String;
    procedure setDataNasc(const Value: String);
  protected  //Quem é da classe e seus filhos
    FWhatsApp: String;
    //Tudo que é protegido é somente visivel aos membros dessa classe/classe pai e aos filhos
    //Mas niguem de fora que use ele pode ter acesso é como um grupo familiar, somente quem pertence ao grupo pode acessar
    //Ninguém de fora consegue ter esse acesso
    //Usado para compartilhar metodos e variais com os filhos sem que algo externo consiga acesso
    //Privado somente a classe acessa
  published //é semelhante ao public, todo mundo vai ver tudo, a diferença é que ele é visivel quando vai se criar um componente
    //Ele aparece no em DesignTime no object inspector
    //FPost: String;
  public //Qualquer um pode meter a mão.
    property DataNasc: String read FDataNasc write SetDataNasc;
    property Sexo:  String read FSexo write SetSexo;
    property Etnia: String read getEtnia write SetEtnia;
    property Nome: string read getNome write setNome;
    function Idade: Integer;
    function Receber(I: Integer): string; overload;
    function Receber(X: Currency): string; overload;
    function Receber(A, B: Integer): string; overload;

    function RetornaNome: string; virtual;
    function MetodoAbstrato: string; virtual; abstract;
    //Public todo mundo acessa
  end;

type TTeste = class(TPessoa) //É uma classe descente
  function Teste: Boolean;
end;

type TAmigo = class //É uma classe amiga
  Familia: TPessoa;
  procedure teste;
end;

//overload - Recarrega a função, elas podem ser sobrecarregadas, pode ter uma função como mesmo nome e tipos diferentes
//virtual  - Serve para que eu sinalize para o programador que esta função pode ser reescrita e fazer o que quiser ou usar essa mesmo.
           //Sinaliza dizendo que essa função aqui é a mesma da classe TPessoa mas eu estou reescrevendo ela em outra classe.
           //Se a função não for reescrita ela não funciona, ela assume a da classe pai. Na classe filho eu tenho que usar
//override - para dizer que eu estou sobreescrevendo a função pai.

//Conceito de virtual e override.
//virutal  - Declara que a classe pode ser reescrita
//override - Sobrecarrego, reescrevi ela na classe filho
//abstract - Quando eu digo que o metodo é abstract ele informa que o metodo não precisa ser implementada nessa classe
          // Porem eu posso implementa-la em outras classes(desobriga a implementação do método)
          // Eu não posso chamar diretamente da classe principal ele tem que ser obrigatoriamente implementado nas classe filhas.
          // Serve para criar algumas estruturas, criar classes que vão determinar alguns padrões que devem ser seguidos, porém na classe pai,
          // você ainda não sabe o que vai ser feito, então é criado esse metodo abstract que as outras vão herdar e devem ser criados para que funcionem

//Toda Classe herda do TObjetc
//Métodos Construtores - Já estão implementados no TObject
//Cada classe deve ser feita em arquivos separados, boas praticas, para respeitar as questões de private, public, strict private, etc..
//Pode declarar uma classe dentro do mesmo arquivo, herdando da classe pai. Seria uma classe amiga.
//Ela herda da Classe TPessoa igual o TCliente, não é recomendado declarar mais de uma classe dentro do mesmo arquivo.
//É uma questão também de boas praticas. Se for criada uma outra classe dentro do mesmo arquivo herdando dela, é possivel acessar tudo referente a classe pai

implementation

function TPessoa.Idade: Integer;
begin
  Result := Trunc((Now - StrToDate(DataNasc)) / 365.25);
end;

function TPessoa.Receber(A, B: Integer): string;
begin
  Result := 'A soma de A + B = ' + inttoStr(A + B);
end;

function TPessoa.RetornaNome: string;
begin
 // Result := 'Eu sou a classe TPessoa';
  Nome := 'TPessoa';
end;

function TPessoa.Receber(X: Currency): string;
begin
  Result := 'Recebi um valor currency ' + currtoStr(x);
end;

function TPessoa.getDataNasc: String;
begin
  Result := FDataNasc;
end;

function TPessoa.Receber(I: Integer): string;
begin
  Result := 'Recebi um valor inteiro ' + InttoStr(I);
end;

procedure TPessoa.setDataNasc(const Value: String);
begin
  FDataNasc := Value;
end;

function TPessoa.getEtnia: String;
begin
  Result := FEtnia;
end;

procedure TPessoa.setEtnia(const Value: String);
begin
  FEtnia := Value;
end;

function TPessoa.getNome: String;
begin
  Result := FNome;
end;

procedure TPessoa.setNome(Value: string);
begin
  if Value <= '' then
    raise Exception.Create('Nome deve ser obrigatório');

  FNome := Value;
end;

function TPessoa.getSexo: String;
begin
  Result := FSexo;
end;

procedure TPessoa.SetSexo(const Value: String);
begin
  FSexo := Value;
  Self.FSegredo := '';
end;

{ TTeste }

function TTeste.Teste: Boolean;
begin
  Self.FNome := '';
  Self.FWhatsApp := '';
  Self.FSoFilhos := '';
  Result := True;
end;

{ TAmigo }

procedure TAmigo.teste;
begin
  Familia.FWhatsApp := '';
end;

end.
