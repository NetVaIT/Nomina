// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?WSDL
//  >Import : https://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?WSDL>0
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?xsd=xsd0
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?xsd=xsd2
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?xsd=xsd3
//  >Import : http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?xsd=xsd1
// Encoding : utf-8
// Version  : 1.0
// (08/12/2017 02:03:39 p. m. - - $Rev: 56641 $)
// ************************************************************************ //

unit WSCFDI33;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]

  DetalleCancelacion2  = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaTFD332      = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaCreditos2   = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaEstatusCancelacionAsincrona2 = class;   { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaCancelacionAsincrona2 = class;       { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaCancelacion2 = class;                { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  DetallesPaqueteCreditos2 = class;             { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  Timbre332            = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaCreditos    = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RespuestaEstatusCancelacionAsincrona = class;   { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RespuestaCancelacionAsincrona = class;        { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  DetallesPaqueteCreditos = class;              { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RegistroTimbre2      = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RegistroTimbre       = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RespuestaReporte2    = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  RespuestaReporte     = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RespuestaTFD33       = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  DetalleCancelacion   = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  RespuestaCancelacion = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }
  Timbre33             = class;                 { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblElm] }

  ArrayOfDetallesPaqueteCreditos = array of DetallesPaqueteCreditos2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }
  ArrayOfDetalleCancelacion = array of DetalleCancelacion2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }


  // ************************************************************************ //
  // XML       : DetalleCancelacion, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // XML       : RespuestaTFD33, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaTFD332 = class(TRemotable)
  private
    FCodigoConfirmacion: string;
    FCodigoConfirmacion_Specified: boolean;
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
    FTimbre: Timbre332;
    FTimbre_Specified: boolean;
    FXMLResultado: string;
    FXMLResultado_Specified: boolean;
    procedure SetCodigoConfirmacion(Index: Integer; const Astring: string);
    function  CodigoConfirmacion_Specified(Index: Integer): boolean;
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
    procedure SetTimbre(Index: Integer; const ATimbre332: Timbre332);
    function  Timbre_Specified(Index: Integer): boolean;
    procedure SetXMLResultado(Index: Integer; const Astring: string);
    function  XMLResultado_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property CodigoConfirmacion:    string     Index (IS_OPTN or IS_NLBL) read FCodigoConfirmacion write SetCodigoConfirmacion stored CodigoConfirmacion_Specified;
    property CodigoRespuesta:       string     Index (IS_OPTN or IS_NLBL) read FCodigoRespuesta write SetCodigoRespuesta stored CodigoRespuesta_Specified;
    property CreditosRestantes:     Integer    Index (IS_OPTN) read FCreditosRestantes write SetCreditosRestantes stored CreditosRestantes_Specified;
    property MensajeError:          string     Index (IS_OPTN or IS_NLBL) read FMensajeError write SetMensajeError stored MensajeError_Specified;
    property MensajeErrorDetallado: string     Index (IS_OPTN or IS_NLBL) read FMensajeErrorDetallado write SetMensajeErrorDetallado stored MensajeErrorDetallado_Specified;
    property OperacionExitosa:      Boolean    Index (IS_OPTN) read FOperacionExitosa write SetOperacionExitosa stored OperacionExitosa_Specified;
    property PDFResultado:          string     Index (IS_OPTN or IS_NLBL) read FPDFResultado write SetPDFResultado stored PDFResultado_Specified;
    property Timbre:                Timbre332  Index (IS_OPTN or IS_NLBL) read FTimbre write SetTimbre stored Timbre_Specified;
    property XMLResultado:          string     Index (IS_OPTN or IS_NLBL) read FXMLResultado write SetXMLResultado stored XMLResultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : RespuestaCreditos, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // XML       : RespuestaCancelacionAsincrona, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // XML       : RespuestaCancelacion, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // XML       : DetallesPaqueteCreditos, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // XML       : Timbre33, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  Timbre332 = class(TRemotable)
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
  // XML       : RespuestaCreditos, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaCreditos = class(RespuestaCreditos2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaEstatusCancelacionAsincrona, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaEstatusCancelacionAsincrona = class(RespuestaEstatusCancelacionAsincrona2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaCancelacionAsincrona, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaCancelacionAsincrona = class(RespuestaCancelacionAsincrona2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : DetallesPaqueteCreditos, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  DetallesPaqueteCreditos = class(DetallesPaqueteCreditos2)
  private
  published
  end;

  ArrayOfstring = array of string;              { "http://schemas.microsoft.com/2003/10/Serialization/Arrays"[GblCplx] }


  // ************************************************************************ //
  // XML       : RegistroTimbre, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RegistroTimbre = class(RegistroTimbre2)
  private
  published
  end;

  ArrayOfRegistroTimbre = array of RegistroTimbre2;   { "http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"[GblCplx] }


  // ************************************************************************ //
  // XML       : RespuestaReporte, global, <complexType>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
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
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaReporte = class(RespuestaReporte2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaTFD33, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaTFD33 = class(RespuestaTFD332)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : DetalleCancelacion, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  DetalleCancelacion = class(DetalleCancelacion2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RespuestaCancelacion, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  RespuestaCancelacion = class(RespuestaCancelacion2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : Timbre33, global, <element>
  // Namespace : http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios
  // ************************************************************************ //
  Timbre33 = class(Timbre332)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IWSCFDI33/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : soapHttpEndpoint
  // service   : WSCFDI33
  // port      : soapHttpEndpoint
  // URL       : http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc
  // ************************************************************************ //
  IWSCFDI33 = interface(IInvokable)
  ['{4D5F3785-EFDE-7BBC-1187-BEC333FED87A}']
    function  TimbrarCFDI(const usuario: string; const password: string; const cadenaXML: string; const referencia: string): RespuestaTFD332; stdcall;
    function  CancelarCFDI(const usuario: string; const password: string; const rFCEmisor: string; const listaCFDI: ArrayOfstring; const clavePrivada_Base64: string; const passwordClavePrivada: string
                           ): RespuestaCancelacion2; stdcall;
    function  CancelacionAsincrona(const usuario: string; const password: string; const rFCEmisor: string; const listaCFDI: ArrayOfstring; const clavePrivada_Base64: string; const passwordClavePrivada: string
                                   ): RespuestaCancelacionAsincrona2; stdcall;
    function  EstatusCancelacionAsincrona(const usuario: string; const password: string; const referencia: string): RespuestaEstatusCancelacionAsincrona2; stdcall;
    function  ObtenerPDF(const usuario: string; const password: string; const uUID: string; const LogoBase64: string): RespuestaTFD332; stdcall;
    function  ObtenerAcuseEnvio(const usuario: string; const password: string; const uUID: string): RespuestaTFD332; stdcall;
    function  ObtenerAcuseCancelacion(const usuario: string; const password: string; const uUID: string): RespuestaTFD332; stdcall;
    function  CambiarPassword(const usuario: string; const passwordActual: string; const passwordNuevo: string): RespuestaTFD332; stdcall;
    function  ConsultarComplementoTimbre(const usuario: string; const password: string; const uUID: string): RespuestaTFD332; stdcall;
    function  ConsultarTimbrePorReferencia(const usuario: string; const password: string; const referencia: string): RespuestaTFD332; stdcall;
    function  ConsultarCreditos(const usuario: string; const password: string): RespuestaCreditos2; stdcall;
    function  ConsultarComprobantes(const usuario: string; const password: string; const fechaInicial: TXSDateTime; const fechaFinal: TXSDateTime; const filaInicial: Integer): RespuestaReporte2; stdcall;
  end;

function GetIWSCFDI33(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IWSCFDI33;


implementation
  uses SysUtils;

function GetIWSCFDI33(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IWSCFDI33;
const
  defWSDL = 'https://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc?WSDL';
  defURL  = 'http://www.foliosdigitalespac.com/WSTimbrado33/WSCFDI33.svc';
  defSvc  = 'WSCFDI33';
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
    Result := (RIO as IWSCFDI33);
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

destructor RespuestaTFD332.Destroy;
begin
  SysUtils.FreeAndNil(FTimbre);
  inherited Destroy;
end;

procedure RespuestaTFD332.SetCodigoConfirmacion(Index: Integer; const Astring: string);
begin
  FCodigoConfirmacion := Astring;
  FCodigoConfirmacion_Specified := True;
end;

function RespuestaTFD332.CodigoConfirmacion_Specified(Index: Integer): boolean;
begin
  Result := FCodigoConfirmacion_Specified;
end;

procedure RespuestaTFD332.SetCodigoRespuesta(Index: Integer; const Astring: string);
begin
  FCodigoRespuesta := Astring;
  FCodigoRespuesta_Specified := True;
end;

function RespuestaTFD332.CodigoRespuesta_Specified(Index: Integer): boolean;
begin
  Result := FCodigoRespuesta_Specified;
end;

procedure RespuestaTFD332.SetCreditosRestantes(Index: Integer; const AInteger: Integer);
begin
  FCreditosRestantes := AInteger;
  FCreditosRestantes_Specified := True;
end;

function RespuestaTFD332.CreditosRestantes_Specified(Index: Integer): boolean;
begin
  Result := FCreditosRestantes_Specified;
end;

procedure RespuestaTFD332.SetMensajeError(Index: Integer; const Astring: string);
begin
  FMensajeError := Astring;
  FMensajeError_Specified := True;
end;

function RespuestaTFD332.MensajeError_Specified(Index: Integer): boolean;
begin
  Result := FMensajeError_Specified;
end;

procedure RespuestaTFD332.SetMensajeErrorDetallado(Index: Integer; const Astring: string);
begin
  FMensajeErrorDetallado := Astring;
  FMensajeErrorDetallado_Specified := True;
end;

function RespuestaTFD332.MensajeErrorDetallado_Specified(Index: Integer): boolean;
begin
  Result := FMensajeErrorDetallado_Specified;
end;

procedure RespuestaTFD332.SetOperacionExitosa(Index: Integer; const ABoolean: Boolean);
begin
  FOperacionExitosa := ABoolean;
  FOperacionExitosa_Specified := True;
end;

function RespuestaTFD332.OperacionExitosa_Specified(Index: Integer): boolean;
begin
  Result := FOperacionExitosa_Specified;
end;

procedure RespuestaTFD332.SetPDFResultado(Index: Integer; const Astring: string);
begin
  FPDFResultado := Astring;
  FPDFResultado_Specified := True;
end;

function RespuestaTFD332.PDFResultado_Specified(Index: Integer): boolean;
begin
  Result := FPDFResultado_Specified;
end;

procedure RespuestaTFD332.SetTimbre(Index: Integer; const ATimbre332: Timbre332);
begin
  FTimbre := ATimbre332;
  FTimbre_Specified := True;
end;

function RespuestaTFD332.Timbre_Specified(Index: Integer): boolean;
begin
  Result := FTimbre_Specified;
end;

procedure RespuestaTFD332.SetXMLResultado(Index: Integer; const Astring: string);
begin
  FXMLResultado := Astring;
  FXMLResultado_Specified := True;
end;

function RespuestaTFD332.XMLResultado_Specified(Index: Integer): boolean;
begin
  Result := FXMLResultado_Specified;
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

destructor Timbre332.Destroy;
begin
  SysUtils.FreeAndNil(FFechaTimbrado);
  inherited Destroy;
end;

procedure Timbre332.SetEstado(Index: Integer; const Astring: string);
begin
  FEstado := Astring;
  FEstado_Specified := True;
end;

function Timbre332.Estado_Specified(Index: Integer): boolean;
begin
  Result := FEstado_Specified;
end;

procedure Timbre332.SetFechaTimbrado(Index: Integer; const ATXSDateTime: TXSDateTime);
begin
  FFechaTimbrado := ATXSDateTime;
  FFechaTimbrado_Specified := True;
end;

function Timbre332.FechaTimbrado_Specified(Index: Integer): boolean;
begin
  Result := FFechaTimbrado_Specified;
end;

procedure Timbre332.SetNumeroCertificadoSAT(Index: Integer; const Astring: string);
begin
  FNumeroCertificadoSAT := Astring;
  FNumeroCertificadoSAT_Specified := True;
end;

function Timbre332.NumeroCertificadoSAT_Specified(Index: Integer): boolean;
begin
  Result := FNumeroCertificadoSAT_Specified;
end;

procedure Timbre332.SetSelloCFD(Index: Integer; const Astring: string);
begin
  FSelloCFD := Astring;
  FSelloCFD_Specified := True;
end;

function Timbre332.SelloCFD_Specified(Index: Integer): boolean;
begin
  Result := FSelloCFD_Specified;
end;

procedure Timbre332.SetSelloSAT(Index: Integer; const Astring: string);
begin
  FSelloSAT := Astring;
  FSelloSAT_Specified := True;
end;

function Timbre332.SelloSAT_Specified(Index: Integer): boolean;
begin
  Result := FSelloSAT_Specified;
end;

procedure Timbre332.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function Timbre332.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
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
  { IWSCFDI33 }
  InvRegistry.RegisterInterface(TypeInfo(IWSCFDI33), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWSCFDI33), 'http://tempuri.org/IWSCFDI33/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IWSCFDI33), ioDocument);
  { IWSCFDI33.TimbrarCFDI }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', '',
                                 '[ReturnName="TimbrarCFDIResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', 'cadenaXML', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'TimbrarCFDI', 'TimbrarCFDIResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.CancelarCFDI }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', '',
                                 '[ReturnName="CancelarCFDIResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'rFCEmisor', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'listaCFDI', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'clavePrivada_Base64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'passwordClavePrivada', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelarCFDI', 'CancelarCFDIResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.CancelacionAsincrona }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', '',
                                 '[ReturnName="CancelacionAsincronaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'rFCEmisor', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'listaCFDI', '',
                                '[Namespace="http://schemas.microsoft.com/2003/10/Serialization/Arrays", ArrayItemName="string"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'clavePrivada_Base64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'passwordClavePrivada', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CancelacionAsincrona', 'CancelacionAsincronaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.EstatusCancelacionAsincrona }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'EstatusCancelacionAsincrona', '',
                                 '[ReturnName="EstatusCancelacionAsincronaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'EstatusCancelacionAsincrona', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'EstatusCancelacionAsincrona', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'EstatusCancelacionAsincrona', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'EstatusCancelacionAsincrona', 'EstatusCancelacionAsincronaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ObtenerPDF }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', '',
                                 '[ReturnName="ObtenerPDFResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', 'LogoBase64', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerPDF', 'ObtenerPDFResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ObtenerAcuseEnvio }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseEnvio', '',
                                 '[ReturnName="ObtenerAcuseEnvioResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseEnvio', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseEnvio', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseEnvio', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseEnvio', 'ObtenerAcuseEnvioResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ObtenerAcuseCancelacion }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseCancelacion', '',
                                 '[ReturnName="ObtenerAcuseCancelacionResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseCancelacion', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseCancelacion', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseCancelacion', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ObtenerAcuseCancelacion', 'ObtenerAcuseCancelacionResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.CambiarPassword }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'CambiarPassword', '',
                                 '[ReturnName="CambiarPasswordResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CambiarPassword', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CambiarPassword', 'passwordActual', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CambiarPassword', 'passwordNuevo', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'CambiarPassword', 'CambiarPasswordResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ConsultarComplementoTimbre }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ConsultarComplementoTimbre', '',
                                 '[ReturnName="ConsultarComplementoTimbreResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComplementoTimbre', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComplementoTimbre', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComplementoTimbre', 'uUID', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComplementoTimbre', 'ConsultarComplementoTimbreResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ConsultarTimbrePorReferencia }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ConsultarTimbrePorReferencia', '',
                                 '[ReturnName="ConsultarTimbrePorReferenciaResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarTimbrePorReferencia', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarTimbrePorReferencia', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarTimbrePorReferencia', 'referencia', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarTimbrePorReferencia', 'ConsultarTimbrePorReferenciaResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ConsultarCreditos }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ConsultarCreditos', '',
                                 '[ReturnName="ConsultarCreditosResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarCreditos', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarCreditos', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarCreditos', 'ConsultarCreditosResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  { IWSCFDI33.ConsultarComprobantes }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSCFDI33), 'ConsultarComprobantes', '',
                                 '[ReturnName="ConsultarComprobantesResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComprobantes', 'usuario', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComprobantes', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSCFDI33), 'ConsultarComprobantes', 'ConsultarComprobantesResult', '',
                                '[Namespace="http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios"]', IS_NLBL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDetallesPaqueteCreditos), 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'ArrayOfDetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDetalleCancelacion), 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'ArrayOfDetalleCancelacion');
  RemClassRegistry.RegisterXSClass(DetalleCancelacion2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'DetalleCancelacion2', 'DetalleCancelacion');
  RemClassRegistry.RegisterXSClass(RespuestaTFD332, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaTFD332', 'RespuestaTFD33');
  RemClassRegistry.RegisterXSClass(RespuestaCreditos2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCreditos2', 'RespuestaCreditos');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCreditos2), 'Paquetes', '[ArrayItemName="DetallesPaqueteCreditos"]');
  RemClassRegistry.RegisterXSClass(RespuestaEstatusCancelacionAsincrona2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaEstatusCancelacionAsincrona2', 'RespuestaEstatusCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacionAsincrona2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCancelacionAsincrona2', 'RespuestaCancelacionAsincrona');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCancelacionAsincrona2), 'DetallesCancelacion', '[ArrayItemName="DetalleCancelacion"]');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacion2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCancelacion2', 'RespuestaCancelacion');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaCancelacion2), 'DetallesCancelacion', '[ArrayItemName="DetalleCancelacion"]');
  RemClassRegistry.RegisterXSClass(DetallesPaqueteCreditos2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'DetallesPaqueteCreditos2', 'DetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSClass(Timbre332, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'Timbre332', 'Timbre33');
  RemClassRegistry.RegisterXSClass(RespuestaCreditos, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCreditos');
  RemClassRegistry.RegisterXSClass(RespuestaEstatusCancelacionAsincrona, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaEstatusCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacionAsincrona, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCancelacionAsincrona');
  RemClassRegistry.RegisterXSClass(DetallesPaqueteCreditos, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'DetallesPaqueteCreditos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfstring), 'http://schemas.microsoft.com/2003/10/Serialization/Arrays', 'ArrayOfstring');
  RemClassRegistry.RegisterXSClass(RegistroTimbre2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RegistroTimbre2', 'RegistroTimbre');
  RemClassRegistry.RegisterXSClass(RegistroTimbre, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RegistroTimbre');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegistroTimbre), 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'ArrayOfRegistroTimbre');
  RemClassRegistry.RegisterXSClass(RespuestaReporte2, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaReporte2', 'RespuestaReporte');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(RespuestaReporte2), 'ListaComprobantes', '[ArrayItemName="RegistroTimbre"]');
  RemClassRegistry.RegisterXSClass(RespuestaReporte, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaReporte');
  RemClassRegistry.RegisterXSClass(RespuestaTFD33, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaTFD33');
  RemClassRegistry.RegisterXSClass(DetalleCancelacion, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'DetalleCancelacion');
  RemClassRegistry.RegisterXSClass(RespuestaCancelacion, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'RespuestaCancelacion');
  RemClassRegistry.RegisterXSClass(Timbre33, 'http://schemas.datacontract.org/2004/07/TES.TFD.V33.Negocios', 'Timbre33');

end.