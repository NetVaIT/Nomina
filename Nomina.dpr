program Nomina;

uses
  Vcl.Forms,
  _Utils in 'Standard\_Utils.pas',
  _ProgressForm in 'Standard\_ProgressForm.pas' {_frmProgress},
  SelloDigital in 'tfacturaelectronica\SelloDigital.pas',
  ClaseOpenSSL in 'tfacturaelectronica\ClaseOpenSSL.pas',
  FacturaTipos in 'tfacturaelectronica\FacturaTipos.pas',
  libeay32 in 'tfacturaelectronica\libeay32.pas',
  OpenSSLUtils in 'tfacturaelectronica\OpenSSLUtils.pas',
  LibEay32Plus in 'tfacturaelectronica\LibEay32Plus.pas',
  ClaseCertificadoSellos in 'tfacturaelectronica\ClaseCertificadoSellos.pas',
  CadenaOriginalTimbre in 'tfacturaelectronica\CadenaOriginalTimbre.pas',
  XMLtoPDFDmod in 'XMLToPDF\XMLtoPDFDmod.pas' {dmodXMLtoPDF: TDataModule},
  MainFrm in 'Nomina32\MainFrm.pas' {frmMain},
  CECTIDM in 'Nomina32\CECTIDM.pas' {dmCECTI: TDataModule},
  CFDIDM in 'Nomina32\CFDIDM.pas' {dmCFDI: TDataModule},
  CFDLibHeader in 'Nomina32\CFDLibHeader.pas',
  COBAEMDM in 'Nomina32\COBAEMDM.pas' {dmCOBAEM: TDataModule},
  COFEEEMDM in 'Nomina32\COFEEEMDM.pas' {dmCOFEEEM: TDataModule},
  COMPESCADM in 'Nomina32\COMPESCADM.pas' {dmCOMPESCA: TDataModule},
  DataTypeCast in 'Nomina32\DataTypeCast.pas',
  DirectoriosDM in 'Nomina32\DirectoriosDM.pas' {dmDirectorios: TDataModule},
  DirectoriosFrm in 'Nomina32\DirectoriosFrm.pas' {frmDirectorios},
  IntervaDM in 'Nomina32\IntervaDM.pas' {dmInterva: TDataModule},
  IVEMDM in 'Nomina32\IVEMDM.pas' {dmIVEM: TDataModule},
  JUMAPAMDM in 'Nomina32\JUMAPAMDM.pas' {dmJUMAPAM: TDataModule},
  SMRTVDM in 'Nomina32\SMRTVDM.pas' {dmSMRTV: TDataModule},
  WSFinkokCancel in 'WSTimbrado\WSFinkokCancel.pas',
  WSFinkokCancelDemo in 'WSTimbrado\WSFinkokCancelDemo.pas',
  WSFinkokStamp in 'WSTimbrado\WSFinkokStamp.pas',
  WSFinkokStampDemo in 'WSTimbrado\WSFinkokStampDemo.pas',
  WSTFD in 'WSTimbrado\WSTFD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(T_frmProgress, _frmProgress);
  Application.Run;
end.
