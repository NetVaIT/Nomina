(*
Buscar y remplazar *UNICAMENTE* en la definicion de variables

PChar; -- PCaracter; (1)
Char; --- Caracter; (15)

Buscar y remplazar *UNICAMENTE* en typecast

PChar( -- ToChar(  (18)
Char( --- ToChar(  (0)

*)

unit DataTypeCast;

interface

uses Activex, DB, SysUtils;

type
{$IF CompilerVersion >= 20}
	PCaracter = PAnsiChar;
	Caracter = AnsiChar;
	TMarcador = TBytes;
{$ELSE}
	PCaracter = PChar;
	Caracter = Char;
	TMarcador = TBookmarkStr;
{$IFEND}

{$IF CompilerVersion >= 20}
	function ToChar(Str: String): PWideChar; overload;
	function ToChar(Str: Pointer): PWideChar; overload;
{$ELSE}
	function ToChar(Str: String): PChar; overload;
	function ToChar(Str: Pointer): PChar; overload;
{$IFEND}

implementation

{$IF CompilerVersion >= 20}
function ToChar(Str: String): PWideChar; overload;
begin
	Result := PWideChar(AnsiString(Str));
end;

function ToChar(Str: Pointer): PWideChar; overload;
begin
	Result := PWideChar(Str);
end;
{$ELSE}
function ToChar(Str: String): PChar; overload;
begin
	Result := PChar(Str);
end;

function ToChar(Str: Pointer): PChar; overload;
begin
	Result := PChar(Str);
end;
{$IFEND}

initialization
	Coinitialize(nil);
finalization
	CoUninitialize;
end.
