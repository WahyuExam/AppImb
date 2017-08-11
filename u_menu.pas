unit u_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, Lib_ku, jpeg, ExtCtrls;

type
  Tf_menu = class(TForm)
    mm1: TMainMenu;
    Master1: TMenuItem;
    ransaksi91: TMenuItem;
    Laporan1: TMenuItem;
    Pengaturan1: TMenuItem;
    Keluar1: TMenuItem;
    SalindanPanggilData1: TMenuItem;
    GantiKataSandi1: TMenuItem;
    PenanggynbgJawab1: TMenuItem;
    Pemohon1: TMenuItem;
    Bangunan1: TMenuItem;
    JenisBangunan1: TMenuItem;
    Pemohom1: TMenuItem;
    IzinMendirikanBangunanIMB1: TMenuItem;
    PembayaranRetribusi1: TMenuItem;
    PenerbitanSuratIzinMendirikanBangunanIMB1: TMenuItem;
    IzinMendirikanBangunanIMB2: TMenuItem;
    PembayranRetribusi1: TMenuItem;
    PenerbitanSuratIzinIMB1: TMenuItem;
    img1: TImage;
    procedure Keluar1Click(Sender: TObject);
    procedure SalindanPanggilData1Click(Sender: TObject);
    procedure GantiKataSandi1Click(Sender: TObject);
    procedure PenanggynbgJawab1Click(Sender: TObject);
    procedure Pemohon1Click(Sender: TObject);
    procedure Bangunan1Click(Sender: TObject);
    procedure JenisBangunan1Click(Sender: TObject);
    procedure Pemohom1Click(Sender: TObject);
    procedure IzinMendirikanBangunanIMB1Click(Sender: TObject);
    procedure PembayaranRetribusi1Click(Sender: TObject);
    procedure PenerbitanSuratIzinMendirikanBangunanIMB1Click(
      Sender: TObject);
    procedure IzinMendirikanBangunanIMB2Click(Sender: TObject);
    procedure PembayranRetribusi1Click(Sender: TObject);
    procedure PenerbitanSuratIzinIMB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_menu: Tf_menu;

implementation

uses
  u_peng_salindata, u_dm, ADODB, u_peng_gantisandi, u_peng_jawab, 
  u_mast_penduduk, u_mast_bangunan, u_report_bangunan, u_report_penduduk, 
  u_trans_ijin_depan, u_trans_retribusi, u_trans_retribusi_depan, 
  u_trans_terbit_surat, u_lap_ijin_imb;

{$R *.dfm}

procedure Tf_menu.Keluar1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure Tf_menu.SalindanPanggilData1Click(Sender: TObject);
begin
 f_peng_salindata.ShowModal;
end;

procedure Tf_menu.GantiKataSandi1Click(Sender: TObject);
begin
 f_peng_gantisandi.ShowModal;
end;

procedure Tf_menu.PenanggynbgJawab1Click(Sender: TObject);
begin
 f_peng_jawab.ShowModal;
end;

procedure Tf_menu.Pemohon1Click(Sender: TObject);
begin
 f_mast_penduduk.ShowModal;
end;

procedure Tf_menu.Bangunan1Click(Sender: TObject);
begin
 f_mast_bangunan.ShowModal;
end;

procedure Tf_menu.JenisBangunan1Click(Sender: TObject);
begin
 konek_awal(dm.qrybangunan,'tbl_bangunan','kode_bangun');
 if dm.qrybangunan.IsEmpty then
  begin
    MessageDlg('Data Bangunan Tidak Ada', mtInformation,[mbok],0);
    Exit;
  end
  else
  begin
   konek_awal(dm.qryjawab,'tbl_jawab','NIP');
   report_bangunan.qrlbltgl.Caption:=bulan(Now);
   report_bangunan.Preview;
  end;
end;

procedure Tf_menu.Pemohom1Click(Sender: TObject);
begin
 konek_awal(dm.qrypemohon,'tbl_pemohon','no_ktp');
 if dm.qrypemohon.IsEmpty then
  begin
    MessageDlg('Data Pemohon Tidak Ada',mtInformation,[mbok],0);
    Exit;
  end
  else
  begin
   konek_awal(dm.qryjawab,'tbl_jawab','NIP');
   report_pemohon.qrlbltgl.Caption:=bulan(Now);
   report_pemohon.Preview;
  end;
end;

procedure Tf_menu.IzinMendirikanBangunanIMB1Click(Sender: TObject);
begin
 f_trans_imb_depan.ShowModal;
end;

procedure Tf_menu.PembayaranRetribusi1Click(Sender: TObject);
begin
 f_trans_retribusi_depan.ShowModal;
end;

procedure Tf_menu.PenerbitanSuratIzinMendirikanBangunanIMB1Click(
  Sender: TObject);
begin
 f_trans_terbit_surat.ShowModal;
end;

procedure Tf_menu.IzinMendirikanBangunanIMB2Click(Sender: TObject);
begin
 f_lap_ijinimb.Label1.Caption :='Laporan Permohonan Izin IMB';
 f_lap_ijinimb.edt1.Text := 'lap_ijin';
 f_lap_ijinimb.ShowModal;
end;

procedure Tf_menu.PembayranRetribusi1Click(Sender: TObject);
begin
 f_lap_ijinimb.Label1.Caption :='Laporan Pembayaran Retribusi IMB';
 f_lap_ijinimb.edt1.Text := 'lap_retribusi';
 f_lap_ijinimb.ShowModal;
end;

procedure Tf_menu.PenerbitanSuratIzinIMB1Click(Sender: TObject);
begin
 f_lap_ijinimb.Label1.Caption :='Laporan Penerbitan Surat Izin IMB';
 f_lap_ijinimb.edt1.Text := 'lap_terbit_ijin';
 f_lap_ijinimb.ShowModal;
end;

end.
