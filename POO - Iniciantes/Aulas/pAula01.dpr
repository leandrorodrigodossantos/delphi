program pAula01;

uses
  Vcl.Forms,
  classe.Pessoa in 'classes\classe.Pessoa.pas',
  frm.Pessoa in 'views\frm.Pessoa.pas' {Form1},
  classe.Gravar in 'classes\classe.Gravar.pas',
  classe.Cliente in 'classes\classe.Cliente.pas',
  classe.Endereco in 'classes\classe.Endereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
