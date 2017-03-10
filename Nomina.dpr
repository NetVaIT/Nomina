program Nomina;

uses
  Vcl.Forms,
  _Utils in 'Standard\_Utils.pas',
  _ProgressForm in 'Standard\_ProgressForm.pas' {_frmProgress},
  MainFrm in 'MainFrm.pas' {frmMain},
  DirectoriosDM in 'DirectoriosDM.pas' {dmDirectorios: TDataModule},
  DirectoriosFrm in 'DirectoriosFrm.pas' {frmDirectorios},
  CFDIDM in 'CFDIDM.pas' {dmCFDI: TDataModule},
  CFDLibHeader in 'CFDLibHeader.pas',
  DataTypeCast in 'DataTypeCast.pas',
  WSTFD in 'WSTFD.pas',
  SelloDigital in 'tfacturaelectronica\SelloDigital.pas',
  ClaseOpenSSL in 'tfacturaelectronica\ClaseOpenSSL.pas',
  FacturaTipos in 'tfacturaelectronica\FacturaTipos.pas',
  libeay32 in 'tfacturaelectronica\libeay32.pas',
  OpenSSLUtils in 'tfacturaelectronica\OpenSSLUtils.pas',
  LibEay32Plus in 'tfacturaelectronica\LibEay32Plus.pas',
  ClaseCertificadoSellos in 'tfacturaelectronica\ClaseCertificadoSellos.pas',
  CadenaOriginalTimbre in 'tfacturaelectronica\CadenaOriginalTimbre.pas',
  COBAEMDM in 'COBAEMDM.pas' {dmCOBAEM: TDataModule},
  IntervaDM in 'IntervaDM.pas' {dmInterva: TDataModule},
  XMLtoPDFDmod in 'XMLToPDF\XMLtoPDFDmod.pas' {dmodXMLtoPDF: TDataModule},
  WSFinkokStampDemo in 'WSFinkokStampDemo.pas',
  SMRTVDM in 'SMRTVDM.pas' {dmSMRTV: TDataModule},
  WSFinkokCancelDemo in 'WSFinkokCancelDemo.pas',
  WSFinkokStamp in 'WSFinkokStamp.pas',
  WSFinkokCancel in 'WSFinkokCancel.pas',
  IVEMDM in 'IVEMDM.pas' {dmIVEM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(T_frmProgress, _frmProgress);
  Application.Run;
end.
