unit CFDIUtils;

interface

uses System.SysUtils, System.Variants, xmldom, XMLDoc, XMLIntf,
  Facturacion.Comprobante;

const
  _TFD10_XSLT = './XSLT/cadenaoriginal_TFD_1_0.xslt';
  _TFD11_XSLT = './XSLT/cadenaoriginal_TFD_1_1.xslt';

type
  TFEVersion = (v00, v20, v22, v30, v32, v33);

  TFELlavePrivada = record
     Ruta: String;
     Clave: String;
  end;

  TFECertificado = record
      Ruta: String;
      LlavePrivada: TFELlavePrivada;
      VigenciaInicio: TDateTime;
      VigenciaFin: TDateTime;
      NumeroSerie: String;
      RFCAlQuePertenece: string;
  end;

  TCFDI = class(TObject)
  private
    XMLDocument: IXmlDocument;
    function GetVersion: string;
    function GetCadenaOriginalTimbre: TCadenaUTF8;
    function GetFEVersion: TFEVersion;
  public
    constructor Create(XMLFileName: TFileName); overload;
    constructor Create(XMLData: string); overload;
    property Version: string read GetVersion;
    property FEVersion: TFEVersion read GetFEVersion;
    property CadenaOriginalTimbre: TCadenaUTF8 read GetCadenaOriginalTimbre;
  end;



//function GetCadenOriginalTimbre(XMLFileName: string): TCadenaUTF8;
//function GetCFDIVersion(XMLFileName: string): string;
/// <summary> Calculamos el sello digital para la cadena original de la factura
/// Es importante que en cualquier variable que almacenemos la cadena original
/// sea del tipo TCadenaUTF8 para no perder la codificacion UTF8</summary>
/// <param name="Certificado"> Certificado que sera utilizado para generar el sello</param>
/// <param name="CadenaOriginal"> Cadenaorginal para genera el sello del comprobante</param>
function GetSelloV33(Certificado: TFECertificado; const CadenaOriginal: TCadenaUTF8): TCadenaUTF8;

implementation

uses Facturacion.GeneradorSelloV33, Facturacion.OpenSSL,
  Facturacion.GeneradorCadenaOriginal;

//function GetCadenOriginalTimbre(XMLFileName: string): TCadenaUTF8;
//var
//  TFD: String;
//  TransformadorDeXML: TTransformadorDeXML;
//  Version: string;
//  XSLT: TCadenaUTF8;
//
//  function GetTFD: String;
//  var
//    CFDI: IXmlDocument;
//    nodeP, nodeD: IXMLNode;
//    I,J: Integer;
//  begin
//    CFDI := LoadXMLDocument(XMLFileName);
//    CFDI.Active := True;
//    for I := 0 to CFDI.DocumentElement.ChildNodes.Count - 1 do
//    begin
//      nodeP := CFDI.DocumentElement.ChildNodes[I];
//      if nodeP.NodeType = ntElement then
//      begin
//        if nodeP.NodeName = 'cfdi:Complemento' then
//        begin
//          for J := 0 to nodeP.ChildNodes.Count - 1 do
//          begin
//            nodeD := nodeP.ChildNodes[J];
//            if nodeD.NodeName = 'tfd:TimbreFiscalDigital' then
//            begin
//              Result:= nodeD.XML;
//            end;
//          end;
//        end;
//      end;
//    end;
//  end;
//
//begin
//  Version := GetCFDIVersion(XMLFileName);
//  TFD := GetTFD;
//  if TFD <> EmptyStr then
//  begin
//    TransformadorDeXML := TTransformadorDeXML.Create;
//    try
//      if Version = '3.3' then
//        XSLT := TransformadorDeXML.obtenerXSLTDeRecurso(_TFD11_XSLT)
//      else
//        XSLT := TransformadorDeXML.obtenerXSLTDeRecurso(_TFD10_XSLT);
//      Result := UTF8Encode('|' + TransformadorDeXML.TransformarXML(TFD, XSLT) + '||');
//    finally
//      FreeAndNil(TransformadorDeXML);
//    end;
//  end
//  else
//    Result:= EmptyAnsiStr;
//end;
//
//function GetCFDIVersion(XMLFileName: string): string;
//var
//  XMLDocument: IXmlDocument;
//begin
//  Result := EmptyStr;
//  XMLDocument := LoadXMLDocument(XMLFileName);
//  XMLDocument.Active := True;
//  // Se utilizza 'Version' ya que a partir del CFDI 3.3 capitalizaron los atributos
//  if XMLDocument.ChildNodes.FindNode('Comprobante').HasAttribute('version') then
//    Result := VarToStrDef(XMLDocument.ChildNodes.FindNode('Comprobante').Attributes['version'], '');
//  if XMLDocument.ChildNodes.FindNode('Comprobante').HasAttribute('Version') then
//    Result := VarToStrDef(XMLDocument.ChildNodes.FindNode('Comprobante').Attributes['Version'], '');
//end;

function GetSelloV33(Certificado: TFECertificado; const CadenaOriginal: TCadenaUTF8): TCadenaUTF8;
var
  OpenSSL: IOpenSSL;
  Sello: TGeneradorSelloV33;
begin
  OpenSSL := TOpenSSL.Create;
  OpenSSL.AsignarLlavePrivada(Certificado.LlavePrivada.Ruta, Certificado.LlavePrivada.Clave);
  Sello := TGeneradorSelloV33.Create;
  Sello.Configurar(OpenSSL);
  Result := Sello.GenerarSelloDeFactura(CadenaOriginal)
end;

{ TCFDI }

constructor TCFDI.Create(XMLFileName: TFileName);
begin
  XMLDocument := LoadXMLDocument(XMLFileName);
  XMLDocument.Active := True;
end;

constructor TCFDI.Create(XMLData: string);
begin
  XMLDocument := LoadXMLData(XMLData);
  XMLDocument.Active := True;
end;

function TCFDI.GetCadenaOriginalTimbre: TCadenaUTF8;
var
  TFD: String;
  TransformadorDeXML: TTransformadorDeXML;
  Version: string;
  XSLT: TCadenaUTF8;

  function GetTFD: String;
  var
    nodeP, nodeD: IXMLNode;
    I,J: Integer;
  begin
    for I := 0 to XMLDocument.DocumentElement.ChildNodes.Count - 1 do
    begin
      nodeP := XMLDocument.DocumentElement.ChildNodes[I];
      if nodeP.NodeType = ntElement then
      begin
        if nodeP.NodeName = 'cfdi:Complemento' then
        begin
          for J := 0 to nodeP.ChildNodes.Count - 1 do
          begin
            nodeD := nodeP.ChildNodes[J];
            if nodeD.NodeName = 'tfd:TimbreFiscalDigital' then
            begin
              Result:= nodeD.XML;
            end;
          end;
        end;
      end;
    end;
  end;

begin
  TFD := GetTFD;
  if TFD <> EmptyStr then
  begin
    TransformadorDeXML := TTransformadorDeXML.Create;
    try
      if FEVersion = v33 then
        XSLT := TransformadorDeXML.obtenerXSLTDeRecurso(_TFD11_XSLT)
      else
        XSLT := TransformadorDeXML.obtenerXSLTDeRecurso(_TFD10_XSLT);
      Result := UTF8Encode('|' + TransformadorDeXML.TransformarXML(TFD, XSLT) + '||');
    finally
      FreeAndNil(TransformadorDeXML);
    end;
  end
  else
    Result:= EmptyAnsiStr;
end;

function TCFDI.GetFEVersion: TFEVersion;
begin
  if Version = EmptyStr then Result:= v00;
  if Version = '2.0' then Result:= v20;
  if Version = '2.2' then Result:= v22;
  if Version = '3.0' then Result:= v30;
  if Version = '3.2' then Result:= v32;
  if Version = '3.3' then Result:= v33;
end;

function TCFDI.GetVersion: string;
begin
  Result := EmptyStr;
  // Se utilizza 'Version' ya que a partir del CFDI 3.3 capitalizaron los atributos
  if XMLDocument.ChildNodes.FindNode('Comprobante').HasAttribute('version') then
    Result := VarToStrDef(XMLDocument.ChildNodes.FindNode('Comprobante').Attributes['version'], '');
  if XMLDocument.ChildNodes.FindNode('Comprobante').HasAttribute('Version') then
    Result := VarToStrDef(XMLDocument.ChildNodes.FindNode('Comprobante').Attributes['Version'], '');
end;

end.
