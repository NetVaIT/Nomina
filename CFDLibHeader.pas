{******************************************************************************}
{                                                                              }
{  Este trabajo fue desarrollado en Mexico en Octubre del 2010                 }
{  Puedes usar partes de este codigo siempre y cuando proporciones los         }
{  creditos correspondientes, te agradeceria poner una nota como la siguiente: }
{  "Este software contiene partes escritas por Andres Jasqui"                  }
{                                                                              }
{  Visita www.validacfd.com para saber mas de la Factura Electronica en Mexico }
{                                                                              }
{******************************************************************************}

unit CFDLibHeader;

interface

uses DataTypeCast;

type TError =
(
	OK,
	Arch_No_Encontrado,
	Dato_Obligatorio,
	Problemas_Certificado,
	Vigencia_Certificado,
	LlavePrivada,
	Version_CFD_Invalida,
	ErrorGeneral
);

//Esta es la funcion principal, toma un archivo tipo *.ini con la informacion necesaria
//para crear la factura, si todo sale bien entonces devuelve un "OK", de otra forma devuelve
//uno de los errores de la tabla TError
function GeneraCFD(IniFileName, ClaveLlavePrivada : PChar) : TError; stdcall; external 'CFDLib.dll';


//Esta es la funcion principal, toma un archivo tipo *.txt con la informacion necesaria
//para crear la factura, si todo sale bien entonces devuelve un "OK", de otra forma devuelve
//uno de los errores de la tabla TError. ********Usa formato de IT Complements Forms Appeal*******
function GeneraCFD2(IniFileName, ClaveLlavePrivada : PChar) : TError; stdcall; external 'CFDLib.dll';


//Funcion para generar el Timbrefiscal, hay que definir en el archivo ini el nombre del PAC
//y la seccion especial correspondiente al PAC seleccionado, el resultado es el mismo XML
//pero ya con el timbre insertado
function TimbrarCFD(IniFileName : PChar) : TError; stdcall; external 'CFDLib.dll';


//Funcion para cancelar un CFDI, toma como parametro el nombre de un archivo
//con extension ini en donde vienen los datos necesarios para la cancelacion
function CancelarCFD(IniFileName : string) : TError; stdcall; external 'CFDLib.dll';


//Funcion para Recuperar el Acuse de Cancelacion que emite el SAT, toma como parametro
//el nombre de un archivo con extension ini en donde vienen los datos necesarios
function RecuperaAcuseCancelacion(IniFileName : string) : TError; stdcall; external 'CFDLib.dll';


//Funcion para consultar el saldo de los timbres, el resultado se graba en el mismo archivo ini
function ConsultaSaldo(IniFileName : string) : TError; stdcall; external 'CFDLib.dll';


//Funcion para recuperar un CFDI previamente emitido
function RecuperarCFD(IniFileName : string) : TError; stdcall; external 'CFDLib.dll';


//Funcion que regresa la version de la libreria
function CFDLibVersion : PCaracter; stdcall; external 'CFDLib.dll';


//PruebaClaveDeLlavePrivada es util para los menus de configuracion, en ese tipo de menus
//se puede pedir la Clave de la Llave Privada y asegurarse que es la correcta sin necesidad
//de crear una factura, ya cuando se asegure de que es correcta la clave puede ser grabada
//para no tener que estarla pidiendo cada vez que se requiera elaborar un CFD
function PruebaClaveDeLlavePrivada(LlavePrivada, ClaveLlavePrivada : PChar) : boolean; stdcall; external 'CFDLib.dll';


//Si la funcion GeneraCFD no puede crear el CFD devuelve un numero entero -
//con el error, la funcion GetError devuelve una cadena que explica ese error
function GetError : PCaracter; stdcall; external 'CFDLib.dll';


//GetErrorExt es una cadena adicional al error que indica con mas detalle en donde
//ocurrio el error, por ejemplo, GetError puede devolver "Archivo no encontrado"
//y GetErrorExt devuelve el *nombre* del archivo que no fue encontrado
function GetErrorExt : PCaracter; stdcall; external 'CFDLib.dll';


//La siguiente funcion regresa la Cadena Original y el Sello Digital que se uso para sellar la
//factura, es necesaria para poder programar la representacion impresa (el PDF)
function CadenaOriginal : PCaracter; stdcall; external 'CFDLib.dll';
function SelloDigital : PCaracter; stdcall; external 'CFDLib.dll';

implementation

end.
