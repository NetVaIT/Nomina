// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://demo-facturacion.finkok.com/servicios/soap/stamp.wsdl
//  >Import : http://demo-facturacion.finkok.com/servicios/soap/stamp.wsdl>0
//  >Import : http://demo-facturacion.finkok.com/servicios/soap/stamp.wsdl>1
// Encoding : UTF-8
// Version  : 1.0
// (24/01/2017 05:51:29 p. m. - - $Rev: 56641 $)
// ************************************************************************ //

unit WSFinkokStampDemo;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]

  AcuseRecepcionCFDI2  = class;                 { "apps.services.soap.core.views"[GblCplx] }
  Incidencia2          = class;                 { "apps.services.soap.core.views"[GblCplx] }
  QueryPendingResult2  = class;                 { "apps.services.soap.core.views"[GblCplx] }
  AcuseRecepcionCFDI   = class;                 { "apps.services.soap.core.views"[GblElm] }
  Incidencia           = class;                 { "apps.services.soap.core.views"[GblElm] }
  QueryPendingResult   = class;                 { "apps.services.soap.core.views"[GblElm] }

  IncidenciaArray = array of Incidencia2;       { "apps.services.soap.core.views"[GblCplx] }


  // ************************************************************************ //
  // XML       : AcuseRecepcionCFDI, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  AcuseRecepcionCFDI2 = class(TRemotable)
  private
    Fxml: string;
    Fxml_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    Ffaultstring: string;
    Ffaultstring_Specified: boolean;
    FFecha: string;
    FFecha_Specified: boolean;
    FCodEstatus: string;
    FCodEstatus_Specified: boolean;
    Ffaultcode: string;
    Ffaultcode_Specified: boolean;
    FSatSeal: string;
    FSatSeal_Specified: boolean;
    FIncidencias: IncidenciaArray;
    FIncidencias_Specified: boolean;
    FNoCertificadoSAT: string;
    FNoCertificadoSAT_Specified: boolean;
    procedure Setxml(Index: Integer; const Astring: string);
    function  xml_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
    procedure Setfaultstring(Index: Integer; const Astring: string);
    function  faultstring_Specified(Index: Integer): boolean;
    procedure SetFecha(Index: Integer; const Astring: string);
    function  Fecha_Specified(Index: Integer): boolean;
    procedure SetCodEstatus(Index: Integer; const Astring: string);
    function  CodEstatus_Specified(Index: Integer): boolean;
    procedure Setfaultcode(Index: Integer; const Astring: string);
    function  faultcode_Specified(Index: Integer): boolean;
    procedure SetSatSeal(Index: Integer; const Astring: string);
    function  SatSeal_Specified(Index: Integer): boolean;
    procedure SetIncidencias(Index: Integer; const AIncidenciaArray: IncidenciaArray);
    function  Incidencias_Specified(Index: Integer): boolean;
    procedure SetNoCertificadoSAT(Index: Integer; const Astring: string);
    function  NoCertificadoSAT_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property xml:              string           Index (IS_OPTN or IS_NLBL) read Fxml write Setxml stored xml_Specified;
    property UUID:             string           Index (IS_OPTN or IS_NLBL) read FUUID write SetUUID stored UUID_Specified;
    property faultstring:      string           Index (IS_OPTN or IS_NLBL) read Ffaultstring write Setfaultstring stored faultstring_Specified;
    property Fecha:            string           Index (IS_OPTN or IS_NLBL) read FFecha write SetFecha stored Fecha_Specified;
    property CodEstatus:       string           Index (IS_OPTN or IS_NLBL) read FCodEstatus write SetCodEstatus stored CodEstatus_Specified;
    property faultcode:        string           Index (IS_OPTN or IS_NLBL) read Ffaultcode write Setfaultcode stored faultcode_Specified;
    property SatSeal:          string           Index (IS_OPTN or IS_NLBL) read FSatSeal write SetSatSeal stored SatSeal_Specified;
    property Incidencias:      IncidenciaArray  Index (IS_OPTN or IS_NLBL) read FIncidencias write SetIncidencias stored Incidencias_Specified;
    property NoCertificadoSAT: string           Index (IS_OPTN or IS_NLBL) read FNoCertificadoSAT write SetNoCertificadoSAT stored NoCertificadoSAT_Specified;
  end;



  // ************************************************************************ //
  // XML       : Incidencia, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  Incidencia2 = class(TRemotable)
  private
    FIdIncidencia: string;
    FIdIncidencia_Specified: boolean;
    FUuid: string;
    FUuid_Specified: boolean;
    FCodigoError: string;
    FCodigoError_Specified: boolean;
    FWorkProcessId: string;
    FWorkProcessId_Specified: boolean;
    FMensajeIncidencia: string;
    FMensajeIncidencia_Specified: boolean;
    FRfcEmisor: string;
    FRfcEmisor_Specified: boolean;
    FNoCertificadoPac: string;
    FNoCertificadoPac_Specified: boolean;
    FFechaRegistro: string;
    FFechaRegistro_Specified: boolean;
    procedure SetIdIncidencia(Index: Integer; const Astring: string);
    function  IdIncidencia_Specified(Index: Integer): boolean;
    procedure SetUuid(Index: Integer; const Astring: string);
    function  Uuid_Specified(Index: Integer): boolean;
    procedure SetCodigoError(Index: Integer; const Astring: string);
    function  CodigoError_Specified(Index: Integer): boolean;
    procedure SetWorkProcessId(Index: Integer; const Astring: string);
    function  WorkProcessId_Specified(Index: Integer): boolean;
    procedure SetMensajeIncidencia(Index: Integer; const Astring: string);
    function  MensajeIncidencia_Specified(Index: Integer): boolean;
    procedure SetRfcEmisor(Index: Integer; const Astring: string);
    function  RfcEmisor_Specified(Index: Integer): boolean;
    procedure SetNoCertificadoPac(Index: Integer; const Astring: string);
    function  NoCertificadoPac_Specified(Index: Integer): boolean;
    procedure SetFechaRegistro(Index: Integer; const Astring: string);
    function  FechaRegistro_Specified(Index: Integer): boolean;
  published
    property IdIncidencia:      string  Index (IS_OPTN or IS_NLBL) read FIdIncidencia write SetIdIncidencia stored IdIncidencia_Specified;
    property Uuid:              string  Index (IS_OPTN or IS_NLBL) read FUuid write SetUuid stored Uuid_Specified;
    property CodigoError:       string  Index (IS_OPTN or IS_NLBL) read FCodigoError write SetCodigoError stored CodigoError_Specified;
    property WorkProcessId:     string  Index (IS_OPTN or IS_NLBL) read FWorkProcessId write SetWorkProcessId stored WorkProcessId_Specified;
    property MensajeIncidencia: string  Index (IS_OPTN or IS_NLBL) read FMensajeIncidencia write SetMensajeIncidencia stored MensajeIncidencia_Specified;
    property RfcEmisor:         string  Index (IS_OPTN or IS_NLBL) read FRfcEmisor write SetRfcEmisor stored RfcEmisor_Specified;
    property NoCertificadoPac:  string  Index (IS_OPTN or IS_NLBL) read FNoCertificadoPac write SetNoCertificadoPac stored NoCertificadoPac_Specified;
    property FechaRegistro:     string  Index (IS_OPTN or IS_NLBL) read FFechaRegistro write SetFechaRegistro stored FechaRegistro_Specified;
  end;



  // ************************************************************************ //
  // XML       : QueryPendingResult, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  QueryPendingResult2 = class(TRemotable)
  private
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fxml: string;
    Fxml_Specified: boolean;
    Fuuid: string;
    Fuuid_Specified: boolean;
    Fuuid_status: string;
    Fuuid_status_Specified: boolean;
    Fnext_attempt: string;
    Fnext_attempt_Specified: boolean;
    Fattempts: string;
    Fattempts_Specified: boolean;
    Ferror: string;
    Ferror_Specified: boolean;
    Fdate: string;
    Fdate_Specified: boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setxml(Index: Integer; const Astring: string);
    function  xml_Specified(Index: Integer): boolean;
    procedure Setuuid(Index: Integer; const Astring: string);
    function  uuid_Specified(Index: Integer): boolean;
    procedure Setuuid_status(Index: Integer; const Astring: string);
    function  uuid_status_Specified(Index: Integer): boolean;
    procedure Setnext_attempt(Index: Integer; const Astring: string);
    function  next_attempt_Specified(Index: Integer): boolean;
    procedure Setattempts(Index: Integer; const Astring: string);
    function  attempts_Specified(Index: Integer): boolean;
    procedure Seterror(Index: Integer; const Astring: string);
    function  error_Specified(Index: Integer): boolean;
    procedure Setdate(Index: Integer; const Astring: string);
    function  date_Specified(Index: Integer): boolean;
  published
    property status:       string  Index (IS_OPTN or IS_NLBL) read Fstatus write Setstatus stored status_Specified;
    property xml:          string  Index (IS_OPTN or IS_NLBL) read Fxml write Setxml stored xml_Specified;
    property uuid:         string  Index (IS_OPTN or IS_NLBL) read Fuuid write Setuuid stored uuid_Specified;
    property uuid_status:  string  Index (IS_OPTN or IS_NLBL) read Fuuid_status write Setuuid_status stored uuid_status_Specified;
    property next_attempt: string  Index (IS_OPTN or IS_NLBL) read Fnext_attempt write Setnext_attempt stored next_attempt_Specified;
    property attempts:     string  Index (IS_OPTN or IS_NLBL) read Fattempts write Setattempts stored attempts_Specified;
    property error:        string  Index (IS_OPTN or IS_NLBL) read Ferror write Seterror stored error_Specified;
    property date:         string  Index (IS_OPTN or IS_NLBL) read Fdate write Setdate stored date_Specified;
  end;



  // ************************************************************************ //
  // XML       : AcuseRecepcionCFDI, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  AcuseRecepcionCFDI = class(AcuseRecepcionCFDI2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : Incidencia, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  Incidencia = class(Incidencia2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : QueryPendingResult, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  QueryPendingResult = class(QueryPendingResult2)
  private
  published
  end;


  // ************************************************************************ //
  // Name      : Application
  // Namespace : http://facturacion.finkok.com/stamp
  // soapAction: %operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : Application
  // service   : StampSOAP
  // port      : Application
  // URL       : http://demo-facturacion.finkok.com/servicios/soap/stamp
  // ************************************************************************ //
  Application_ = interface(IInvokable)
  ['{0AA07360-97A0-C6DA-8BD0-6C56DCAE7D6F}']
    function  stamp(const xml: TByteDynArray; const username: string; const password: string; const secret_key: string): AcuseRecepcionCFDI2; stdcall;
    function  sign_stamp(const xml: TByteDynArray; const username: string; const password: string; const secret_key: string): AcuseRecepcionCFDI2; stdcall;
    function  stamped(const xml: TByteDynArray; const username: string; const password: string; const secret_key: string): AcuseRecepcionCFDI2; stdcall;
    function  quick_stamp(const xml: TByteDynArray; const username: string; const password: string; const secret_key: string): AcuseRecepcionCFDI2; stdcall;
    function  query_pending(const username: string; const password: string; const uuid: string; const secret_key: string): QueryPendingResult2; stdcall;
  end;

function GetApplication_(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Application_;


implementation
  uses SysUtils;

function GetApplication_(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Application_;
const
  defWSDL = 'http://demo-facturacion.finkok.com/servicios/soap/stamp.wsdl';
  defURL  = 'http://demo-facturacion.finkok.com/servicios/soap/stamp';
  defSvc  = 'StampSOAP';
  defPrt  = 'Application';
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
    Result := (RIO as Application_);
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


destructor AcuseRecepcionCFDI2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FIncidencias)-1 do
    SysUtils.FreeAndNil(FIncidencias[I]);
  System.SetLength(FIncidencias, 0);
  inherited Destroy;
end;

procedure AcuseRecepcionCFDI2.Setxml(Index: Integer; const Astring: string);
begin
  Fxml := Astring;
  Fxml_Specified := True;
end;

function AcuseRecepcionCFDI2.xml_Specified(Index: Integer): boolean;
begin
  Result := Fxml_Specified;
end;

procedure AcuseRecepcionCFDI2.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function AcuseRecepcionCFDI2.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

procedure AcuseRecepcionCFDI2.Setfaultstring(Index: Integer; const Astring: string);
begin
  Ffaultstring := Astring;
  Ffaultstring_Specified := True;
end;

function AcuseRecepcionCFDI2.faultstring_Specified(Index: Integer): boolean;
begin
  Result := Ffaultstring_Specified;
end;

procedure AcuseRecepcionCFDI2.SetFecha(Index: Integer; const Astring: string);
begin
  FFecha := Astring;
  FFecha_Specified := True;
end;

function AcuseRecepcionCFDI2.Fecha_Specified(Index: Integer): boolean;
begin
  Result := FFecha_Specified;
end;

procedure AcuseRecepcionCFDI2.SetCodEstatus(Index: Integer; const Astring: string);
begin
  FCodEstatus := Astring;
  FCodEstatus_Specified := True;
end;

function AcuseRecepcionCFDI2.CodEstatus_Specified(Index: Integer): boolean;
begin
  Result := FCodEstatus_Specified;
end;

procedure AcuseRecepcionCFDI2.Setfaultcode(Index: Integer; const Astring: string);
begin
  Ffaultcode := Astring;
  Ffaultcode_Specified := True;
end;

function AcuseRecepcionCFDI2.faultcode_Specified(Index: Integer): boolean;
begin
  Result := Ffaultcode_Specified;
end;

procedure AcuseRecepcionCFDI2.SetSatSeal(Index: Integer; const Astring: string);
begin
  FSatSeal := Astring;
  FSatSeal_Specified := True;
end;

function AcuseRecepcionCFDI2.SatSeal_Specified(Index: Integer): boolean;
begin
  Result := FSatSeal_Specified;
end;

procedure AcuseRecepcionCFDI2.SetIncidencias(Index: Integer; const AIncidenciaArray: IncidenciaArray);
begin
  FIncidencias := AIncidenciaArray;
  FIncidencias_Specified := True;
end;

function AcuseRecepcionCFDI2.Incidencias_Specified(Index: Integer): boolean;
begin
  Result := FIncidencias_Specified;
end;

procedure AcuseRecepcionCFDI2.SetNoCertificadoSAT(Index: Integer; const Astring: string);
begin
  FNoCertificadoSAT := Astring;
  FNoCertificadoSAT_Specified := True;
end;

function AcuseRecepcionCFDI2.NoCertificadoSAT_Specified(Index: Integer): boolean;
begin
  Result := FNoCertificadoSAT_Specified;
end;

procedure Incidencia2.SetIdIncidencia(Index: Integer; const Astring: string);
begin
  FIdIncidencia := Astring;
  FIdIncidencia_Specified := True;
end;

function Incidencia2.IdIncidencia_Specified(Index: Integer): boolean;
begin
  Result := FIdIncidencia_Specified;
end;

procedure Incidencia2.SetUuid(Index: Integer; const Astring: string);
begin
  FUuid := Astring;
  FUuid_Specified := True;
end;

function Incidencia2.Uuid_Specified(Index: Integer): boolean;
begin
  Result := FUuid_Specified;
end;

procedure Incidencia2.SetCodigoError(Index: Integer; const Astring: string);
begin
  FCodigoError := Astring;
  FCodigoError_Specified := True;
end;

function Incidencia2.CodigoError_Specified(Index: Integer): boolean;
begin
  Result := FCodigoError_Specified;
end;

procedure Incidencia2.SetWorkProcessId(Index: Integer; const Astring: string);
begin
  FWorkProcessId := Astring;
  FWorkProcessId_Specified := True;
end;

function Incidencia2.WorkProcessId_Specified(Index: Integer): boolean;
begin
  Result := FWorkProcessId_Specified;
end;

procedure Incidencia2.SetMensajeIncidencia(Index: Integer; const Astring: string);
begin
  FMensajeIncidencia := Astring;
  FMensajeIncidencia_Specified := True;
end;

function Incidencia2.MensajeIncidencia_Specified(Index: Integer): boolean;
begin
  Result := FMensajeIncidencia_Specified;
end;

procedure Incidencia2.SetRfcEmisor(Index: Integer; const Astring: string);
begin
  FRfcEmisor := Astring;
  FRfcEmisor_Specified := True;
end;

function Incidencia2.RfcEmisor_Specified(Index: Integer): boolean;
begin
  Result := FRfcEmisor_Specified;
end;

procedure Incidencia2.SetNoCertificadoPac(Index: Integer; const Astring: string);
begin
  FNoCertificadoPac := Astring;
  FNoCertificadoPac_Specified := True;
end;

function Incidencia2.NoCertificadoPac_Specified(Index: Integer): boolean;
begin
  Result := FNoCertificadoPac_Specified;
end;

procedure Incidencia2.SetFechaRegistro(Index: Integer; const Astring: string);
begin
  FFechaRegistro := Astring;
  FFechaRegistro_Specified := True;
end;

function Incidencia2.FechaRegistro_Specified(Index: Integer): boolean;
begin
  Result := FFechaRegistro_Specified;
end;

procedure QueryPendingResult2.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function QueryPendingResult2.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure QueryPendingResult2.Setxml(Index: Integer; const Astring: string);
begin
  Fxml := Astring;
  Fxml_Specified := True;
end;

function QueryPendingResult2.xml_Specified(Index: Integer): boolean;
begin
  Result := Fxml_Specified;
end;

procedure QueryPendingResult2.Setuuid(Index: Integer; const Astring: string);
begin
  Fuuid := Astring;
  Fuuid_Specified := True;
end;

function QueryPendingResult2.uuid_Specified(Index: Integer): boolean;
begin
  Result := Fuuid_Specified;
end;

procedure QueryPendingResult2.Setuuid_status(Index: Integer; const Astring: string);
begin
  Fuuid_status := Astring;
  Fuuid_status_Specified := True;
end;

function QueryPendingResult2.uuid_status_Specified(Index: Integer): boolean;
begin
  Result := Fuuid_status_Specified;
end;

procedure QueryPendingResult2.Setnext_attempt(Index: Integer; const Astring: string);
begin
  Fnext_attempt := Astring;
  Fnext_attempt_Specified := True;
end;

function QueryPendingResult2.next_attempt_Specified(Index: Integer): boolean;
begin
  Result := Fnext_attempt_Specified;
end;

procedure QueryPendingResult2.Setattempts(Index: Integer; const Astring: string);
begin
  Fattempts := Astring;
  Fattempts_Specified := True;
end;

function QueryPendingResult2.attempts_Specified(Index: Integer): boolean;
begin
  Result := Fattempts_Specified;
end;

procedure QueryPendingResult2.Seterror(Index: Integer; const Astring: string);
begin
  Ferror := Astring;
  Ferror_Specified := True;
end;

function QueryPendingResult2.error_Specified(Index: Integer): boolean;
begin
  Result := Ferror_Specified;
end;

procedure QueryPendingResult2.Setdate(Index: Integer; const Astring: string);
begin
  Fdate := Astring;
  Fdate_Specified := True;
end;

function QueryPendingResult2.date_Specified(Index: Integer): boolean;
begin
  Result := Fdate_Specified;
end;

initialization
  { Application }
  InvRegistry.RegisterInterface(TypeInfo(Application_), 'http://facturacion.finkok.com/stamp', 'UTF-8', '', 'Application');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Application_), '%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(Application_), ioDocument);
  { Application.stamp }
  InvRegistry.RegisterMethodInfo(TypeInfo(Application_), 'stamp', '',
                                 '[ReturnName="stampResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamp', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamp', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamp', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamp', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamp', 'stampResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.sign_stamp }
  InvRegistry.RegisterMethodInfo(TypeInfo(Application_), 'sign_stamp', '',
                                 '[ReturnName="sign_stampResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'sign_stamp', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'sign_stamp', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'sign_stamp', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'sign_stamp', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'sign_stamp', 'sign_stampResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.stamped }
  InvRegistry.RegisterMethodInfo(TypeInfo(Application_), 'stamped', '',
                                 '[ReturnName="stampedResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamped', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamped', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamped', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamped', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'stamped', 'stampedResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.quick_stamp }
  InvRegistry.RegisterMethodInfo(TypeInfo(Application_), 'quick_stamp', '',
                                 '[ReturnName="quick_stampResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'quick_stamp', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'quick_stamp', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'quick_stamp', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'quick_stamp', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'quick_stamp', 'quick_stampResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.query_pending }
  InvRegistry.RegisterMethodInfo(TypeInfo(Application_), 'query_pending', '',
                                 '[ReturnName="query_pendingResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'query_pending', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'query_pending', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'query_pending', 'uuid', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'query_pending', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(Application_), 'query_pending', 'query_pendingResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(IncidenciaArray), 'apps.services.soap.core.views', 'IncidenciaArray');
  RemClassRegistry.RegisterXSClass(AcuseRecepcionCFDI2, 'apps.services.soap.core.views', 'AcuseRecepcionCFDI2', 'AcuseRecepcionCFDI');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(AcuseRecepcionCFDI2), 'Incidencias', '[ArrayItemName="Incidencia"]');
  RemClassRegistry.RegisterXSClass(Incidencia2, 'apps.services.soap.core.views', 'Incidencia2', 'Incidencia');
  RemClassRegistry.RegisterXSClass(QueryPendingResult2, 'apps.services.soap.core.views', 'QueryPendingResult2', 'QueryPendingResult');
  RemClassRegistry.RegisterXSClass(AcuseRecepcionCFDI, 'apps.services.soap.core.views', 'AcuseRecepcionCFDI');
  RemClassRegistry.RegisterXSClass(Incidencia, 'apps.services.soap.core.views', 'Incidencia');
  RemClassRegistry.RegisterXSClass(QueryPendingResult, 'apps.services.soap.core.views', 'QueryPendingResult');

end.