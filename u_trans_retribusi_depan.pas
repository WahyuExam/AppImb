unit u_trans_retribusi_depan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, Lib_ku, jpeg, ExtCtrls;

type
  Tf_trans_retribusi_depan = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    btncampur: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    btnkeluar: TBitBtn;
    grp3: TGroupBox;
    dbgrd1: TDBGrid;
    grp5: TGroupBox;
    Label7: TLabel;
    edtpencarian: TEdit;
    btncetak: TBitBtn;
    img1: TImage;
    procedure btncampurClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtpencarianChange(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure btnkeluarClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure btncetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure konek;
  end;

var
  f_trans_retribusi_depan: Tf_trans_retribusi_depan;
  kd_ijin : string;

implementation

uses
  u_trans_retribusi, u_dm, u_surat_rincian_reribusi, DB;

{$R *.dfm}

procedure Tf_trans_retribusi_depan.btncampurClick(Sender: TObject);
begin
 if btncampur.Caption='Tambah' then
  begin
   f_trans_retribusi.edt1.Text:='tambah';
   f_trans_retribusi.ShowModal;
  end
  else
 if btncampur.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_trans_retribusi_depan.FormShow(Sender: TObject);
begin
 btn_mati([btnubah,btnhapus,btncetak]);
 btn_hidup([btncampur,btnkeluar]);
 btncampur.Caption:='Tambah';

 edtpencarian.Clear;
 dbgrd1.Enabled:=True;
 edtpencarian.Enabled:=True;
end;

procedure Tf_trans_retribusi_depan.konek;
begin
 with dm.qrytampil_retribusi do
  begin
    close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_tim,');
    sql.Add('a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr,');
    sql.Add('d.biaya_pengawas, d.biaya_daftar, d.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c,');
    sql.Add('tbl_retribusi d where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and a.ket_bayar='+QuotedStr('Lunas')+' order by a.kd_ijin asc');
    Open;
  end;
end;

procedure Tf_trans_retribusi_depan.edtpencarianChange(Sender: TObject);
begin
 if edtpencarian.Text='' then konek else
  begin
    with dm.qrytampil_retribusi do
    begin
      close;
      SQL.Clear;
      SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
      sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_tim,');
      sql.Add('a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr,');
      sql.Add('d.biaya_pengawas, d.biaya_daftar, d.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c,');
      sql.Add('tbl_retribusi d where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and a.ket_bayar='+QuotedStr('Lunas')+'');
      sql.Add('and (a.kd_ijin like ''%'+edtpencarian.Text+'%'' or b.no_ktp like ''%'+edtpencarian.Text+'%'')');
      Open;
    end;
  end;
end;

procedure Tf_trans_retribusi_depan.dbgrd1DblClick(Sender: TObject);
begin
 if dbgrd1.Fields[0].AsString='' then Exit;
 
 kd_ijin := dbgrd1.Fields[0].AsString;
 btn_hidup([btnhapus,btnubah,btncetak]);
 btn_mati([btnkeluar]);

 btncampur.Caption:='Batal';
 dbgrd1.Enabled:=false;
end;

procedure Tf_trans_retribusi_depan.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_trans_retribusi_depan.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    konek_awal(dm.qryretribusi,'tbl_retribusi','kd_ijin');
    if dm.qryretribusi.Locate('kd_ijin',kd_ijin,[]) then
     begin
       dm.qryretribusi.Delete;

       with dm.qryijin_imb do
        begin
          close;
          SQL.Clear;
          SQL.Text:='update tbl_ijin_imb set ket_bayar='+QuotedStr('-')+' where kd_ijin='+QuotedStr(kd_ijin)+'';
          ExecSQL;

          konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');
        end;

       MessageDlg('Data Sudah Dihapus',mtInformation,[mbok],0);
       FormShow(Sender);
     end;
  end;
end;

procedure Tf_trans_retribusi_depan.btnubahClick(Sender: TObject);
begin
 with f_trans_retribusi do
  begin
    edt1.Text:='ubah';
    edt2.Text:=DateToStr(Self.dbgrd1.Fields[1].AsDateTime);

    dtptgl_bayar.Date := Self.dbgrd1.Fields[24].AsDateTime;
    edtkode_ijin.Text := Self.dbgrd1.Fields[0].AsString;
    edtnoktp.Text := Self.dbgrd1.Fields[2].AsString;
    edtnama_pem.Text := Self.dbgrd1.Fields[3].AsString;
    mmoalamat.Text := Self.dbgrd1.Fields[7].AsString;
    edtdesa.Text := Self.dbgrd1.Fields[8].AsString;

    edtjns_bangun.Text := Self.dbgrd1.Fields[10].AsString;
    edtpanjang_bgn.Text := Self.dbgrd1.Fields[16].AsString;
    edtlebar_bgn.Text := Self.dbgrd1.Fields[17].AsString;
    edtluas_bgn.Text := self.dbgrd1.Fields[18].AsString;
    edtb_reribusi.Text := Self.dbgrd1.Fields[25].AsString;

    labelbiaya_bangun.Caption := ribuan(Self.dbgrd1.Fields[26].AsString)+',-';
    Labelbiaya_sempadan.Caption := ribuan(Self.dbgrd1.Fields[28].AsString)+',-';
    Labelperiksaan_gbr.Caption := ribuan(Self.dbgrd1.Fields[29].AsString)+',-';
    Labelpengawsan.Caption := ribuan(Self.dbgrd1.Fields[30].AsString)+',-';
    Labelpendaftran.Caption := ribuan(Self.dbgrd1.Fields[31].AsString)+',-';

    Labeltotal_biaya.Caption := ribuan(Self.dbgrd1.Fields[32].AsString)+',-';
    Labelpembulatan_biaya.Caption := ribuan(Self.dbgrd1.Fields[33].AsString)+',-';
    ShowModal;
  end;
end;

procedure Tf_trans_retribusi_depan.btncetakClick(Sender: TObject);
begin
 konek_awal(dm.qryjawab,'tbl_jawab','NIP');
 with dm.qrytampil_lapretribusi do
  begin
    close;
    SQL.Clear;
    sql.Add('select a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
    sql.Add('a.bts_utara, a.bts_tim, a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi,');
    sql.Add('d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr, d.biaya_pengawas, d.biaya_daftar,');
    sql.Add('d.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d where a.no_ktp=b.no_ktp');
    sql.Add('and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and a.kd_ijin='+QuotedStr(kd_ijin)+'');
    Open;
    with surat_rincian_retribusi do
     begin
       qrlbl_nama.Caption := 'An. '+fieldbyname('nama_pem').AsString;
       qrlblokasi_tanah.Caption := 'Lokasi : '+fieldbyname('lok_tanah').AsString;
       qrlblukuran.Caption := fieldbyname('p_bangun').AsString+' x '+fieldbyname('l_bangun').AsString;
       qrlblb_retribusi.Caption := ribuan(fieldbyname('biaya_retribusi').AsString)+',-';
       qrlblb_bangun.Caption := ribuan(fieldbyname('biaya_bangunan').AsString)+',-';
       qrlblb_bgn_2.Caption := ribuan(fieldbyname('biaya_bangunan').AsString)+',-';

       qrlblb_bgn_smw.Caption := 'Rp. '+ribuan(fieldbyname('biaya_bangunan').AsString)+',- x 1.10 % x 1.25 % x 1 % = Rp. '+ribuan(fieldbyname('biaya_bgn_jln').AsString);
       qrlblb_sempada.Caption := '(E) Biaya Sempadan : 1 % x Rp. '+ribuan(fieldbyname('biaya_bgn_jln').AsString)+',-';
       qrlblsempadan.Caption  := ribuan(fieldbyname('biaya_sempadan').AsString)+',-';

       qrlblb_periksa_gbr.Caption := '(F) Biaya Pemeriksaan Gambar : 0.05 % x Rp. '+ribuan(fieldbyname('biaya_bgn_jln').AsString)+',-';
       qrlblperiksa_gbr.Caption := ribuan(fieldbyname('biaya_periksa_gbr').AsString)+',-';

       qrlblb_pebgawas.Caption := '(G) Biaya Pengawasan : 0.05 % x Rp. '+ribuan(fieldbyname('biaya_bgn_jln').AsString)+',-';
       qrlblpengawasan.Caption := ribuan(fieldbyname('biaya_pengawas').AsString)+',-';
       qrlbldaftar.Caption := ribuan(fieldbyname('biaya_daftar').AsString)+',-';

       qrlbltotal.Caption := ribuan(fieldbyname('total_biaya').AsString)+',-';
       qrlblbulat.Caption :=  ribuan(fieldbyname('pembulatan_biaya').AsString)+',-';
       qrlbltgl.Caption := bulan(fieldbyname('tgl_bayar').AsDateTime);

       Preview;
     end;
  end;
  FormShow(Sender);
end;

end.
