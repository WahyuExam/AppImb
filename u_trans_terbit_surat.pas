unit u_trans_terbit_surat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls, Lib_ku,
  jpeg;

type
  Tf_trans_terbit_surat = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtnama_pem: TEdit;
    edtnoktp: TEdit;
    edtkode_ijin: TEdit;
    dtptgl_terbit: TDateTimePicker;
    btnbantu: TBitBtn;
    Label6: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    Label18: TLabel;
    edtdesa: TEdit;
    mmoalamat: TMemo;
    Label8: TLabel;
    edttgl_mohon: TEdit;
    edttgl_bayar: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    bvl1: TBevel;
    Label12: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtjns_bngunan: TEdit;
    edtp_bangun: TEdit;
    edtl_bangun: TEdit;
    edtluas: TEdit;
    Label22: TLabel;
    edttotal: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Labelketerangan: TLabel;
    grp3: TGroupBox;
    dbgrd1: TDBGrid;
    grp4: TGroupBox;
    btncampur: TBitBtn;
    btnsimpan: TBitBtn;
    btnhapus: TBitBtn;
    btnkeluar: TBitBtn;
    btnubah: TBitBtn;
    btncetak: TBitBtn;
    img1: TImage;
    edttgl: TEdit;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncampurClick(Sender: TObject);
    procedure btnbantuClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnubahClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btncetakClick(Sender: TObject);
    procedure dtptgl_terbitCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure konek;
  end;

var
  f_trans_terbit_surat: Tf_trans_terbit_surat;
  status, kons_bangunan_lap : string;
  tgl_terbit : TDate;
  h_umur,umur : Real;

implementation

uses
  u_dm, u_bantu_ijin_imb, DB, u_surat_terbit, Math;

{$R *.dfm}

procedure Tf_trans_terbit_surat.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_trans_terbit_surat.konek;
begin
 with dm.qrytampil_terbit_surat do
  begin
    close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara,');
    sql.Add('a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi, d.biaya_bangunan,');
    sql.Add('d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr, d.biaya_pengawas, d.biaya_daftar, d.total_biaya, d.pembulatan_biaya,');
    sql.Add('e.tgl_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d, tbl_terbit_surat e where a.no_ktp=b.no_ktp and');
    sql.Add('a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and e.kd_ijin=a.kd_ijin and a.ket_terbit='+QuotedStr('Terbit')+'');
    Open;
  end;
end;

procedure Tf_trans_terbit_surat.FormShow(Sender: TObject);
begin
 edit_kosong([edtkode_ijin,edttgl_mohon,edttgl_bayar,edtnoktp,edtnama_pem,edtdesa]);
 edit_kosong([edtjns_bngunan,edtp_bangun,edtl_bangun,edtluas,edttgl_bayar,edttotal]);
 mmoalamat.Clear;
 dtptgl_terbit.Date := Now;

 edit_mati([edtkode_ijin,edttgl_mohon,edttgl_bayar,edtnoktp,edtnama_pem,edtdesa]);
 edit_mati([edtjns_bngunan,edtp_bangun,edtl_bangun,edtluas,edttgl_bayar,edttotal]);
 mmoalamat.Enabled:=false;
 dtptgl_terbit.Enabled:=False;
 dbgrd1.Enabled:=True;

 btn_hidup([btncampur,btnkeluar]);
 btn_mati([btnsimpan,btnhapus,btnubah,btnbantu,btncetak]);
 btncampur.Caption:='Tambah';
 konek;
 konek_awal(dm.qryterbit_surat,'tbl_terbit_surat','kd_ijin');

 Labelketerangan.Caption :='-';
end;

procedure Tf_trans_terbit_surat.btncampurClick(Sender: TObject);
begin
  if btncampur.Caption='Tambah' then
   begin
     btn_hidup([btnbantu,btnsimpan,btncampur]);
     btn_mati([btnhapus,btnubah,btnkeluar]);
     btncampur.Caption:='Batal';
     dbgrd1.Enabled:=false;
     status := 'simpan';
   end
   else
  if btncampur.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_trans_terbit_surat.btnbantuClick(Sender: TObject);
begin
 f_bantu_ijin_imb.edt1.Text:='terbit_ijin';

 with dm.qrytampil_ijinimb do
  begin
    close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
    sql.Add('a.bts_utara, a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit from tbl_ijin_imb a,');
    sql.Add('tbl_pemohon b, tbl_bangunan c where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun');
    sql.Add('and a.ket_bayar='+QuotedStr('Lunas')+' and a.ket_terbit='+QuotedStr('-')+' order by a.kd_ijin asc');
    Open;
    if IsEmpty then
     begin
       MessageDlg('Tidak Ada Data Permohonan Izin Untuk Diterbitkan',mtInformation,[mbok],0);
       Exit;
     end
     else
     f_bantu_ijin_imb.ShowModal;
  end;
end;

procedure Tf_trans_terbit_surat.btnsimpanClick(Sender: TObject);
begin
 if edtnoktp.Text='' then
  begin
    MessageDlg('Data Pemohon Belum Dipilih',mtWarning,[mbok],0);
    btnbantu.SetFocus; Exit;
  end;

 with dm.qryterbit_surat do
  begin
    if status='simpan' then
     begin
       Append;
       FieldByName('kd_ijin').AsString := edtkode_ijin.Text;
     end
     else
    if status='ubah' then
     begin
      if dtptgl_terbit.Date = tgl_terbit then
       begin
         MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
         FormShow(Sender);
         Exit;
       end;

      if Locate('kd_ijin',edtkode_ijin.Text,[]) then Edit;
     end;
    FieldByName('tgl_terbit').AsDateTime := dtptgl_terbit.Date;
    Post;

    //ubah ket_terbit
    with dm.qryijin_imb do
     begin
       close;
       SQL.Clear;
       SQL.Text:='update tbl_ijin_imb set ket_terbit='+QuotedStr('Terbit')+' where kd_ijin='+QuotedStr(edtkode_ijin.Text)+'';
       ExecSQL;
       konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');
     end;

    MessageDlg('Data Sudah Disimpan',mtInformation,[mbok],0);
    FormShow(Sender);
  end;

end;

procedure Tf_trans_terbit_surat.dbgrd1DblClick(Sender: TObject);
begin
 btn_mati([btnbantu,btnsimpan,btnkeluar]);
 btn_hidup([btncampur,btnubah,btnhapus,btncetak]);
 btncampur.Caption:='Batal';
 dbgrd1.Enabled:=false;
end;

procedure Tf_trans_terbit_surat.dbgrd1CellClick(Column: TColumn);
begin
 tgl_terbit := dbgrd1.Fields[1].AsDateTime;
 edtkode_ijin.Text := dbgrd1.Fields[0].AsString;
 edttgl_mohon.Text := bulan(dbgrd1.Fields[2].AsDateTime);
 edttgl_bayar.Text := bulan(dbgrd1.Fields[27].AsDateTime);
 dtptgl_terbit.Date := dbgrd1.Fields[1].AsDateTime;

 edtnoktp.Text := dbgrd1.Fields[3].AsString;
 edtnama_pem.Text := dbgrd1.Fields[4].AsString;
 mmoalamat.Text := dbgrd1.Fields[8].AsString;
 edtdesa.Text := dbgrd1.Fields[9].AsString;

 edtjns_bngunan.Text := dbgrd1.Fields[11].AsString;
 edtp_bangun.Text := dbgrd1.Fields[17].AsString;
 edtl_bangun.Text := dbgrd1.Fields[18].AsString;
 edtluas.Text := dbgrd1.Fields[19].AsString;
 edttotal.Text := ribuan(dbgrd1.Fields[36].AsString);
end;

procedure Tf_trans_terbit_surat.btnubahClick(Sender: TObject);
begin
 btn_mati([btnhapus,btnubah,btnkeluar,btncetak]);
 btn_hidup([btncampur,btnsimpan]);
 dtptgl_terbit.Enabled:=True; dtptgl_terbit.SetFocus;
 status:='ubah';
end;

procedure Tf_trans_terbit_surat.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Yakin Data Akan Dihapus',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
   if dm.qryterbit_surat.Locate('kd_ijin',edtkode_ijin.Text,[]) then
    begin
      dm.qryterbit_surat.Delete;

      //ubah ket_terbit
      with dm.qryijin_imb do
       begin
         close;
         sql.Clear;
         SQL.Text:='update tbl_ijin_imb set ket_terbit='+QuotedStr('-')+' where kd_ijin='+QuotedStr(edtkode_ijin.Text)+'';
         ExecSQL;
       end;

      konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');

      MessageDlg('Data Sudah Dihapus',mtInformation,[mbok],0);
      FormShow(Sender);
    end;
  end;
end;

procedure Tf_trans_terbit_surat.btncetakClick(Sender: TObject);
begin
 konek_awal(dm.qryjawab,'tbl_jawab','nip');
 with dm.qrytampil_lapterbitsurat do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
    sql.Add('a.bts_utara, a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi,');
    sql.Add('d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr, d.biaya_pengawas, d.biaya_daftar,');
    sql.Add('d.total_biaya, d.pembulatan_biaya, e.tgl_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d,');
    sql.Add('tbl_terbit_surat e where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and e.kd_ijin=a.kd_ijin');
    sql.Add('and a.kd_ijin='+QuotedStr(edtkode_ijin.Text)+'');
    Open;
    with srt_terbit_ijin do
     begin
       konek_awal(dm.qryundang,'tbl_undang','undang');
       if dm.qryundang.Locate('ket','dasar_1',[]) then
         qrlbldasar1.Caption := '1. '+dm.qryundang.fieldbyname('undang').AsString;

       if dm.qryundang.Locate('ket','dasar_2',[]) then
         qrlbldasar2.Caption := '2. '+dm.qryundang.FieldByName('undang').AsString;

       qrlbldasar3.Caption := '3. Surat Permohonan Sdr. '+fieldbyname('nama_pem').AsString+', Tanggal '+bulan(fieldbyname('tgl_ijin').AsDateTime);
       h_umur := Now - fieldbyname('tgl_lahir').AsDateTime;
       umur := Floor(h_umur / 365);

       qrlblnama.Caption := fieldbyname('nama_pem').AsString+' Umur '+FloatToStr(umur)+' Tahun Pekerjaan '+fieldbyname('pekerjaan').AsString+' Bertempat Tinggal di ';
       qrlblalama_pem.Caption := fieldbyname('alamat').AsString+' Desa '+fieldbyname('Desa').AsString+' Kecamatan Paringin Kabupaten Balangan';

       qrlbljns_bgn.Caption := 'Membangun '+fieldbyname('jns_bangunan').AsString+', diatas tanah milik '+fieldbyname('milik_tanah').AsString+' yang berlokasi di ';
       qrlbllok_bgn.Caption := fieldbyname('lok_tanah').AsString+' Kecamatan Paringin Kabupaten Balangan';

       if FieldByName('atap').AsString = '-' then kons_bangunan_lap:=fieldbyname('kon_bangun').AsString else kons_bangunan_lap:=fieldbyname('kon_bangun').AsString+' beratap '+fieldbyname('atap').AsString;
       qrlblkons_bgn.Caption := kons_bangunan_lap;
       qrlblukr_bgn.Caption := 'Panjang '+fieldbyname('p_bangun').AsString+' m x Lebar '+fieldbyname('l_bangun').AsString+' m = Luas '+fieldbyname('luas').AsString+' M2';

       if dm.qryundang.Locate('ket','terbit_p1',[]) then
       qrlblp_2.Caption := 'Bersedia mematuhi ketentuan Garis Sempadan Bangunan, sesuai '+dm.qryundang.fieldbyname('undang').AsString;

       if dm.qryundang.Locate('ket','terbit_p2',[]) then
       qrlblp_3.Caption :='Membayar Retribusi dan Sempadan kepada Pemerintah Kabupaten Balangan, berdasarkan '+dm.qryundang.fieldbyname('undang').AsString+' Sebesar Rp. '+ribuan(fieldbyname('pembulatan_biaya').AsString)+',-';

       qrlbl39.Caption := 'DITETAPKAN DI : PARINGIN';
       qrlbltgl.Caption :='PADA TANGGAL : '+bulan(fieldbyname('tgl_terbit').AsDateTime);
       Preview;
     end;
  end;
  FormShow(Sender);
end;

procedure Tf_trans_terbit_surat.dtptgl_terbitCloseUp(Sender: TObject);
var tgl_terbit : string;
begin
 tgl_terbit := DateToStr(dtptgl_terbit.Date);
 if tgl_terbit < edttgl.Text then
  begin
    MessageDlg('Tanggal Salah',mtWarning,[mbok],0);
    dtptgl_terbit.Date := Now;
    dtptgl_terbit.SetFocus;
    Exit;
  end;
end;

end.
