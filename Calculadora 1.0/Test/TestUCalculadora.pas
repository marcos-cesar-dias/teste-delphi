unit TestUCalculadora;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, math, UIcalculadora, UIObserverCalculos, Ucalculadora,
  UCalculadoraImpostos, strutils;

type

  TObserverMock = class(TInterfacedObject, IObserverCalculos)

  public
    procedure NotifyDetalhe(value: string);
    procedure NotifyResultado(value: string);

  end;
  // Test methods for class TCalculadora

  TestTCalculadora = class(TTestCase)
  strict private
    FCalculadora: TCalculadoraImpostos;
    FObserver: TObserverMock;
  private

  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TesteSoma;
    procedure TesteSubtracao;
    procedure TesteDivisao;
    procedure TesteDivisaoZero;
    procedure TesteDivisaoZero2;
    procedure TesteMultiplicacao;
    procedure TesteLimparVariaveis;

    procedure TesteSomaSubtracao();
    procedure TesteSomaSubtracaoDivisaoMultiplicacao();

    procedure TesteSomaTotalizaSubtrai();

    procedure TesteSomaTotalizaSubtrai_ComValorAntesDeOperacao();
    procedure TesteImposto1;
    procedure TesteImposto2;
    procedure TesteImposto3;

  end;

var
  ValorDetalhe: string;
  ValorResultado: String;


implementation

uses
  System.SysUtils;

procedure TestTCalculadora.SetUp;
begin

  FCalculadora := TCalculadoraImpostos.Create(TCalculadora.Create());
  FObserver := TObserverMock.Create;
  FCalculadora.AdicionaObserver(FObserver);

end;

procedure TestTCalculadora.TearDown;
begin
  FCalculadora.Free;
  FCalculadora := nil;
end;

procedure TestTCalculadora.TesteDivisao;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('/');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');

  assert(valorresultado='4');

end;

procedure TestTCalculadora.TesteDivisaoZero;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('/');
  FCalculadora.Comando('0');
  FCalculadora.Comando('=');

  assert(valorresultado='0', 'Teste 1 de divis�o por zero');
end;

procedure TestTCalculadora.TesteDivisaoZero2;
begin
  FCalculadora.Comando('0');
  FCalculadora.Comando('/');
  FCalculadora.Comando('2');
  FCalculadora.Comando('=');

  assert(valorresultado='0', 'Teste 2 de divis�o por zero');
end;

procedure TestTCalculadora.TesteLimparVariaveis;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('*');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');

  FCalculadora.Comando('cls');
  assert( strtocurr(valorresultado)=strtocurr('0'));


end;

procedure TestTCalculadora.TesteMultiplicacao;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('*');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');

  assert(valorresultado='36');

end;

procedure TestTCalculadora.TesteSoma;
var
  value: string;
begin
  // TODO: Setup method call parameters

  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('+');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');

  assert(valorresultado='15');

  // TODO: Validate method results
end;

procedure TestTCalculadora.TesteSomaSubtracao;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('+');
  FCalculadora.Comando('3');
  FCalculadora.Comando('-');
  FCalculadora.Comando('5');
  FCalculadora.Comando('=');
  assert(valorresultado='10');
end;

procedure TestTCalculadora.TesteSomaSubtracaoDivisaoMultiplicacao;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('+');
  FCalculadora.Comando('3');
  FCalculadora.Comando('-');
  FCalculadora.Comando('5');
  FCalculadora.Comando('/');
  FCalculadora.Comando('2');
  FCalculadora.Comando('*');
  FCalculadora.Comando('3');

  FCalculadora.Comando('=');
  assert(valorresultado='15');

end;

procedure TestTCalculadora.TesteSomaTotalizaSubtrai;
begin

  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('+');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');
  FCalculadora.Comando('-');
  FCalculadora.Comando('5');
  FCalculadora.Comando('=');

  assert(valorresultado='10');


end;

procedure TestTCalculadora.TesteSomaTotalizaSubtrai_ComValorAntesDeOperacao;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('+');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');
  FCalculadora.Comando('9');
  FCalculadora.Comando('-');
  FCalculadora.Comando('5');
  FCalculadora.Comando('=');

  assert(valorresultado='10');

end;


procedure TestTCalculadora.TesteImposto1;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');

  FCalculadora.Comando(imposto1);

  assert(valorresultado='1500,00');

end;

procedure TestTCalculadora.TesteImposto2;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');

  FCalculadora.Comando(imposto2);

  assert(valorresultado='1485,00');

end;



procedure TestTCalculadora.TesteImposto3;
begin
  FCalculadora.Comando('1');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');
  FCalculadora.Comando('0');

  FCalculadora.Comando(imposto3);

  assert(valorresultado='2985,00');

end;


procedure TestTCalculadora.TesteSubtracao;
var
  value: string;
begin
  // TODO: Setup method call parameters

  FCalculadora.Comando('1');
  FCalculadora.Comando('2');
  FCalculadora.Comando('-');
  FCalculadora.Comando('3');
  FCalculadora.Comando('=');

  assert(valorresultado='9');

  // TODO: Validate method results
end;

{ ObserverMock }

procedure TObserverMock.NotifyDetalhe(value: string);
begin
  ValorDetalhe := value;
end;

procedure TObserverMock.NotifyResultado(value: string);
begin
  ValorResultado := value;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCalculadora.Suite);
end.

