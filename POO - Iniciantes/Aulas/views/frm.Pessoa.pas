unit frm.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, classe.Cliente,
  classe.Pessoa, ShellAPI, Vcl.AppEvnts, Vcl.ExtCtrls;

const
    WM_ICONTRAY = WM_USER + 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edtNomePessoa: TEdit;
    edtNomeCliente: TEdit;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
4 - Principais conceitos
1 - Abstração      - Pensar na Coesão e Acoplamento(dependencias)não criar dependencias, reduzir o máximo que puder as dependencias
2 - Herança        - Capacidade de classes herdar propriedades umas das outras,
3 - Encapsulamento - Property's faz parte de encapsulamento(serve para encapsular as variaveis da minha classe)
4 - Polimorfismo   - (Overload - Overwrite - Virtual)
                     overload - Recarrega a função, elas podem ser sobrecarregadas, pode ter uma função como mesmo nome e tipos diferentes
                     virtual  - Serve para que eu sinalize para o programador que esta função pode ser reescrita e fazer o que quiser ou usar essa mesmo.
                     Sinaliza dizendo que essa função aqui é a mesma da classe TPessoa mas eu estou reescrevendo ela em outra classe.
                     Se a função não for reescrita ela não funciona, ela assume a da classe pai. Na classe filho eu tenho que usar
                     override - para dizer que eu estou sobreescrevendo a função pai.
Conceito de virtual e override.
virutal  - Declara que a classe pode ser reescrita
override - Sobrecarrego, reescrevi ela na classe filho
abstract - Quando eu digo que o metodo é abstract ele informa que o metodo não precisa ser implementada nessa classe
           Porem eu posso implementa-la em outras classes(desobriga a implementação do método)
           Eu não posso chamar diretamente da classe principal ele tem que ser obrigatoriamente implementado nas classe filhas.
           Serve para criar algumas estruturas, criar classes que vão determinar alguns padrões que devem ser seguidos, porém na classe pai,
           você ainda não sabe o que vai ser feito, então é criado esse metodo abstract que as outras vão herdar e devem ser criados para que funcionem

          Herança(inherited - herdado)
            inherited - Quando ele encontra isso, ele vai na classe pai na função que está sendo sobreescrita
            executa o que está la primeiro, depois ele volta e continua a execução do código que está abaixo ou
            poderia fazer ao contratio, executar o que está acima primeiro e depois executar o que está la.

Toda Classe herda do TObjetc Todo metodo CREATE usar um constructor
Construtor - Ele também herd do TObjetc.
Constructor são os métodos construtores das classe, por convenção é usado 'constructor create'
é usado sempre qeu a classe for criada
Constructor são os métodos construtores das classe, por convenção é usado 'constructor create'
é usado sempre qeu a classe for criada, ele disse através de warning que metodo destroy é um metodo da classe objetct, porém podemos
coular usando uma diretiva chamada reintroduce-reescrevendo esse metodo

O Destroy na classe serve para limpar o objeto de memória, destruir o objeto.
Destrutor - Ele também herd do TObjetc. Semelhante aos construtores ele tem o Destructor
Quando é usado reintroduce, eu to dizendo que to ocultando a mensagem no compilador, mas estou dizendo que ele
não vai usar mais o camarada da classe pai e respeitar o que está na classe filho. Vai esquecer. Se eu uso override eu estou dizendo que eu estou reescrevendo
o método eu ainda uso as dependencias de lá. Quando eu dou um free
Se usar override ele chamada o destroy da minha classe, ela mesmo faz o destroy, além de limpar ela o que ue implementar no meu destoy
Se eu usar o reintroduce ele não passa pelo meu destroy, ele chama o destroy do tObjetc, ele oculta os warnings do compilador porém
é obrigado a chamar o destroy
Quando criou o override ele cria dependencia, é chamado o freedo tobjetc, porém o destroy foi reescrito então eu executo ele lá onde foi reescrito

}

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
  { Hide the window and set its state variable to wsMinimized. }
  //Hide();
  //WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  //TrayIcon1.Visible := True;
  //TrayIcon1.Animate := True;
  //TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.FormCreate(Sender: TObject);
//var
//  MyIcon : TIcon;
begin
  { Load the tray icons. }
  //TrayIcon1.Icons := TImageList.Create(Self);
  //MyIcon := TIcon.Create;
  //MyIcon.LoadFromFile('icons/earth1.ico');
  //TrayIcon1.Icon.Assign(MyIcon);
  //TrayIcon1.Icons.AddIcon(MyIcon);

  //MyIcon.LoadFromFile('icons/earth2.ico');
  //TrayIcon1.Icons.AddIcon(MyIcon);
  //MyIcon.LoadFromFile('icons/earth3.ico');
  //TrayIcon1.Icons.AddIcon(MyIcon);
  //MyIcon.LoadFromFile('icons/earth4.ico');
  //TrayIcon1.Icons.AddIcon(MyIcon);

  { Set up a hint message and the animation interval. }
  ///TrayIcon1.Hint := 'Hello World!';
  ///TrayIcon1.AnimateInterval := 200;

  { Set up a hint balloon. }
  ///TrayIcon1.BalloonTitle := 'Restoring the window.';
  ///TrayIcon1.BalloonHint :=
  ///  'Double click the system tray icon to restore the window.';
  ///TrayIcon1.BalloonFlags := bfInfo;
end;


procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  //TrayIcon1.Visible := False;
  //Show();
  //WindowState := wsNormal;
  //Application.BringToFront();
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  Pessoa:  TPessoa;
  Cliente: TCliente;
begin
  Pessoa  := TCliente.Create;
  Cliente :=  TCliente.Create;
  try
    Pessoa.Nome     := edtNomePessoa.Text;
    Pessoa.DataNasc := '26/03/1983';

    Cliente.Nome     := edtNomeCliente.Text;
    Cliente.DataNasc := '27/09/1990';
    Cliente.ValorCredito := 1000.10;

    ShowMessage(Pessoa.Nome + ' - ' + IntToStr(Pessoa.Idade));
    ShowMessage(Cliente.Nome + ' - '+ IntToStr(Cliente.Idade) + ' - ' + FormatCurr('R$#00.00',Cliente.ValorCredito));
  finally
    Pessoa.Free;
    Cliente.Free
  end;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  Pessoa:  TPessoa;
  Cliente: TCliente;
  Cliente2: TCliente;
  Cliente3: TCliente;
  Value: Currency;
begin
  Pessoa  := TPessoa.Create;

  Pessoa.Nome     := 'Fulano';
  Pessoa.DataNasc := '01/01/2021';
  Pessoa.Sexo     := 'Masculino';

  Cliente := TCliente.Create;
  Cliente2 := TCliente.Create('Leandro Santos');
  Cliente3 := TCliente.Create(Pessoa);
  try
//    ShowMessage(Pessoa.Receber(10));
//    Value := 10.5;
//    ShowMessage(Pessoa.Receber(Value));
//
//    ShowMessage(Pessoa.Receber(10, 5));
//    ShowMessage(Pessoa.RetornaNome);
//    ShowMessage(Cliente.RetornaNome);
//    ShowMessage(Cliente.RetornaNome);
    ShowMessage(Cliente.Nome);

    ShowMessage(Cliente2.Nome);

    ShowMessage(Cliente3.Nome + ' - ' + Cliente3.DataNasc + ' - ' + Cliente3.Sexo);

    ShowMessage(Cliente.Endereco.Logradouro);
  finally
    Pessoa.Free;
    Cliente.Destroy;
    Cliente2.Free;
  end;
end;

end.
