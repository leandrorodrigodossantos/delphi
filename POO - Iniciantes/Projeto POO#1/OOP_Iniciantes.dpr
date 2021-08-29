program OOP_Iniciantes;

uses
  Vcl.Forms,
  View.Principial in 'View.Principial.pas' {Form1},
  Classe.Administrativo in 'Classe.Administrativo.pas',
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Classe.Vendedor in 'Classe.Vendedor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
