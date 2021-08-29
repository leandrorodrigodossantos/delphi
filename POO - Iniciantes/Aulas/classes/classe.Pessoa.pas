unit classe.Pessoa;

interface

uses
 System.SysUtils;

type
  TPessoa = class
  strict private //ele priva a v�rivel, ele restringe o acesso a classe somente, ningu�m al�m dela tem acesso.
    FSegredo: String; //Nem filhos, nem classes amigas, nigu�mm, somente ele.
  strict protected //Protege seus m�todos e variaveis, restringe o acesso somente aos pais e filhos
    FSoFilhos: String; // N�o deixa que nenhuma classe amiga mesmo dentro do pai acesse a informa��o
  private //Somente que � da classe
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
  protected  //Quem � da classe e seus filhos
    FWhatsApp: String;
    //Tudo que � protegido � somente visivel aos membros dessa classe/classe pai e aos filhos
    //Mas niguem de fora que use ele pode ter acesso � como um grupo familiar, somente quem pertence ao grupo pode acessar
    //Ningu�m de fora consegue ter esse acesso
    //Usado para compartilhar metodos e variais com os filhos sem que algo externo consiga acesso
    //Privado somente a classe acessa
  published //� semelhante ao public, todo mundo vai ver tudo, a diferen�a � que ele � visivel quando vai se criar um componente
    //Ele aparece no em DesignTime no object inspector
    //FPost: String;
  public //Qualquer um pode meter a m�o.
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

type TTeste = class(TPessoa) //� uma classe descente
  function Teste: Boolean;
end;

type TAmigo = class //� uma classe amiga
  Familia: TPessoa;
  procedure teste;
end;

//overload - Recarrega a fun��o, elas podem ser sobrecarregadas, pode ter uma fun��o como mesmo nome e tipos diferentes
//virtual  - Serve para que eu sinalize para o programador que esta fun��o pode ser reescrita e fazer o que quiser ou usar essa mesmo.
           //Sinaliza dizendo que essa fun��o aqui � a mesma da classe TPessoa mas eu estou reescrevendo ela em outra classe.
           //Se a fun��o n�o for reescrita ela n�o funciona, ela assume a da classe pai. Na classe filho eu tenho que usar
//override - para dizer que eu estou sobreescrevendo a fun��o pai.

//Conceito de virtual e override.
//virutal  - Declara que a classe pode ser reescrita
//override - Sobrecarrego, reescrevi ela na classe filho
//abstract - Quando eu digo que o metodo � abstract ele informa que o metodo n�o precisa ser implementada nessa classe
          // Porem eu posso implementa-la em outras classes(desobriga a implementa��o do m�todo)
          // Eu n�o posso chamar diretamente da classe principal ele tem que ser obrigatoriamente implementado nas classe filhas.
          // Serve para criar algumas estruturas, criar classes que v�o determinar alguns padr�es que devem ser seguidos, por�m na classe pai,
          // voc� ainda n�o sabe o que vai ser feito, ent�o � criado esse metodo abstract que as outras v�o herdar e devem ser criados para que funcionem

//Toda Classe herda do TObjetc
//M�todos Construtores - J� est�o implementados no TObject
//Cada classe deve ser feita em arquivos separados, boas praticas, para respeitar as quest�es de private, public, strict private, etc..
//Pode declarar uma classe dentro do mesmo arquivo, herdando da classe pai. Seria uma classe amiga.
//Ela herda da Classe TPessoa igual o TCliente, n�o � recomendado declarar mais de uma classe dentro do mesmo arquivo.
//� uma quest�o tamb�m de boas praticas. Se for criada uma outra classe dentro do mesmo arquivo herdando dela, � possivel acessar tudo referente a classe pai

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
    raise Exception.Create('Nome deve ser obrigat�rio');

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
