unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, DirectoriosDM;


type
  TfrmMain = class(TForm)
    ADOConnection: TADOConnection;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    COBAEM1: TMenuItem;
    pnlMain: TPanel;
    ICATMI1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Prueba1: TMenuItem;
    Emisor1: TMenuItem;
    Salir1: TMenuItem;
    SMRTV1: TMenuItem;
    procedure COBAEM1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
  private
    { Private declarations }
    dmDirectorios: TdmDirectorios;
    procedure Conectar(pModulo: Integer);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses XMLtoPDFDmod, CFDIDM;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  dmodXMLtoPDF: TdmodXMLtoPDF;
begin
  dmodXMLtoPDF := TdmodXMLtoPDF.Create(Self);
  try
    dmodXMLtoPDF.FileRTM := 'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\CFDIInterva.rtm';
    dmodXMLtoPDF.FileXTR := 'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\CFDI32_N11.xtr';
    dmodXMLtoPDF.ModifyDocument;
  finally
    dmodXMLtoPDF.Free;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  dmCFDI: TdmCFDI;
begin
  dmCFDI := TdmCFDI.Create(Self);
  try
    dmCFDI.CrearPDF('C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\AAAA650207000_14815.XML',
    'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\AAAA650207000_14815.PDF');
  finally
    dmCFDI.Free;
  end;
end;

procedure TfrmMain.COBAEM1Click(Sender: TObject);
begin
  Conectar(TMenuItem(Sender).Tag);
  if Assigned(dmDirectorios) then FreeAndNil(dmDirectorios);
  dmDirectorios := TdmDirectorios.CreateWModulo(Self, TMenuItem(Sender).Tag);
  if Assigned(dmDirectorios) then
  begin
    dmDirectorios.ShowModule(pnlMain,TMenuItem(Sender).Caption);
  end;
end;

procedure TfrmMain.Conectar(pModulo: Integer);
begin
//Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=IntervaPDS;Data Source=NAS4\NOMINASV12;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DESARROLLO3;Use Encryption for Data=False;Tag with column collation when possible=False
//Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=ICATMI;Data Source=NAS4\NOMINASV12;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DESARROLLO3;Use Encryption for Data=False;Tag with column collation when possible=False
  ADOConnection.Close;
  case pModulo of
    1: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=IntervaPDS;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    2: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=IntervaPDS;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    3: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=ICATMI;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    4: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=IntervaRTV;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
  end;
  ADOConnection.Open();
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if Assigned(dmDirectorios) then FreeAndNil(dmDirectorios);
end;

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
  Exit;
end;

end.
