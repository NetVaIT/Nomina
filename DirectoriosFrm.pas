unit DirectoriosFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxControls, Winapi.ShlObj, cxShellCommon, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxShellComboBox, cxSplitter, cxListView,
  cxShellListView, cxPC, cxButtons, Vcl.ExtCtrls, cxMemo, Data.DB,
  Data.Win.ADODB, cxSpinEdit, cxPropertiesStore;

type
  TfrmDirectorios = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    cxPageControl1: TcxPageControl;
    cxtsInbox: TcxTabSheet;
    Panel5: TPanel;
    cxslvInbox: TcxShellListView;
    cxslvError: TcxShellListView;
    cxSplitter3: TcxSplitter;
    cxscbInbox: TcxShellComboBox;
    cxscbError: TcxShellComboBox;
    cxtsSalida: TcxTabSheet;
    cxslvOutbox: TcxShellListView;
    cxscbOutbox: TcxShellComboBox;
    cxtsProcess: TcxTabSheet;
    cxslvProcess: TcxShellListView;
    cxscbProcess: TcxShellComboBox;
    btnCrearINI: TcxButton;
    btnCrearXML: TcxButton;
    mBitacora: TcxMemo;
    cxSplitter1: TcxSplitter;
    btnTimbrar: TcxButton;
    btnFDTimbrar: TcxButton;
    btnFDObtener: TcxButton;
    btnFDObtenerPDF: TcxButton;
    Label1: TLabel;
    edtmes: TcxSpinEdit;
    cxPropertiesStore: TcxPropertiesStore;
    Edit1: TEdit;
  private
    { Private declarations }
    FProcessDirectory: string;
    FOutboxDirectory: string;
    FInboxDirectory: string;
    FErrorDirectory: string;
    FactCrearINI: TBasicAction;
    FactTimbrar: TBasicAction;
    FactCrearXML: TBasicAction;
    FactFDTimbrar: TBasicAction;
    FactFDObtener: TBasicAction;
    FactFDObtenerPDF: TBasicAction;
    procedure SetErrorDirectory(const Value: string);
    procedure SetInboxDirectory(const Value: string);
    procedure SetOutboxDirectory(const Value: string);
    procedure SetProcessDirectory(const Value: string);
    procedure SetactCrearINI(const Value: TBasicAction);
    procedure SetactCrearXML(const Value: TBasicAction);
    procedure SetactTimbrar(const Value: TBasicAction);
    procedure SetactFDTimbrar(const Value: TBasicAction);
    procedure SetactFDObtener(const Value: TBasicAction);
    procedure SetactFDObtenerPDF(const Value: TBasicAction);
    function GetMes: Integer;
    procedure SetMes(const Value: Integer);
  public
    { Public declarations }
    property Mes: Integer read GetMes write SetMes;
    property InboxDirectory: string read FInboxDirectory write SetInboxDirectory;
    property OutboxDirectory: string read FOutboxDirectory write SetOutboxDirectory;
    property ProcessDirectory: string read FProcessDirectory write SetProcessDirectory;
    property ErrorDirectory: string read FErrorDirectory write SetErrorDirectory;
    property actCrearINI: TBasicAction read FactCrearINI write SetactCrearINI;
    property actCrearXML: TBasicAction read FactCrearXML write SetactCrearXML;
    property actTimbrar: TBasicAction read FactTimbrar write SetactTimbrar;
    property actFDTimbrar: TBasicAction read FactFDTimbrar write SetactFDTimbrar;
    property actFDObtenerPDF: TBasicAction read FactFDObtenerPDF write SetactFDObtenerPDF;
    property actFDObtener: TBasicAction read FactFDObtener write SetactFDObtener;
  end;

implementation

{$R *.dfm}

function TfrmDirectorios.GetMes: Integer;
begin
  Result:= edtMes.Value;
end;

procedure TfrmDirectorios.SetactCrearINI(const Value: TBasicAction);
begin
  FactCrearINI := Value;
  btnCrearINI.Action := Value;
end;

procedure TfrmDirectorios.SetactCrearXML(const Value: TBasicAction);
begin
  FactCrearXML := Value;
  btnCrearXML.Action := Value;
end;

procedure TfrmDirectorios.SetactFDObtener(const Value: TBasicAction);
begin
  FactFDObtener := Value;
  btnFDObtener.Action := Value;
end;

procedure TfrmDirectorios.SetactFDObtenerPDF(const Value: TBasicAction);
begin
  FactFDObtenerPDF := Value;
  btnFDObtenerPDF.Action := Value;
end;

procedure TfrmDirectorios.SetactFDTimbrar(const Value: TBasicAction);
begin
  FactFDTimbrar := Value;
  btnFDTimbrar.Action := Value;
end;

procedure TfrmDirectorios.SetactTimbrar(const Value: TBasicAction);
begin
  FactTimbrar := Value;
  btnTimbrar.Action := Value;
end;

procedure TfrmDirectorios.SetErrorDirectory(const Value: string);
begin
  FErrorDirectory := Value;
  cxscbError.AbsolutePath := Value
end;

procedure TfrmDirectorios.SetInboxDirectory(const Value: string);
begin
  FInboxDirectory := Value;
  cxscbInbox.AbsolutePath := Value
end;

procedure TfrmDirectorios.SetMes(const Value: Integer);
begin
  edtMes.Value:= Value;
end;

procedure TfrmDirectorios.SetOutboxDirectory(const Value: string);
begin
  FOutboxDirectory := Value;
  cxscbOutbox.AbsolutePath := Value
end;

procedure TfrmDirectorios.SetProcessDirectory(const Value: string);
begin
  FProcessDirectory := Value;
  cxslvProcess.AbsolutePath := Value
end;

end.
