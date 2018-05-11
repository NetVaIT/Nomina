program Nomina33;

uses
  Vcl.Forms,
  _ProgressForm in 'Standard\_ProgressForm.pas' {_frmProgress},
  _Utils in 'Standard\_Utils.pas',
  FacturaTipos in 'tfacturaelectronica\FacturaTipos.pas',
  Facturacion.GeneradorSello in 'tfacturaelectronica20\Facturacion.GeneradorSello.pas',
  Facturacion.Comprobante in 'tfacturaelectronica20\Versiones\Facturacion.Comprobante.pas',
  Facturacion.OpenSSL in 'tfacturaelectronica20\Facturacion.OpenSSL.pas',
  libeay32 in 'tfacturaelectronica20\OpenSSL\libeay32.pas',
  LibEay32Plus in 'tfacturaelectronica20\OpenSSL\LibEay32Plus.pas',
  OpenSSLUtils in 'tfacturaelectronica20\OpenSSL\OpenSSLUtils.pas',
  Facturacion.GeneradorSelloV33 in 'tfacturaelectronica20\Versiones\Facturacion.GeneradorSelloV33.pas',
  XMLtoPDFDmod in 'XMLToPDF\XMLtoPDFDmod.pas' {dmodXMLtoPDF: TDataModule},
  XMLtoPDFCFDI33Dmod in 'XMLToPDF\XMLtoPDFCFDI33Dmod.pas' {dmXMLtoPDFCFDI33: TDataModule},
  WSCFDI33 in 'WSTimbrado\WSCFDI33.pas',
  WSCFDI33Test in 'WSTimbrado\WSCFDI33Test.pas',
  MainFrm in 'Nomina33\MainFrm.pas' {frmMain},
  CFDIDM in 'Nomina33\CFDIDM.pas' {dmCFDI: TDataModule},
  CFDLibHeader in 'Nomina33\CFDLibHeader.pas',
  COBAEMDM in 'Nomina33\COBAEMDM.pas' {dmCOBAEM: TDataModule},
  DirectoriosDM in 'Nomina33\DirectoriosDM.pas' {dmDirectorios: TDataModule},
  DirectoriosFrm in 'Nomina33\DirectoriosFrm.pas' {frmDirectorios},
  IntervaDM in 'Nomina33\IntervaDM.pas' {dmInterva: TDataModule},
  DataTypeCast in 'Nomina33\DataTypeCast.pas',
  WSFinkokCancelDemo in 'WSTimbrado\WSFinkokCancelDemo.pas',
  WSFinkokStampDemo in 'WSTimbrado\WSFinkokStampDemo.pas',
  WSFinkokCancel in 'WSTimbrado\WSFinkokCancel.pas',
  WSFinkokStamp in 'WSTimbrado\WSFinkokStamp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(T_frmProgress, _frmProgress);
  Application.Run;
end.
