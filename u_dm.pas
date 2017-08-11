unit u_dm;

interface

uses
  SysUtils, Classes, XPMan, DB, ADODB;

type
  Tdm = class(TDataModule)
    con1: TADOConnection;
    XPManifest1: TXPManifest;
    qrypengguna: TADOQuery;
    qryjawab: TADOQuery;
    qrypemohon: TADOQuery;
    dspemohon: TDataSource;
    wdstrngfld_ktp: TWideStringField;
    wdstrngfld_pem: TWideStringField;
    wdstrngfld_lahir: TWideStringField;
    qrypemohontgl_lahir: TDateTimeField;
    wdstrngfldqrypemohonpekerjaan: TWideStringField;
    wdstrngfldqrypemohonalamat: TWideStringField;
    qrybangunan: TADOQuery;
    dsbangunan: TDataSource;
    qryijin_imb: TADOQuery;
    qrysyarat: TADOQuery;
    qrydet_ijinimb: TADOQuery;
    qrytampil_ijinimb: TADOQuery;
    dstampil_ijinimb: TDataSource;
    wdstrngfldqrypemohondesa: TWideStringField;
    qryretribusi: TADOQuery;
    qrytampil_retribusi: TADOQuery;
    dstampil_retribusi: TDataSource;
    wdstrngfld_retribusikd_ijin: TWideStringField;
    qrytampil_retribusitgl_ijin: TDateTimeField;
    wdstrngfld_retribusino_ktp: TWideStringField;
    wdstrngfld_retribusinama_pem: TWideStringField;
    wdstrngfld_retribusitmp_lahir: TWideStringField;
    qrytampil_retribusitgl_lahir: TDateTimeField;
    wdstrngfld_retribusipekerjaan: TWideStringField;
    wdstrngfld_retribusialamat: TWideStringField;
    wdstrngfld_retribusidesa: TWideStringField;
    wdstrngfld_retribusikode_bangun: TWideStringField;
    wdstrngfld_retribusijns_bangunan: TWideStringField;
    wdstrngfld_retribusimilik_tanah: TWideStringField;
    wdstrngfld_retribusibtk_bangun: TWideStringField;
    wdstrngfld_retribusitingkat: TWideStringField;
    wdstrngfld_retribusikon_bangun: TWideStringField;
    wdstrngfld_retribusiatap: TWideStringField;
    qrytampil_retribusip_bangun: TFloatField;
    qrytampil_retribusil_bangun: TFloatField;
    qrytampil_retribusiluas: TFloatField;
    wdstrngfld_retribusibts_utara: TWideStringField;
    wdstrngfld_retribusibts_tim: TWideStringField;
    wdstrngfld_retribusibts_sel: TWideStringField;
    wdstrngfld_retribusibts_bar: TWideStringField;
    wdstrngfld_retribusistatus: TWideStringField;
    qrytampil_retribusitgl_bayar: TDateTimeField;
    qrytampil_retribusibiaya_bangunan: TBCDField;
    qrytampil_retribusibiaya_bgn_jln: TBCDField;
    qrytampil_retribusibiaya_sempadan: TBCDField;
    qrytampil_retribusibiaya_periksa_gbr: TBCDField;
    qrytampil_retribusibiaya_pengawas: TBCDField;
    qrytampil_retribusibiaya_daftar: TBCDField;
    qrytampil_retribusitotal_biaya: TBCDField;
    qrytampil_retribusipembulatan_biaya: TBCDField;
    wdstrngfld_retribusiket_bayar: TWideStringField;
    qrytampil_retribusibiaya_retribusi: TBCDField;
    qryterbit_surat: TADOQuery;
    qrytampil_terbit_surat: TADOQuery;
    dstampil_terbit_surat: TDataSource;
    wdstrngfld_retribusiket_terbit: TWideStringField;
    wdstrngfld_ijinimbkd_ijin: TWideStringField;
    qrytampil_ijinimbtgl_ijin: TDateTimeField;
    wdstrngfld_ijinimbno_ktp: TWideStringField;
    wdstrngfld_ijinimbnama_pem: TWideStringField;
    wdstrngfld_ijinimbtmp_lahir: TWideStringField;
    qrytampil_ijinimbtgl_lahir: TDateTimeField;
    wdstrngfld_ijinimbpekerjaan: TWideStringField;
    wdstrngfld_ijinimbalamat: TWideStringField;
    wdstrngfld_ijinimbdesa: TWideStringField;
    wdstrngfld_ijinimbkode_bangun: TWideStringField;
    wdstrngfld_ijinimbjns_bangunan: TWideStringField;
    wdstrngfld_ijinimbmilik_tanah: TWideStringField;
    wdstrngfld_ijinimbbtk_bangun: TWideStringField;
    wdstrngfld_ijinimbtingkat: TWideStringField;
    wdstrngfld_ijinimbkon_bangun: TWideStringField;
    wdstrngfld_ijinimbatap: TWideStringField;
    qrytampil_ijinimbp_bangun: TFloatField;
    qrytampil_ijinimbl_bangun: TFloatField;
    qrytampil_ijinimbluas: TFloatField;
    wdstrngfld_ijinimbbts_utara: TWideStringField;
    wdstrngfld_ijinimbbts_tim: TWideStringField;
    wdstrngfld_ijinimbbts_sel: TWideStringField;
    wdstrngfld_ijinimbbts_bar: TWideStringField;
    wdstrngfld_ijinimbstatus: TWideStringField;
    wdstrngfld_ijinimbket_bayar: TWideStringField;
    wdstrngfld_ijinimbket_terbit: TWideStringField;
    wdstrngfld_terbit_suratkd_ijin: TWideStringField;
    qrytampil_terbit_surattgl_ijin: TDateTimeField;
    wdstrngfld_terbit_suratno_ktp: TWideStringField;
    wdstrngfld_terbit_suratnama_pem: TWideStringField;
    wdstrngfld_terbit_surattmp_lahir: TWideStringField;
    qrytampil_terbit_surattgl_lahir: TDateTimeField;
    wdstrngfld_terbit_suratpekerjaan: TWideStringField;
    wdstrngfld_terbit_suratalamat: TWideStringField;
    wdstrngfld_terbit_suratdesa: TWideStringField;
    wdstrngfld_terbit_suratkode_bangun: TWideStringField;
    wdstrngfld_terbit_suratjns_bangunan: TWideStringField;
    wdstrngfld_terbit_suratmilik_tanah: TWideStringField;
    wdstrngfld_terbit_suratbtk_bangun: TWideStringField;
    wdstrngfld_terbit_surattingkat: TWideStringField;
    wdstrngfld_terbit_suratkon_bangun: TWideStringField;
    wdstrngfld_terbit_suratatap: TWideStringField;
    qrytampil_terbit_suratp_bangun: TFloatField;
    qrytampil_terbit_suratl_bangun: TFloatField;
    qrytampil_terbit_suratluas: TFloatField;
    wdstrngfld_terbit_suratbts_utara: TWideStringField;
    wdstrngfld_terbit_suratbts_tim: TWideStringField;
    wdstrngfld_terbit_suratbts_sel: TWideStringField;
    wdstrngfld_terbit_suratbts_bar: TWideStringField;
    wdstrngfld_terbit_suratstatus: TWideStringField;
    wdstrngfld_terbit_suratket_bayar: TWideStringField;
    wdstrngfld_terbit_suratket_terbit: TWideStringField;
    qrytampil_terbit_surattgl_bayar: TDateTimeField;
    qrytampil_terbit_suratbiaya_retribusi: TBCDField;
    qrytampil_terbit_suratbiaya_bangunan: TBCDField;
    qrytampil_terbit_suratbiaya_bgn_jln: TBCDField;
    qrytampil_terbit_suratbiaya_sempadan: TBCDField;
    qrytampil_terbit_suratbiaya_periksa_gbr: TBCDField;
    qrytampil_terbit_suratbiaya_pengawas: TBCDField;
    qrytampil_terbit_suratbiaya_daftar: TBCDField;
    qrytampil_terbit_surattotal_biaya: TBCDField;
    qrytampil_terbit_suratpembulatan_biaya: TBCDField;
    qrytampil_terbit_surattgl_terbit: TDateTimeField;
    wdstrngfld_ijinimblok_tanah: TWideStringField;
    wdstrngfld_retribusilok_tanah: TWideStringField;
    wdstrngfld_terbit_suratlok_tanah: TWideStringField;
    qrytampil_lapijin: TADOQuery;
    dstampil_lapijin: TDataSource;
    qrytampil_lapretribusi: TADOQuery;
    ds1tampil_lapretribusi: TDataSource;
    qrytampil_lapterbitsurat: TADOQuery;
    dstampil_laterbitsurat: TDataSource;
    qryundang: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var ss : string;
begin
 con1.Connected:=false;
 getdir(0,ss);
 con1.ConnectionString:=
 'Provider=Microsoft.Jet.OLEDB.4.0;'+
 'Data Source='+ ss +'\db_imb.mdb;';
 con1.Connected:=true;
end;
end.
