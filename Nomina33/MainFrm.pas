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
    Button2: TButton;
    Prueba1: TMenuItem;
    Emisor1: TMenuItem;
    Salir1: TMenuItem;
    CFDLibVersion1: TMenuItem;
    SALUDSLP1: TMenuItem;
    CADPE1: TMenuItem;
    BPS1: TMenuItem;
    ABAX1: TMenuItem;
    JUMAPAM1: TMenuItem;
    Impresin1: TMenuItem;
    Modificarformato1: TMenuItem;
    procedure COBAEM1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure CFDLibVersion1Click(Sender: TObject);
    procedure Modificarformato1Click(Sender: TObject);
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

uses CFDIDM, CFDLibHeader, XMLtoPDFDmod;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  dmCFDI: TdmCFDI;
begin
  dmCFDI := TdmCFDI.Create(Self);
  try
//    dmCFDI.CrearPDF('C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\AAAA650207000_14815.XML',
//    'C:\Users\hucj1e3.FG\Documents\RAD Studio\Projects\NetVaIT\Gil\Nomina\XMLToPDF\AAAA650207000_14815.PDF');
    dmCFDI.FDUser:= 'SSS960912HW9';
    dmCFDI.FDPass:= 'v@AVJzGsS=';
    dmCFDI.FDConsultarTimbrePorReferencia('c:/temp/GARJ740114N73_14437.XML','GARJ740114N73_14437.XML');
  finally
    dmCFDI.Free;
  end;
end;

procedure TfrmMain.CFDLibVersion1Click(Sender: TObject);
begin
  ShowMessage(string(CFDLibVersion));
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
    1: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=SALUDSLP;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
//    1: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=COBAEM33;Data Source=NAS4\NOMINASV12;' +
//    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    2: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=CFDICOBAEM;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    3: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=SALUDSLP;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    4: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=CFDICADPE;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
    5: ADOConnection.ConnectionString:= 'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True;User ID=sa;Initial Catalog=CFDIJUMAPAM;Data Source=NAS4\NOMINASV12;' +
    'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';

  end;
  ADOConnection.Open();
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if Assigned(dmDirectorios) then FreeAndNil(dmDirectorios);
end;

procedure TfrmMain.Modificarformato1Click(Sender: TObject);
var
  dmodXMLtoPDF: TdmodXMLtoPDF;
begin
  dmodXMLtoPDF := TdmodXMLtoPDF.Create(Self);
  try
    dmodXMLtoPDF.ModifyDocument;
  finally
    dmodXMLtoPDF.Free;
    end;
end;

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
  Exit;
end;

end.
