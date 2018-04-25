// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://demo-facturacion.finkok.com/servicios/soap/cancel.wsdl
//  >Import : http://demo-facturacion.finkok.com/servicios/soap/cancel.wsdl>0
//  >Import : http://demo-facturacion.finkok.com/servicios/soap/cancel.wsdl>1
//  >Import : http://demo-facturacion.finkok.com/servicios/soap/cancel.wsdl>2
// Encoding : UTF-8
// Version  : 1.0
// (22/02/2017 01:51:03 p. m. - - $Rev: 56641 $)
// ************************************************************************ //

unit WSFinkokCancelDemo;

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
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]

  UUIDS2               = class;                 { "apps.services.soap.core.views"[GblCplx] }
  CancelaCFDResult2    = class;                 { "apps.services.soap.core.views"[GblCplx] }
  ReceiptResult2       = class;                 { "apps.services.soap.core.views"[GblCplx] }
  UUIDS                = class;                 { "apps.services.soap.core.views"[GblElm] }
  CancelaCFDResult     = class;                 { "apps.services.soap.core.views"[GblElm] }
  ReceiptResult        = class;                 { "apps.services.soap.core.views"[GblElm] }
  QueryPendingResult2  = class;                 { "apps.services.soap.core.views"[GblCplx] }
  Folio2               = class;                 { "apps.services.soap.core.views"[GblCplx] }
  Folio                = class;                 { "apps.services.soap.core.views"[GblElm] }
  QueryPendingResult   = class;                 { "apps.services.soap.core.views"[GblElm] }

  FolioArray = array of Folio2;                 { "apps.services.soap.core.views"[GblCplx] }
  stringArray = array of string;                { "http://facturacion.finkok.com/cancellation"[GblCplx] }


  // ************************************************************************ //
  // XML       : UUIDS, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  UUIDS2 = class(TRemotable)
  private
    Fuuids: stringArray;
    Fuuids_Specified: boolean;
    procedure Setuuids(Index: Integer; const AstringArray: stringArray);
    function  uuids_Specified(Index: Integer): boolean;
  published
    property uuids: stringArray  Index (IS_OPTN or IS_NLBL) read Fuuids write Setuuids stored uuids_Specified;
  end;



  // ************************************************************************ //
  // XML       : CancelaCFDResult, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  CancelaCFDResult2 = class(TRemotable)
  private
    FFolios: FolioArray;
    FFolios_Specified: boolean;
    FAcuse: string;
    FAcuse_Specified: boolean;
    FFecha: string;
    FFecha_Specified: boolean;
    FRfcEmisor: string;
    FRfcEmisor_Specified: boolean;
    FCodEstatus: string;
    FCodEstatus_Specified: boolean;
    procedure SetFolios(Index: Integer; const AFolioArray: FolioArray);
    function  Folios_Specified(Index: Integer): boolean;
    procedure SetAcuse(Index: Integer; const Astring: string);
    function  Acuse_Specified(Index: Integer): boolean;
    procedure SetFecha(Index: Integer; const Astring: string);
    function  Fecha_Specified(Index: Integer): boolean;
    procedure SetRfcEmisor(Index: Integer; const Astring: string);
    function  RfcEmisor_Specified(Index: Integer): boolean;
    procedure SetCodEstatus(Index: Integer; const Astring: string);
    function  CodEstatus_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Folios:     FolioArray  Index (IS_OPTN or IS_NLBL) read FFolios write SetFolios stored Folios_Specified;
    property Acuse:      string      Index (IS_OPTN or IS_NLBL) read FAcuse write SetAcuse stored Acuse_Specified;
    property Fecha:      string      Index (IS_OPTN or IS_NLBL) read FFecha write SetFecha stored Fecha_Specified;
    property RfcEmisor:  string      Index (IS_OPTN or IS_NLBL) read FRfcEmisor write SetRfcEmisor stored RfcEmisor_Specified;
    property CodEstatus: string      Index (IS_OPTN or IS_NLBL) read FCodEstatus write SetCodEstatus stored CodEstatus_Specified;
  end;



  // ************************************************************************ //
  // XML       : ReceiptResult, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  ReceiptResult2 = class(TRemotable)
  private
    Fuuid: string;
    Fuuid_Specified: boolean;
    Fsuccess: Boolean;
    Fsuccess_Specified: boolean;
    Freceipt: string;
    Freceipt_Specified: boolean;
    Ftaxpayer_id: string;
    Ftaxpayer_id_Specified: boolean;
    Ferror: string;
    Ferror_Specified: boolean;
    Fdate: string;
    Fdate_Specified: boolean;
    procedure Setuuid(Index: Integer; const Astring: string);
    function  uuid_Specified(Index: Integer): boolean;
    procedure Setsuccess(Index: Integer; const ABoolean: Boolean);
    function  success_Specified(Index: Integer): boolean;
    procedure Setreceipt(Index: Integer; const Astring: string);
    function  receipt_Specified(Index: Integer): boolean;
    procedure Settaxpayer_id(Index: Integer; const Astring: string);
    function  taxpayer_id_Specified(Index: Integer): boolean;
    procedure Seterror(Index: Integer; const Astring: string);
    function  error_Specified(Index: Integer): boolean;
    procedure Setdate(Index: Integer; const Astring: string);
    function  date_Specified(Index: Integer): boolean;
  published
    property uuid:        string   Index (IS_OPTN or IS_NLBL) read Fuuid write Setuuid stored uuid_Specified;
    property success:     Boolean  Index (IS_OPTN or IS_NLBL) read Fsuccess write Setsuccess stored success_Specified;
    property receipt:     string   Index (IS_OPTN or IS_NLBL) read Freceipt write Setreceipt stored receipt_Specified;
    property taxpayer_id: string   Index (IS_OPTN or IS_NLBL) read Ftaxpayer_id write Settaxpayer_id stored taxpayer_id_Specified;
    property error:       string   Index (IS_OPTN or IS_NLBL) read Ferror write Seterror stored error_Specified;
    property date:        string   Index (IS_OPTN or IS_NLBL) read Fdate write Setdate stored date_Specified;
  end;



  // ************************************************************************ //
  // XML       : UUIDS, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  UUIDS = class(UUIDS2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : CancelaCFDResult, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  CancelaCFDResult = class(CancelaCFDResult2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ReceiptResult, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  ReceiptResult = class(ReceiptResult2)
  private
  published
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
  // XML       : Folio, global, <complexType>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  Folio2 = class(TRemotable)
  private
    FEstatusUUID: string;
    FEstatusUUID_Specified: boolean;
    FUUID: string;
    FUUID_Specified: boolean;
    procedure SetEstatusUUID(Index: Integer; const Astring: string);
    function  EstatusUUID_Specified(Index: Integer): boolean;
    procedure SetUUID(Index: Integer; const Astring: string);
    function  UUID_Specified(Index: Integer): boolean;
  published
    property EstatusUUID: string  Index (IS_OPTN or IS_NLBL) read FEstatusUUID write SetEstatusUUID stored EstatusUUID_Specified;
    property UUID:        string  Index (IS_OPTN or IS_NLBL) read FUUID write SetUUID stored UUID_Specified;
  end;



  // ************************************************************************ //
  // XML       : Folio, global, <element>
  // Namespace : apps.services.soap.core.views
  // ************************************************************************ //
  Folio = class(Folio2)
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
  // Namespace : http://facturacion.finkok.com/cancel
  // soapAction: %operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : Application
  // service   : CancelSOAP
  // port      : Application
  // URL       : http://demo-facturacion.finkok.com/servicios/soap/cancel
  // ************************************************************************ //
  IWSFinkokCancel = interface(IInvokable)
  ['{A50B2847-80CB-1437-9E24-A9C18DE43316}']
    function  cancel_signature(const xml: TByteDynArray; const username: string; const password: string; const store_pending: Boolean; const secret_key: string): CancelaCFDResult2; stdcall;
    function  query_pending_cancellation(const username: string; const password: string; const uuid: string; const secret_key: string): QueryPendingResult2; stdcall;
    function  sign_cancel(const UUIDS: UUIDS2; const username: string; const password: string; const taxpayer_id: string; const serial: string; const store_pending: Boolean; 
                          const secret_key: string): CancelaCFDResult2; stdcall;
    function  get_receipt(const username: string; const password: string; const taxpayer_id: string; const uuid: string; const type_: string; const secret_key: string
                          ): ReceiptResult2; stdcall;
    function  cancel(const UUIDS: UUIDS2; const username: string; const password: string; const taxpayer_id: string; const cer: TByteDynArray; const key: TByteDynArray; 
                     const store_pending: Boolean; const secret_key: string): CancelaCFDResult2; stdcall;
    function  out_cancel(const xml: TByteDynArray; const username: string; const password: string; const taxpayer_id: string; const cer: TByteDynArray; const key: TByteDynArray; 
                         const store_pending: Boolean): CancelaCFDResult2; stdcall;
  end;

function GetIWSFinkokCancel(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IWSFinkokCancel;


implementation
  uses SysUtils;

function GetIWSFinkokCancel(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IWSFinkokCancel;
const
  defWSDL = 'http://demo-facturacion.finkok.com/servicios/soap/cancel.wsdl';
  defURL  = 'http://demo-facturacion.finkok.com/servicios/soap/cancel';
  defSvc  = 'CancelSOAP';
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
    Result := (RIO as IWSFinkokCancel);
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


procedure UUIDS2.Setuuids(Index: Integer; const AstringArray: stringArray);
begin
  Fuuids := AstringArray;
  Fuuids_Specified := True;
end;

function UUIDS2.uuids_Specified(Index: Integer): boolean;
begin
  Result := Fuuids_Specified;
end;

destructor CancelaCFDResult2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFolios)-1 do
    SysUtils.FreeAndNil(FFolios[I]);
  System.SetLength(FFolios, 0);
  inherited Destroy;
end;

procedure CancelaCFDResult2.SetFolios(Index: Integer; const AFolioArray: FolioArray);
begin
  FFolios := AFolioArray;
  FFolios_Specified := True;
end;

function CancelaCFDResult2.Folios_Specified(Index: Integer): boolean;
begin
  Result := FFolios_Specified;
end;

procedure CancelaCFDResult2.SetAcuse(Index: Integer; const Astring: string);
begin
  FAcuse := Astring;
  FAcuse_Specified := True;
end;

function CancelaCFDResult2.Acuse_Specified(Index: Integer): boolean;
begin
  Result := FAcuse_Specified;
end;

procedure CancelaCFDResult2.SetFecha(Index: Integer; const Astring: string);
begin
  FFecha := Astring;
  FFecha_Specified := True;
end;

function CancelaCFDResult2.Fecha_Specified(Index: Integer): boolean;
begin
  Result := FFecha_Specified;
end;

procedure CancelaCFDResult2.SetRfcEmisor(Index: Integer; const Astring: string);
begin
  FRfcEmisor := Astring;
  FRfcEmisor_Specified := True;
end;

function CancelaCFDResult2.RfcEmisor_Specified(Index: Integer): boolean;
begin
  Result := FRfcEmisor_Specified;
end;

procedure CancelaCFDResult2.SetCodEstatus(Index: Integer; const Astring: string);
begin
  FCodEstatus := Astring;
  FCodEstatus_Specified := True;
end;

function CancelaCFDResult2.CodEstatus_Specified(Index: Integer): boolean;
begin
  Result := FCodEstatus_Specified;
end;

procedure ReceiptResult2.Setuuid(Index: Integer; const Astring: string);
begin
  Fuuid := Astring;
  Fuuid_Specified := True;
end;

function ReceiptResult2.uuid_Specified(Index: Integer): boolean;
begin
  Result := Fuuid_Specified;
end;

procedure ReceiptResult2.Setsuccess(Index: Integer; const ABoolean: Boolean);
begin
  Fsuccess := ABoolean;
  Fsuccess_Specified := True;
end;

function ReceiptResult2.success_Specified(Index: Integer): boolean;
begin
  Result := Fsuccess_Specified;
end;

procedure ReceiptResult2.Setreceipt(Index: Integer; const Astring: string);
begin
  Freceipt := Astring;
  Freceipt_Specified := True;
end;

function ReceiptResult2.receipt_Specified(Index: Integer): boolean;
begin
  Result := Freceipt_Specified;
end;

procedure ReceiptResult2.Settaxpayer_id(Index: Integer; const Astring: string);
begin
  Ftaxpayer_id := Astring;
  Ftaxpayer_id_Specified := True;
end;

function ReceiptResult2.taxpayer_id_Specified(Index: Integer): boolean;
begin
  Result := Ftaxpayer_id_Specified;
end;

procedure ReceiptResult2.Seterror(Index: Integer; const Astring: string);
begin
  Ferror := Astring;
  Ferror_Specified := True;
end;

function ReceiptResult2.error_Specified(Index: Integer): boolean;
begin
  Result := Ferror_Specified;
end;

procedure ReceiptResult2.Setdate(Index: Integer; const Astring: string);
begin
  Fdate := Astring;
  Fdate_Specified := True;
end;

function ReceiptResult2.date_Specified(Index: Integer): boolean;
begin
  Result := Fdate_Specified;
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

procedure Folio2.SetEstatusUUID(Index: Integer; const Astring: string);
begin
  FEstatusUUID := Astring;
  FEstatusUUID_Specified := True;
end;

function Folio2.EstatusUUID_Specified(Index: Integer): boolean;
begin
  Result := FEstatusUUID_Specified;
end;

procedure Folio2.SetUUID(Index: Integer; const Astring: string);
begin
  FUUID := Astring;
  FUUID_Specified := True;
end;

function Folio2.UUID_Specified(Index: Integer): boolean;
begin
  Result := FUUID_Specified;
end;

initialization
  { Application }
  InvRegistry.RegisterInterface(TypeInfo(IWSFinkokCancel), 'http://facturacion.finkok.com/cancel', 'UTF-8', '', 'Application');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWSFinkokCancel), '%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IWSFinkokCancel), ioDocument);
  { Application.cancel_signature }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', '',
                                 '[ReturnName="cancel_signatureResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'store_pending', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel_signature', 'cancel_signatureResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.query_pending_cancellation }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', '',
                                 '[ReturnName="query_pending_cancellationResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', 'uuid', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'query_pending_cancellation', 'query_pending_cancellationResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.sign_cancel }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', '',
                                 '[ReturnName="sign_cancelResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'UUIDS', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'taxpayer_id', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'serial', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'store_pending', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'sign_cancel', 'sign_cancelResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.get_receipt }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', '',
                                 '[ReturnName="get_receiptResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'taxpayer_id', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'uuid', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'type_', 'type',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'get_receipt', 'get_receiptResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.cancel }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'cancel', '',
                                 '[ReturnName="cancelResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'UUIDS', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'taxpayer_id', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'cer', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'store_pending', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'secret_key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'cancel', 'cancelResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  { Application.out_cancel }
  InvRegistry.RegisterMethodInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', '',
                                 '[ReturnName="out_cancelResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'username', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'password', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'taxpayer_id', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'cer', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'key', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'store_pending', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IWSFinkokCancel), 'out_cancel', 'out_cancelResult', '',
                                '[Namespace="apps.services.soap.core.views"]', IS_NLBL);
  RemClassRegistry.RegisterXSInfo(TypeInfo(FolioArray), 'apps.services.soap.core.views', 'FolioArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(stringArray), 'http://facturacion.finkok.com/cancellation', 'stringArray');
  RemClassRegistry.RegisterXSClass(UUIDS2, 'apps.services.soap.core.views', 'UUIDS2', 'UUIDS');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(UUIDS2), 'uuids', '[ArrayItemName="string"]');
  RemClassRegistry.RegisterXSClass(CancelaCFDResult2, 'apps.services.soap.core.views', 'CancelaCFDResult2', 'CancelaCFDResult');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(CancelaCFDResult2), 'Folios', '[ArrayItemName="Folio"]');
  RemClassRegistry.RegisterXSClass(ReceiptResult2, 'apps.services.soap.core.views', 'ReceiptResult2', 'ReceiptResult');
  RemClassRegistry.RegisterXSClass(UUIDS, 'apps.services.soap.core.views', 'UUIDS');
  RemClassRegistry.RegisterXSClass(CancelaCFDResult, 'apps.services.soap.core.views', 'CancelaCFDResult');
  RemClassRegistry.RegisterXSClass(ReceiptResult, 'apps.services.soap.core.views', 'ReceiptResult');
  RemClassRegistry.RegisterXSClass(QueryPendingResult2, 'apps.services.soap.core.views', 'QueryPendingResult2', 'QueryPendingResult');
  RemClassRegistry.RegisterXSClass(Folio2, 'apps.services.soap.core.views', 'Folio2', 'Folio');
  RemClassRegistry.RegisterXSClass(Folio, 'apps.services.soap.core.views', 'Folio');
  RemClassRegistry.RegisterXSClass(QueryPendingResult, 'apps.services.soap.core.views', 'QueryPendingResult');

end.