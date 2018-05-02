unit XMLtoPDFCFDI33Dmod;

interface

uses
  System.SysUtils, System.Classes, ppComm, ppRelatv, ppDB, ppDBPipe, Data.DB,
  Datasnap.DBClient;

type
  TdmXMLtoPDFCFDI33 = class(TDataModule)
    cdsCFDI33: TClientDataSet;
    dsCFDI33: TDataSource;
    ppDBPipelineCFDI33: TppDBPipeline;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
