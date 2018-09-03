unit XMLtoPDFDmod;

interface

uses
  SysUtils, Classes, xmldom, DB, DBClient, Xmlxform, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, Provider, ppBands, ppCache, ppEndUsr,
  ppMemo, ppStrtch, ppVar, ppCtrls, jpeg, ppPrnabl, ppParameter, ppModule,
  raCodMod, ppSubRpt, ADODB, Dialogs, Forms, ppDesignLayer, MidasLib,
  ppBarCode2D,
  XMLtoPDFCFDI32Dmod, XMLtoPDFCFDI33Dmod, XMLtoPDFNominaDmod;

const
  fePDF = '.PDF';
  fePNG = '.PNG';
  cXTRDir = '.\XTR\';

type
  TNLCurrency = (nlcPesos, nlcDolares);
  TdmodXMLtoPDF = class(TDataModule)
    ppReport: TppReport;
    ppDesigner: TppDesigner;
    OpenDialogXML: TOpenDialog;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure ppReportFileDeviceCreate(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FFileRTM: string;
    FCadenaOriginal: string;
    FCadenaOriginalTimbre: string;
    dmXMLtoPDFCFDI32: TdmXMLtoPDFCFDI32;
    dmXMLtoPDFCFDI33: TdmXMLtoPDFCFDI33;
    dmXMLtoPDFNomina: TdmXMLtoPDFNomina;
    FXMLDataFile: TFileName;
    procedure SetFileRTM(const Value: string);
    procedure SetCadenaOriginal(const Value: string);
    procedure SetCadenaOriginalTimbre(const Value: string);
    procedure SetXMLDataFile(const Value: TFileName);
//    function GetCadenOriginalTimbre(pFileNameXML: string): TCadenaUTF8;
    property XMLDataFile: TFileName read FXMLDataFile write SetXMLDataFile;
  public
    { Public declarations }
    function GeneratePDFFile(pXMLFileName: TFileName): TFileName; overload;
    procedure GeneratePDFFile(pXMLFileName, pPDFFileName: TFileName); overload;
    procedure PrintPDFFile(pXMLFileName: TFileName);
    procedure ModifyDocument;
    property FileRTM: string read FFileRTM write SetFileRTM;
    property CadenaOriginal: string read FCadenaOriginal write SetCadenaOriginal;
    property CadenaOriginalTimbre: string read FCadenaOriginalTimbre write SetCadenaOriginalTimbre;
  end;

implementation

uses _Utils;

{$R *.dfm}

{ TdmodXMLtoPDF }

function TdmodXMLtoPDF.GeneratePDFFile(pXMLFileName: TFileName): TFileName;
begin
  Result:= ChangeFileExt(pXMLFileName, fePDF);
  GeneratePDFFile(pXMLFileName, Result);
end;

procedure TdmodXMLtoPDF.DataModuleCreate(Sender: TObject);
begin
  dmXMLtoPDFCFDI32 := TdmXMLtoPDFCFDI32.Create(Self);
  dmXMLtoPDFCFDI33 := TdmXMLtoPDFCFDI33.Create(Self);
  dmXMLtoPDFNomina := TdmXMLtoPDFNomina.Create(Self);
end;

procedure TdmodXMLtoPDF.GeneratePDFFile(pXMLFileName, pPDFFileName: TFileName);
begin
  if FileExists(pXMLFileName) then
  begin
    //Configura el XML
    XMLDataFile := pXMLFileName;
    // Configura el reporte
    ppReport.ShowPrintDialog := False;
    ppReport.ShowCancelDialog := False;
    ppReport.DeviceType:= 'PDF';
    ppReport.PDFSettings.OpenPDFFile := False;
    ppReport.TextFileName:= pPDFFileName;
    ppReport.Print;
  end
//  else
//    raise Exception.Create(smNotExistFile);
end;

procedure TdmodXMLtoPDF.ModifyDocument;
begin
  if OpenDialogXML.Execute then
  begin
    //Configura el XML
    XMLDataFile:= OpenDialogXML.FileName;
    // Configura el reporte
//    ppReport.Parameters['RAP'].Value := True;
    ppDesigner.Menu.Items[4].Visible := False;
    ppDesigner.ShowModal;
  end;
end;

procedure TdmodXMLtoPDF.ppReportFileDeviceCreate(Sender: TObject);
begin
//  If ppReport.FindComponent('') then
//    ppImageCBB.OnPrint:= ppImageCBBPrint
end;

procedure TdmodXMLtoPDF.PrintPDFFile(pXMLFileName: TFileName);
var
  vPDFFileName: TFileName;
begin
  if FileExists(pXMLFileName) then
  begin
    //Configura el XML
    XMLDataFile := pXMLFileName;
    vPDFFileName:= ChangeFileExt(pXMLFileName, fePDF);
    // Configura el reporte
    ppReport.ShowPrintDialog:= False;
    ppReport.ShowCancelDialog:= False;
    ppReport.AllowPrintToArchive:= False;
    ppReport.DeviceType:= 'printer';
//    ppReport.PrinterSetup.Copies:= 1;
    ppReport.PrinterSetup.DocumentName:= ExtractFileName(vPDFFileName);
    ppReport.Print;
  end
//  else
//    raise Exception.Create(smNotExistFile);
end;

procedure TdmodXMLtoPDF.SetCadenaOriginal(const Value: string);
begin
  FCadenaOriginal := Value;
  dmXMLtoPDFCFDI32.CadenaOriginal := Value;
  dmXMLtoPDFCFDI33.CadenaOriginal := Value;
end;

procedure TdmodXMLtoPDF.SetCadenaOriginalTimbre(const Value: string);
begin
  FCadenaOriginalTimbre := Value;
  dmXMLtoPDFCFDI32.CadenaOriginalTimbre := Value;
  dmXMLtoPDFCFDI33.CadenaOriginalTimbre := Value;
end;

procedure TdmodXMLtoPDF.SetFileRTM(const Value: string);
begin
  FFileRTM := Value;
  ppReport.Template.FileName := Value;
  ppReport.Template.LoadFromFile;
end;

procedure TdmodXMLtoPDF.SetXMLDataFile(const Value: TFileName);
begin
  FXMLDataFile := Value;
  dmXMLtoPDFCFDI32.XMLDataFile := Value;
  dmXMLtoPDFCFDI33.XMLDataFile := Value;
  dmXMLtoPDFNomina.XMLDataFile := Value;
end;

end.
