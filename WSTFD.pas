// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?WSDL
//  >Import : https://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?WSDL>0
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?xsd=xsd0
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?xsd=xsd2
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?xsd=xsd3
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?xsd=xsd1
// Encoding : utf-8
// Version  : 1.0
// (25/08/2016 04:52:31 p. m. - - $Rev: 56641 $)
// ************************************************************************ //

unit WSTFD;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:anyType         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  RespuestaCreditos2   = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RespuestaEstatusCancelacionAsincrona2 = class;   { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  DetalleCancelacion2  = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RespuestaTFD2        = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RespuestaCancelacion2 = class;                { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RespuestaCancelacionAsincrona2 = class;       { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  Timbre2              = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  DetallesPaqueteCreditos2 = class;             { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  DetallesPaqueteCreditos = class;              { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaCreditos    = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaEstatusCancelacionAsincrona = class;   { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaTFD         = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RegistroTimbre2      = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RegistroTimbre       = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaReporte2    = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }
  RespuestaReporte     = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  Timbre               = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaCancelacionAsincrona = class;        { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  DetalleCancelacion   = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }
  RespuestaCancelacion = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblElm] }

  ArrayOfDetallesPaqueteCreditos = array of DetallesPaqueteCreditos2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }


  // ************************************************************************ //
  // XML       : RespuestaCreditos, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCreditos2 = class(TRemotable)
  private
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FPaquetes: ArrayOfDetallesPaqueteCreditos;
    FPaquetes_Specified: boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetPaquetes(Index: Integer; const AArrayOfDetallesPaqueteCreditos: ArrayOfDetallesPaqueteCreditos);
    function  Paquetes_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property MensajeError:     string                          Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property OperacionExitosa: Boolean                         Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property Paquetes:         ArrayOfDetallesPaqueteCreditos  Index (IS_OPTN or IS_NLBL) read FPaquetes write SetPaquetes stored Paquetes_Specified;
  end;



  // ************************************************************************ //
  // XML       : RespuestaEstatusCancelacionAsincrona, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaEstatusCancelacionAsincrona2 = class(TRemotable)
  private
    FEstatus: string;
    FEstatus_Specified: boolean;
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FReferencia: string;
    FReferencia_Specified: boolean;
    FXMLAcuse: string;
    FXMLAcuse_Specified: boolean;
    procedure SetEstatus(Index: Integer; const Astring: string);
    function  Estatus_Specified(Index: Integer): boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetReferencia(Index: Integer; const Astring: string);
    function  Referencia_Specified(Index: Integer): boolean;
    procedure SetXMLAcuse(Index: Integer; const Astring: string);
    function  XMLAcuse_Specified(Index: Integer): boolean;
  published
    property Estatus:          string   Index (IS_OPTN or IS_NLBL) read FEstatus write SetEstatus stored Estatus_Specified;
    property MensajeError:     string   Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property OperacionExitosa: Boolean  Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property Referencia:       string   Index (IS_OPTN or IS_NLBL) read FReferencia write SetReferencia stored Referencia_Specified;
    property XMLAcuse:         string   Index (IS_OPTN or IS_NLBL) read FXMLAcuse write SetXMLAcuse stored XMLAcuse_Specified;
  end;



  // ************************************************************************ //
  // XML       : DetalleCancelacion, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  DetalleCancelacion2 = class(TRemotable)
  private
    FCodigoResultado: string;
    FCodigoResultado_Specified: boolean;
    FMensajeResultado: string;
    FMensajeResultado_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    procedure SetCodigoResultado(Index: Integer; const Astring: string);
    function  CodigoResultado_Specified(Index: Integer): boolean;
    procedure SetMensajeResultado(Index: Integer; const Astring: string);
    function  MensajeResultado_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
  published
    property CodigoResultado:  string  Index (IS_OPTN or IS_NLBL) read FCodigoResultado write SetCodigoResultado stored CodigoResultado_Specified;
    property MensajeResultado: string  Index (IS_OPTN or IS_NLBL) read FMensajeResultado write SetMensajeResultado stored MensajeResultado_Specified;
    property UUID:             string  Index (IS_OPTN or IS_NLBL) read FUUID write SetUUID stored UUID_Specified;
  end;



  // ************************************************************************ //
  // XML       : RespuestaTFD, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaTFD2 = class(TRemotable)
  private
    FCodigoRespuesta: string;
    FCodigoRespuesta_Specified: boolean;
    FCreditosRestantes: Integer;
    FCreditosRestantes_Specified: boolean;
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FMensajeErrorDetallado: string;
    FMensajeErrorDetallado_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FPDFResultado: string;
    FPDFResultado_Specified: boolean;
    FTimbre: Timbre2;
    FTimbre_Specified: boolean;
    FXMLResultado: string;
    FXMLResultado_Specified: boolean;
    procedure SetCodigoRespuesta(Index: Integer; const Astring: string);
    function  CodigoRespuesta_Specified(Index: Integer): boolean;
    procedure SetCreditosRestantes(Index: Integer; const AInteger: Integer);
    function  CreditosRestantes_Specified(Index: Integer): boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetMensajeErrorDetallado(Index: Integer; const Astring: string);
    function  MensajeErrorDetallado_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetPDFResultado(Index: Integer; const Astring: string);
    function  PDFResultado_Specified(Index: Integer): boolean;
    procedure SetTimbre(Index: Integer; const ATimbre2: Timbre2);
    function  Timbre_Specified(Index: Integer): boolean;
    procedure SetXMLResultado(Index: Integer; const Astring: string);
    function  XMLResultado_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property CodigoRespuesta:       string   Index (IS_OPTN or IS_NLBL) read FCodigoRespuesta write SetCodigoRespuesta stored CodigoRespuesta_Specified;
    property CreditosRestantes:     Integer  Index (IS_OPTN) read FCreditosRestantes write SetCreditosRestantes stored CreditosRestantes_Specified;
    property MensajeError:          string   Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property MensajeErrorDetallado: string   Index (IS_OPTN or IS_NLBL) read FMensajeErrorDetallado write SetMensajeErrorDetallado stored MensajeErrorDetallado_Specified;
    property OperacionExitosa:      Boolean  Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property PDFResultado:          string   Index (IS_OPTN or IS_NLBL) read FPDFResultado write SetPDFResultado stored PDFResultado_Specified;
    property Timbre:                Timbre2  Index (IS_OPTN or IS_NLBL) read FTimbre write SetTimbre stored Timbre_Specified;
    property XMLResultado:          string   Index (IS_OPTN or IS_NLBL) read FXMLResultado write SetXMLResultado stored XMLResultado_Specified;
  end;

  ArrayOfDetalleCancelacion = array of DetalleCancelacion2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }


  // ************************************************************************ //
  // XML       : RespuestaCancelacion, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCancelacion2 = class(TRemotable)
  private
    FDetallesCancelacion: ArrayOfDetalleCancelacion;
    FDetallesCancelacion_Specified: boolean;
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FMensajeErrorDetallado: string;
    FMensajeErrorDetallado_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FXMLAcuse: string;
    FXMLAcuse_Specified: boolean;
    procedure SetDetallesCancelacion(Index: Integer; const AArrayOfDetalleCancelacion: ArrayOfDetalleCancelacion);
    function  DetallesCancelacion_Specified(Index: Integer): boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetMensajeErrorDetallado(Index: Integer; const Astring: string);
    function  MensajeErrorDetallado_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetXMLAcuse(Index: Integer; const Astring: string);
    function  XMLAcuse_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property DetallesCancelacion:   ArrayOfDetalleCancelacion  Index (IS_OPTN or IS_NLBL) read FDetallesCancelacion write SetDetallesCancelacion stored DetallesCancelacion_Specified;
    property MensajeError:          string                     Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property MensajeErrorDetallado: string                     Index (IS_OPTN or IS_NLBL) read FMensajeErrorDetallado write SetMensajeErrorDetallado stored MensajeErrorDetallado_Specified;
    property OperacionExitosa:      Boolean                    Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property XMLAcuse:              string                     Index (IS_OPTN or IS_NLBL) read FXMLAcuse write SetXMLAcuse stored XMLAcuse_Specified;
  end;



  // ************************************************************************ //
  // XML       : RespuestaCancelacionAsincrona, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCancelacionAsincrona2 = class(TRemotable)
  private
    FDetallesCancelacion: ArrayOfDetalleCancelacion;
    FDetallesCancelacion_Specified: boolean;
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FReferencia: string;
    FReferencia_Specified: boolean;
    procedure SetDetallesCancelacion(Index: Integer; const AArrayOfDetalleCancelacion: ArrayOfDetalleCancelacion);
    function  DetallesCancelacion_Specified(Index: Integer): boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetReferencia(Index: Integer; const Astring: string);
    function  Referencia_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property DetallesCancelacion: ArrayOfDetalleCancelacion  Index (IS_OPTN or IS_NLBL) read FDetallesCancelacion write SetDetallesCancelacion stored DetallesCancelacion_Specified;
    property MensajeError:        string                     Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property OperacionExitosa:    Boolean                    Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property Referencia:          string                     Index (IS_OPTN or IS_NLBL) read FReferencia write SetReferencia stored Referencia_Specified;
  end;



  // ************************************************************************ //
  // XML       : Timbre, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  Timbre2 = class(TRemotable)
  private
    FEstado: string;
    FEstado_Specified: boolean;
    FFechaTimbrado: TXSDateTime;
    FFechaTimbrado_Specified: boolean;
    FNumeroCertificadoSAT: string;
    FNumeroCertificadoSAT_Specified: boolean;
    FSelloCFD: string;
    FSelloCFD_Specified: boolean;
    FSelloSAT: string;
    FSelloSAT_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    procedure SetEstado(Index: Integer; const Astring: string);
    function  Estado_Specified(Index: Integer): boolean;
    procedure SetFechaTimbrado(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  FechaTimbrado_Specified(Index: Integer): boolean;
    procedure SetNumeroCertificadoSAT(Index: Integer; const Astring: string);
    function  NumeroCertificadoSAT_Specified(Index: Integer): boolean;
    procedure SetSelloCFD(Index: Integer; const Astring: string);
    function  SelloCFD_Specified(Index: Integer): boolean;
    procedure SetSelloSAT(Index: Integer; const Astring: string);
    function  SelloSAT_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Estado:               string       Index (IS_OPTN or IS_NLBL) read FEstado write SetEstado stored Estado_Specified;
    property FechaTimbrado:        TXSDateTime  Index (IS_OPTN) read FFechaTimbrado write SetFechaTimbrado stored FechaTimbrado_Specified;
    property NumeroCertificadoSAT: string       Index (IS_OPTN or IS_NLBL) read FNumeroCertificadoSAT write SetNumeroCertificadoSAT stored NumeroCertificadoSAT_Specified;
    property SelloCFD:             string       Index (IS_OPTN or IS_NLBL) read FSelloCFD write SetSelloCFD stored SelloCFD_Specified;
    property SelloSAT:             string       Index (IS_OPTN or IS_NLBL) read FSelloSAT write SetSelloSAT stored SelloSAT_Specified;
    property UUID:                 string       Index (IS_OPTN or IS_NLBL) read FUUID write SetUUID stored UUID_Specified;
  end;



  // ************************************************************************ //
  // XML       : DetallesPaqueteCreditos, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  DetallesPaqueteCreditos2 = class(TRemotable)
  private
    FEnUso: Boolean;
    FEnUso_Specified: boolean;
    FFechaActivacion: TXSDateTime;
    FFechaActivacion_Specified: boolean;
    FFechaVencimiento: TXSDateTime;
    FFechaVencimiento_Specified: boolean;
    FPaquete: string;
    FPaquete_Specified: boolean;
    FTimbres: Integer;
    FTimbres_Specified: boolean;
    FTimbresRestantes: Integer;
    FTimbresRestantes_Specified: boolean;
    FTimbresUsados: Integer;
    FTimbresUsados_Specified: boolean;
    FVigente: Boolean;
    FVigente_Specified: boolean;
    procedure SetEnUso(Index: Integer; const ABoolean: Boolean);
    function  EnUso_Specified(Index: Integer): boolean;
    procedure SetFechaActivacion(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  FechaActivacion_Specified(Index: Integer): boolean;
    procedure SetFechaVencimiento(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  FechaVencimiento_Specified(Index: Integer): boolean;
    procedure SetPaquete(Index: Integer; const Astring: string);
    function  Paquete_Specified(Index: Integer): boolean;
    procedure SetTimbres(Index: Integer; const AInteger: Integer);
    function  Timbres_Specified(Index: Integer): boolean;
    procedure SetTimbresRestantes(Index: Integer; const AInteger: Integer);
    function  TimbresRestantes_Specified(Index: Integer): boolean;
    procedure SetTimbresUsados(Index: Integer; const AInteger: Integer);
    function  TimbresUsados_Specified(Index: Integer): boolean;
    procedure SetVigente(Index: Integer; const ABoolean: Boolean);
    function  Vigente_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property EnUso:            Boolean      Index (IS_OPTN) read FEnUso write SetEnUso stored EnUso_Specified;
    property FechaActivacion:  TXSDateTime  Index (IS_OPTN or IS_NLBL) read FFechaActivacion write SetFechaActivacion stored FechaActivacion_Specified;
    property FechaVencimiento: TXSDateTime  Index (IS_OPTN or IS_NLBL) read FFechaVencimiento write SetFechaVencimiento stored FechaVencimiento_Specified;
    property Paquete:          string       Index (IS_OPTN or IS_NLBL) read FPaquete write SetPaquete stored Paquete_Specified;
    property Timbres:          Integer      Index (IS_OPTN) read FTimbres write SetTimbres stored Timbres_Specified;
    property TimbresRestantes: Integer      Index (IS_OPTN) read FTimbresRestantes write SetTimbresRestantes stored TimbresRestantes_Specified;
    property TimbresUsados:    Integer      Index (IS_OPTN) read FTimbresUsados write SetTimbresUsados stored TimbresUsados_Specified;
    property Vigente:          Boolean      Index (IS_OPTN) read FVigente write SetVigente stored Vigente_Specified;
  end;



  // ************************************************************************ //
  // XML       : DetallesPaqueteCreditos, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  DetallesPaqueteCreditos = class(DetallesPaqueteCreditos2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaCreditos, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCreditos = class(RespuestaCreditos2)
  private
  published
  end;

  ArrayOfanyType = array of Variant;            { "http://schemas.microsoft.com/2003/10/Serialization/Arrays"[GblCplx] }
  ArrayOfstring = array of string;              { "http://schemas.microsoft.com/2003/10/Serialization/Arrays"[GblCplx] }


  // ************************************************************************ //
  // XML       : RespuestaEstatusCancelacionAsincrona, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaEstatusCancelacionAsincrona = class(RespuestaEstatusCancelacionAsincrona2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaTFD, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaTFD = class(RespuestaTFD2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RegistroTimbre, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RegistroTimbre2 = class(TRemotable)
  private
    FEstado: string;
    FEstado_Specified: boolean;
    FFechaTimbrado: TXSDateTime;
    FFechaTimbrado_Specified: boolean;
    FNoFila: Integer;
    FNoFila_Specified: boolean;
    FRFCEmisor: string;
    FRFCEmisor_Specified: boolean;
    FRFCReceptor: string;
    FRFCReceptor_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    procedure SetEstado(Index: Integer; const Astring: string);
    function  Estado_Specified(Index: Integer): boolean;
    procedure SetFechaTimbrado(Index: Integer; const ATXSDateTime: TXSDateTime);
    function  FechaTimbrado_Specified(Index: Integer): boolean;
    procedure SetNoFila(Index: Integer; const AInteger: Integer);
    function  NoFila_Specified(Index: Integer): boolean;
    procedure SetRFCEmisor(Index: Integer; const Astring: string);
    function  RFCEmisor_Specified(Index: Integer): boolean;
    procedure SetRFCReceptor(Index: Integer; const Astring: string);
    function  RFCReceptor_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Estado:        string       Index (IS_OPTN or IS_NLBL) read FEstado write SetEstado stored Estado_Specified;
    property FechaTimbrado: TXSDateTime  Index (IS_OPTN) read FFechaTimbrado write SetFechaTimbrado stored FechaTimbrado_Specified;
    property NoFila:        Integer      Index (IS_OPTN) read FNoFila write SetNoFila stored NoFila_Specified;
    property RFCEmisor:     string       Index (IS_OPTN or IS_NLBL) read FRFCEmisor write SetRFCEmisor stored RFCEmisor_Specified;
    property RFCReceptor:   string       Index (IS_OPTN or IS_NLBL) read FRFCReceptor write SetRFCReceptor stored RFCReceptor_Specified;
    property UUID:          string       Index (IS_OPTN or IS_NLBL) read FUUID write SetUUID stored UUID_Specified;
  end;



  // ************************************************************************ //
  // XML       : RegistroTimbre, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RegistroTimbre = class(RegistroTimbre2)
  private
  published
  end;

  ArrayOfRegistroTimbre = array of RegistroTimbre2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"[GblCplx] }


  // ************************************************************************ //
  // XML       : RespuestaReporte, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaReporte2 = class(TRemotable)
  private
    FListaComprobantes: ArrayOfRegistroTimbre;
    FListaComprobantes_Specified: boolean;
    FMensajeError: string;
    FMensajeError_Specified: boolean;
    FOperacionExitosa: Boolean;
    FOperacionExitosa_Specified: boolean;
    FTotalComprobantesPeriodo: Integer;
    FTotalComprobantesPeriodo_Specified: boolean;
    procedure SetListaComprobantes(Index: Integer; const AArrayOfRegistroTimbre: ArrayOfRegistroTimbre);
    function  ListaComprobantes_Specified(Index: Integer): boolean;
    procedure SetMensajeError(Index: Integer; const Astring: string);
    function  MensajeError_Specified(Index: Integer): boolean;
    procedure SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
    function  OperacionExitosa_Specified(Index: Integer): boolean;
    procedure SetTotalComprobantesPeriodo(Index: Integer; const AInteger: Integer);
    function  TotalComprobantesPeriodo_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ListaComprobantes:        ArrayOfRegistroTimbre  Index (IS_OPTN or IS_NLBL) read FListaComprobantes write SetListaComprobantes stored ListaComprobantes_Specified;
    property MensajeError:             string                 Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property OperacionExitosa:         Boolean                Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property TotalComprobantesPeriodo: Integer                Index (IS_OPTN) read FTotalComprobantesPeriodo write SetTotalComprobantesPeriodo stored TotalComprobantesPeriodo_Specified;
  end;



  // ************************************************************************ //
  // XML       : RespuestaReporte, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaReporte = class(RespuestaReporte2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : Timbre, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  Timbre = class(Timbre2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaCancelacionAsincrona, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCancelacionAsincrona = class(RespuestaCancelacionAsincrona2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : DetalleCancelacion, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  DetalleCancelacion = class(DetalleCancelacion2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaCancelacion, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.Negocios
  // ************************************************************************ //
  RespuestaCancelacion = class(RespuestaCancelacion2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IWSTFD/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : soapHttpEndpoint
  // service   : WSTFD
  // port      : soapHttpEndpoint
  // URL       : http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc
  // ************************************************************************ //
  IWSTFD = interface(IInvokable)
  ['{DF48ADC2-D96E-0B24-0FDE-EDA110AD318E}']
    function  TimbrarCFDI(const usuario: string; const password: string; const cadenaXML: string; const referencia: string): RespuestaTFD2; stdcall;
    function  CancelarCFDI(const usuario: string; const password: string; const rFCEmisor: string; const listaCFDI: ArrayOfstring; const clavePrivada_Base64: string; const passwordClavePrivada: string
                           ): RespuestaCancelacion2; stdcall;
    function  CancelacionAsincrona(const usuario: string; const password: string; const rFCEmisor: string; const listaCFDI: ArrayOfstring; const clavePrivada_Base64: string; const passwordClavePrivada: string
                                   ): RespuestaCancelacionAsincrona2; stdcall;
    function  EstatusCancelacionAsincrona(const usuario: string; const password: string; const referencia: string): RespuestaEstatusCancelacionAsincrona2; stdcall;
    function  TimbrarCFDTestSectorPrimario(const usuario: string; const password: string; const cadenaXML: string; const referencia: string): RespuestaTFD2; stdcall;
    function  ObtenerPDF(const usuario: string; const password: string; const uUID: string; const LogoBase64: string): RespuestaTFD2; stdcall;
    function  ObtenerAcuseEnvio(const usuario: string; const password: string; const uUID: string): RespuestaTFD2; stdcall;
    function  ObtenerAcuseCancelacion(const usuario: string; const password: string; const uUID: string): RespuestaTFD2; stdcall;
    function  CambiarPassword(const usuario: string; const passwordActual: string; const passwordNuevo: string): RespuestaTFD2; stdcall;
    function  ConsultarComplementoTimbre(const usuario: string; const password: string; const uUID: string): RespuestaTFD2; stdcall;
    function  ConsultarTimbrePorReferencia(const usuario: string; const password: string; const referencia: string): RespuestaTFD2; stdcall;
    function  ConsultarCreditos(const usuario: string; const password: string): RespuestaCreditos2; stdcall;
    function  ConsultarComprobantes(const usuario: string; const password: string; const fechaInicial: TXSDateTime; const fechaFinal: TXSDateTime; const filaInicial: Integer): RespuestaReporte2; stdcall;
    function  ObtenerPaquetesClientes(const LClientes: ArrayOfstring): ArrayOfanyType; stdcall;
  end;

function GetIWSTFD(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IWSTFD;


implementation
  uses SysUtils;

function GetIWSTFD(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IWSTFD;
const
  defWSDL = 'https://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc?WSDL';
  defURL  = 'http://www.foliosdigitalespac.com/WSTimbrado/WSTFD.svc';
  defSvc  = 'WSTFD';
  defPrt  = 'soapHttpEndpoint';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IWSTFD);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor RespuestaCreditos2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FPaquetes)-1 do
    SysUtils.FreeAndNil(FPaquetes[I]);
  System.SetLength(FPaquetes, 0);
  inherited Destroy;
end;

procedure RespuestaCreditos2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaCreditos2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaCreditos2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaCreditos2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaCreditos2.SetPaquetes(Index: Integer; const AArrayOfDetallesPaqueteCreditos: ArrayOfDetallesPaqueteCreditos);
begin
  FPaquetes := AArrayOfDetallesPaqueteCreditos;
  FPaquetes_Specified := True;
end;

function RespuestaCreditos2.Paquetes_Specified(Index: Integer): boolean;
begin
  Result := FPaquetes_Specified;
end;

procedure RespuestaEstatusCancelacionAsincrona2.SetEstatus(Index: Integer; const Astring: string);
begin
  FEstatus := Astring;
  FEstatus_Specified := True;
end;

function RespuestaEstatusCancelacionAsincrona2.Estatus_Specified(Index: Integer): boolean;
begin
  Result := FEstatus_Specified;
end;

procedure RespuestaEstatusCancelacionAsincrona2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaEstatusCancelacionAsincrona2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaEstatusCancelacionAsincrona2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaEstatusCancelacionAsincrona2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaEstatusCancelacionAsincrona2.SetReferencia(Index: Integer; const Astring: string);
begin
  FReferencia := Astring;
  FReferencia_Specified := True;
end;

function RespuestaEstatusCancelacionAsincrona2.Referencia_Specified(Index: Integer): boolean;
begin
  Result := FReferencia_Specified;
end;

procedure RespuestaEstatusCancelacionAsincrona2.SetXMLAcuse(Index: Integer; const Astring: string);
begin
  FXMLAcuse := Astring;
  FXMLAcuse_Specified := True;
end;

function RespuestaEstatusCancelacionAsincrona2.XMLAcuse_Specified(Index: Integer): boolean;
begin
  Result := FXMLAcuse_Specified;
end;

procedure DetalleCancelacion2.SetCodigoResultado(Index: Integer; const Astring: string);
begin
  FCodigoResultado := Astring;
  FCodigoResultado_Specified := True;
end;

function DetalleCancelacion2.CodigoResultado_Specified(Index: Integer): boolean;
begin
  Result := FCodigoResultado_Specified;
end;

procedure DetalleCancelacion2.SetMensajeResultado(Index: Integer; const Astring: string);
begin
  FMensajeResultado := Astring;
  FMensajeResultado_Specified := True;
end;

function DetalleCancelacion2.MensajeResultado_Specified(Index: Integer): boolean;
begin
  Result := FMensajeResultado_Specified;
end;

procedure DetalleCancelacion2.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function DetalleCancelacion2.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

destructor RespuestaTFD2.Destroy;
begin
  SysUtils.FreeAndNil(FTimbre);
  inherited Destroy;
end;

procedure RespuestaTFD2.SetCodigoRespuesta(Index: Integer; const Astring: string);
begin
  FCodigoRespuesta := Astring;
  FCodigoRespuesta_Specified := True;
end;

function RespuestaTFD2.CodigoRespuesta_Specified(Index: Integer): boolean;
begin
  Result := FCodigoRespuesta_Specified;
end;

procedure RespuestaTFD2.SetCreditosRestantes(Index: Integer; const AInteger: Integer);
begin
  FCreditosRestantes := AInteger;
  FCreditosRestantes_Specified := True;
end;

function RespuestaTFD2.CreditosRestantes_Specified(Index: Integer): boolean;
begin
  Result := FCreditosRestantes_Specified;
end;

procedure RespuestaTFD2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaTFD2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaTFD2.SetMensajeErrorDetallado(Index: Integer; const Astring: string);
begin
  FMensajeErrorDetallado := Astring;
  FMensajeErrorDetallado_Specified := True;
end;

function RespuestaTFD2.MensajeErrorDetallado_Specified(Index: Integer): boolean;
begin
  Result := FMensajeErrorDetallado_Specified;
end;

procedure RespuestaTFD2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaTFD2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaTFD2.SetPDFResultado(Index: Integer; const Astring: string);
begin
  FPDFResultado := Astring;
  FPDFResultado_Specified := True;
end;

function RespuestaTFD2.PDFResultado_Specified(Index: Integer): boolean;
begin
  Result := FPDFResultado_Specified;
end;

procedure RespuestaTFD2.SetTimbre(Index: Integer; const ATimbre2: Timbre2);
begin
  FTimbre := ATimbre2;
  FTimbre_Specified := True;
end;

function RespuestaTFD2.Timbre_Specified(Index: Integer): boolean;
begin
  Result := FTimbre_Specified;
end;

procedure RespuestaTFD2.SetXMLResultado(Index: Integer; const Astring: string);
begin
  FXMLResultado := Astring;
  FXMLResultado_Specified := True;
end;

function RespuestaTFD2.XMLResultado_Specified(Index: Integer): boolean;
begin
  Result := FXMLResultado_Specified;
end;

destructor RespuestaCancelacion2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDetallesCancelacion)-1 do
    SysUtils.FreeAndNil(FDetallesCancelacion[I]);
  System.SetLength(FDetallesCancelacion, 0);
  inherited Destroy;
end;

procedure RespuestaCancelacion2.SetDetallesCancelacion(Index: Integer; const AArrayOfDetalleCancelacion: ArrayOfDetalleCancelacion);
begin
  FDetallesCancelacion := AArrayOfDetalleCancelacion;
  FDetallesCancelacion_Specified := True;
end;

function RespuestaCancelacion2.DetallesCancelacion_Specified(Index: Integer): boolean;
begin
  Result := FDetallesCancelacion_Specified;
end;

procedure RespuestaCancelacion2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaCancelacion2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaCancelacion2.SetMensajeErrorDetallado(Index: Integer; const Astring: string);
begin
  FMensajeErrorDetallado := Astring;
  FMensajeErrorDetallado_Specified := True;
end;

function RespuestaCancelacion2.MensajeErrorDetallado_Specified(Index: Integer): boolean;
begin
  Result := FMensajeErrorDetallado_Specified;
end;

procedure RespuestaCancelacion2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaCancelacion2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaCancelacion2.SetXMLAcuse(Index: Integer; const Astring: string);
begin
  FXMLAcuse := Astring;
  FXMLAcuse_Specified := True;
end;

function RespuestaCancelacion2.XMLAcuse_Specified(Index: Integer): boolean;
begin
  Result := FXMLAcuse_Specified;
end;

destructor RespuestaCancelacionAsincrona2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDetallesCancelacion)-1 do
    SysUtils.FreeAndNil(FDetallesCancelacion[I]);
  System.SetLength(FDetallesCancelacion, 0);
  inherited Destroy;
end;

procedure RespuestaCancelacionAsincrona2.SetDetallesCancelacion(Index: Integer; const AArrayOfDetalleCancelacion: ArrayOfDetalleCancelacion);
begin
  FDetallesCancelacion := AArrayOfDetalleCancelacion;
  FDetallesCancelacion_Specified := True;
end;

function RespuestaCancelacionAsincrona2.DetallesCancelacion_Specified(Index: Integer): boolean;
begin
  Result := FDetallesCancelacion_Specified;
end;

procedure RespuestaCancelacionAsincrona2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaCancelacionAsincrona2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaCancelacionAsincrona2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaCancelacionAsincrona2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaCancelacionAsincrona2.SetReferencia(Index: Integer; const Astring: string);
begin
  FReferencia := Astring;
  FReferencia_Specified := True;
end;

function RespuestaCancelacionAsincrona2.Referencia_Specified(Index: Integer): boolean;
begin
  Result := FReferencia_Specified;
end;

destructor Timbre2.Destroy;
begin
  SysUtils.FreeAndNil(FFechaTimbrado);
  inherited Destroy;
end;

procedure Timbre2.SetEstado(Index: Integer; const Astring: string);
begin
  FEstado := Astring;
  FEstado_Specified := True;
end;

function Timbre2.Estado_Specified(Index: Integer): boolean;
begin
  Result := FEstado_Specified;
end;

procedure Timbre2.SetFechaTimbrado(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FFechaTimbrado := ATXSDateTime;
  FFechaTimbrado_Specified := True;
end;

function Timbre2.FechaTimbrado_Specified(Index: Integer): boolean;
begin
  Result := FFechaTimbrado_Specified;
end;

procedure Timbre2.SetNumeroCertificadoSAT(Index: Integer; const Astring: string);
begin
  FNumeroCertificadoSAT := Astring;
  FNumeroCertificadoSAT_Specified := True;
end;

function Timbre2.NumeroCertificadoSAT_Specified(Index: Integer): boolean;
begin
  Result := FNumeroCertificadoSAT_Specified;
end;

procedure Timbre2.SetSelloCFD(Index: Integer; const Astring: string);
begin
  FSelloCFD := Astring;
  FSelloCFD_Specified := True;
end;

function Timbre2.SelloCFD_Specified(Index: Integer): boolean;
begin
  Result := FSelloCFD_Specified;
end;

procedure Timbre2.SetSelloSAT(Index: Integer; const Astring: string);
begin
  FSelloSAT := Astring;
  FSelloSAT_Specified := True;
end;

function Timbre2.SelloSAT_Specified(Index: Integer): boolean;
begin
  Result := FSelloSAT_Specified;
end;

procedure Timbre2.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function Timbre2.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

destructor DetallesPaqueteCreditos2.Destroy;
begin
  SysUtils.FreeAndNil(FFechaActivacion);
  SysUtils.FreeAndNil(FFechaVencimiento);
  inherited Destroy;
end;

procedure DetallesPaqueteCreditos2.SetEnUso(Index: Integer; const ABoolean: Boolean);
begin
  FEnUso := ABoolean;
  FEnUso_Specified := True;
end;

function DetallesPaqueteCreditos2.EnUso_Specified(Index: Integer): boolean;
begin
  Result := FEnUso_Specified;
end;

procedure DetallesPaqueteCreditos2.SetFechaActivacion(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FFechaActivacion := ATXSDateTime;
  FFechaActivacion_Specified := True;
end;

function DetallesPaqueteCreditos2.FechaActivacion_Specified(Index: Integer): boolean;
begin
  Result := FFechaActivacion_Specified;
end;

procedure DetallesPaqueteCreditos2.SetFechaVencimiento(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FFechaVencimiento := ATXSDateTime;
  FFechaVencimiento_Specified := True;
end;

function DetallesPaqueteCreditos2.FechaVencimiento_Specified(Index: Integer): boolean;
begin
  Result := FFechaVencimiento_Specified;
end;

procedure DetallesPaqueteCreditos2.SetPaquete(Index: Integer; const Astring: string);
begin
  FPaquete := Astring;
  FPaquete_Specified := True;
end;

function DetallesPaqueteCreditos2.Paquete_Specified(Index: Integer): boolean;
begin
  Result := FPaquete_Specified;
end;

procedure DetallesPaqueteCreditos2.SetTimbres(Index: Integer; const AInteger: Integer);
begin
  FTimbres := AInteger;
  FTimbres_Specified := True;
end;

function DetallesPaqueteCreditos2.Timbres_Specified(Index: Integer): boolean;
begin
  Result := FTimbres_Specified;
end;

procedure DetallesPaqueteCreditos2.SetTimbresRestantes(Index: Integer; const AInteger: Integer);
begin
  FTimbresRestantes := AInteger;
  FTimbresRestantes_Specified := True;
end;

function DetallesPaqueteCreditos2.TimbresRestantes_Specified(Index: Integer): boolean;
begin
  Result := FTimbresRestantes_Specified;
end;

procedure DetallesPaqueteCreditos2.SetTimbresUsados(Index: Integer; const AInteger: Integer);
begin
  FTimbresUsados := AInteger;
  FTimbresUsados_Specified := True;
end;

function DetallesPaqueteCreditos2.TimbresUsados_Specified(Index: Integer): boolean;
begin
  Result := FTimbresUsados_Specified;
end;

procedure DetallesPaqueteCreditos2.SetVigente(Index: Integer; const ABoolean: Boolean);
begin
  FVigente := ABoolean;
  FVigente_Specified := True;
end;

function DetallesPaqueteCreditos2.Vigente_Specified(Index: Integer): boolean;
begin
  Result := FVigente_Specified;
end;

destructor RegistroTimbre2.Destroy;
begin
  SysUtils.FreeAndNil(FFechaTimbrado);
  inherited Destroy;
end;

procedure RegistroTimbre2.SetEstado(Index: Integer; const Astring: string);
begin
  FEstado := Astring;
  FEstado_Specified := True;
end;

function RegistroTimbre2.Estado_Specified(Index: Integer): boolean;
begin
  Result := FEstado_Specified;
end;

procedure RegistroTimbre2.SetFechaTimbrado(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FFechaTimbrado := ATXSDateTime;
  FFechaTimbrado_Specified := True;
end;

function RegistroTimbre2.FechaTimbrado_Specified(Index: Integer): boolean;
begin
  Result := FFechaTimbrado_Specified;
end;

procedure RegistroTimbre2.SetNoFila(Index: Integer; const AInteger: Integer);
begin
  FNoFila := AInteger;
  FNoFila_Specified := True;
end;

function RegistroTimbre2.NoFila_Specified(Index: Integer): boolean;
begin
  Result := FNoFila_Specified;
end;

procedure RegistroTimbre2.SetRFCEmisor(Index: Integer; const Astring: string);
begin
  FRFCEmisor := Astring;
  FRFCEmisor_Specified := True;
end;

function RegistroTimbre2.RFCEmisor_Specified(Index: Integer): boolean;
begin
  Result := FRFCEmisor_Specified;
end;

procedure RegistroTimbre2.SetRFCReceptor(Index: Integer; const Astring: string);
begin
  FRFCReceptor := Astring;
  FRFCReceptor_Specified := True;
end;

function RegistroTimbre2.RFCReceptor_Specified(Index: Integer): boolean;
begin
  Result := FRFCReceptor_Specified;
end;

procedure RegistroTimbre2.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function RegistroTimbre2.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

destructor RespuestaReporte2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FListaComprobantes)-1 do
    SysUtils.FreeAndNil(FListaComprobantes[I]);
  System.SetLength(FListaComprobantes, 0);
  inherited Destroy;
end;

procedure RespuestaReporte2.SetListaComprobantes(Index: Integer; const AArrayOfRegistroTimbre: ArrayOfRegistroTimbre);
begin
  FListaComprobantes := AArrayOfRegistroTimbre;
  FListaComprobantes_Specified := True;
end;

function RespuestaReporte2.ListaComprobantes_Specified(Index: Integer): boolean;
begin
  Result := FListaComprobantes_Specified;
end;

procedure RespuestaReporte2.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaReporte2.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaReporte2.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaReporte2.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaReporte2.SetTotalComprobantesPeriodo(Index: Integer; const AInteger: Integer);
begin
  FTotalComprobantesPeriodo := AInteger;
  FTotalComprobantesPeriodo_Specified := True;
end;

function RespuestaReporte2.TotalComprobantesPeriodo_Specified(Index: Integer): boolean;
begin
  Result := FTotalComprobantesPeriodo_Specified;
end;

initialization
  { IWSTFD }
  InvRegistry.RegisterInterface(TypeInfo(IWSTFD), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWSTFD), 'http://tempuri.org/IWSTFD/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IWSTFD), ioDocument);
  { IWSTFD.TimbrarCFDI }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', '',
                                 '[ReturnName="TimbrarCFDIResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', 'cadenaXML', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDI', 'TimbrarCFDIResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.CancelarCFDI }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'CancelarCFDI', '',
                                 '[ReturnName="CancelarCFDIResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'rFCEmisor', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'listaCFDI', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'clavePrivada_Base64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'passwordClavePrivada', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelarCFDI', 'CancelarCFDIResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.CancelacionAsincrona }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', '',
                                 '[ReturnName="CancelacionAsincronaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'rFCEmisor', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'listaCFDI', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'clavePrivada_Base64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'passwordClavePrivada', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CancelacionAsincrona', 'CancelacionAsincronaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.EstatusCancelacionAsincrona }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'EstatusCancelacionAsincrona', '',
                                 '[ReturnName="EstatusCancelacionAsincronaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'EstatusCancelacionAsincrona', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'EstatusCancelacionAsincrona', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'EstatusCancelacionAsincrona', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'EstatusCancelacionAsincrona', 'EstatusCancelacionAsincronaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.TimbrarCFDTestSectorPrimario }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', '',
                                 '[ReturnName="TimbrarCFDTestSectorPrimarioResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', 'cadenaXML', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'TimbrarCFDTestSectorPrimario', 'TimbrarCFDTestSectorPrimarioResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ObtenerPDF }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ObtenerPDF', '',
                                 '[ReturnName="ObtenerPDFResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPDF', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPDF', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPDF', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPDF', 'LogoBase64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPDF', 'ObtenerPDFResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ObtenerAcuseEnvio }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ObtenerAcuseEnvio', '',
                                 '[ReturnName="ObtenerAcuseEnvioResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseEnvio', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseEnvio', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseEnvio', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseEnvio', 'ObtenerAcuseEnvioResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ObtenerAcuseCancelacion }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ObtenerAcuseCancelacion', '',
                                 '[ReturnName="ObtenerAcuseCancelacionResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseCancelacion', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseCancelacion', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseCancelacion', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerAcuseCancelacion', 'ObtenerAcuseCancelacionResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.CambiarPassword }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'CambiarPassword', '',
                                 '[ReturnName="CambiarPasswordResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CambiarPassword', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CambiarPassword', 'passwordActual', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CambiarPassword', 'passwordNuevo', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'CambiarPassword', 'CambiarPasswordResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ConsultarComplementoTimbre }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ConsultarComplementoTimbre', '',
                                 '[ReturnName="ConsultarComplementoTimbreResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComplementoTimbre', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComplementoTimbre', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComplementoTimbre', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComplementoTimbre', 'ConsultarComplementoTimbreResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ConsultarTimbrePorReferencia }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ConsultarTimbrePorReferencia', '',
                                 '[ReturnName="ConsultarTimbrePorReferenciaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarTimbrePorReferencia', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarTimbrePorReferencia', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarTimbrePorReferencia', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarTimbrePorReferencia', 'ConsultarTimbrePorReferenciaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ConsultarCreditos }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ConsultarCreditos', '',
                                 '[ReturnName="ConsultarCreditosResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarCreditos', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarCreditos', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarCreditos', 'ConsultarCreditosResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ConsultarComprobantes }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ConsultarComprobantes', '',
                                 '[ReturnName="ConsultarComprobantesResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComprobantes', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComprobantes', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ConsultarComprobantes', 'ConsultarComprobantesResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.Negocios"]', IS_NLBL);
  { IWSTFD.ObtenerPaquetesClientes }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSTFD), 'ObtenerPaquetesClientes', '',
                                 '[ReturnName="ObtenerPaquetesClientesResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPaquetesClientes', 'LClientes', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSTFD), 'ObtenerPaquetesClientes', 'ObtenerPaquetesClientesResult', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="anyType"]', IS_NLBL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDetallesPaqueteCreditos), 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'ArrayOfDetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSClass(RespuestaCreditos2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCreditos2', 'RespuestaCreditos');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCreditos2), 'Paquetes', '[ArrayItemName="DetallesPaqueteCreditos"]');
  RemClassRegistry.RegisterXSClass(RespuestaEstatusCancelacionAsincrona2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaEstatusCancelacionAsincrona2', 'RespuestaEstatusCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(DetalleCancelacion2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'DetalleCancelacion2', 'DetalleCancelacion');
  RemClassRegistry.RegisterXSClass(RespuestaTFD2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaTFD2', 'RespuestaTFD');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDetalleCancelacion), 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'ArrayOfDetalleCancelacion');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacion2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCancelacion2', 'RespuestaCancelacion');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCancelacion2), 'DetallesCancelacion', '[ArrayItemName="DetalleCancelacion"]');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacionAsincrona2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCancelacionAsincrona2', 'RespuestaCancelacionAsincrona');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCancelacionAsincrona2), 'DetallesCancelacion', '[ArrayItemName="DetalleCancelacion"]');
  RemClassRegistry.RegisterXSClass(Timbre2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'Timbre2', 'Timbre');
  RemClassRegistry.RegisterXSClass(DetallesPaqueteCreditos2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'DetallesPaqueteCreditos2', 'DetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSClass(DetallesPaqueteCreditos, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'DetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSClass(RespuestaCreditos, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCreditos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfanyType), 'http://schemas.microsoft.com/2003/10/Serialization/Arrays', 'ArrayOfanyType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfstring), 'http://schemas.microsoft.com/2003/10/Serialization/Arrays', 'ArrayOfstring');
  RemClassRegistry.RegisterXSClass(RespuestaEstatusCancelacionAsincrona, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaEstatusCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(RespuestaTFD, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaTFD');
  RemClassRegistry.RegisterXSClass(RegistroTimbre2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RegistroTimbre2', 'RegistroTimbre');
  RemClassRegistry.RegisterXSClass(RegistroTimbre, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RegistroTimbre');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegistroTimbre), 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'ArrayOfRegistroTimbre');
  RemClassRegistry.RegisterXSClass(RespuestaReporte2, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaReporte2', 'RespuestaReporte');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaReporte2), 'ListaComprobantes', '[ArrayItemName="RegistroTimbre"]');
  RemClassRegistry.RegisterXSClass(RespuestaReporte, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaReporte');
  RemClassRegistry.RegisterXSClass(Timbre, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'Timbre');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacionAsincrona, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(DetalleCancelacion, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'DetalleCancelacion');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacion, 'http://schemas.datacontract.org/2004/07/TES.TFD.Negocios', 'RespuestaCancelacion');

end.