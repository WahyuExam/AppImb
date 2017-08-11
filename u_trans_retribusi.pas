unit u_trans_retribusi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Lib_ku, jpeg;

type
  Tf_trans_retribusi = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dtptgl_bayar: TDateTimePicker;
    edtkode_ijin: TEdit;
    edtnoktp: TEdit;
    edtnama_pem: TEdit;
    edtdesa: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    mmoalamat: TMemo;
    Label17: TLabel;
    Label18: TLabel;
    bvl1: TBevel;
    edtjns_bangun: TEdit;
    edtpanjang_bgn: TEdit;
    edtlebar_bgn: TEdit;
    edtluas_bgn: TEdit;
    edtb_reribusi: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    bvl2: TBevel;
    btnproses: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    bvl3: TBevel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    grp3: TGroupBox;
    btnbatal: TBitBtn;
    btnsimpan: TBitBtn;
    btnbantu: TBitBtn;
    labelbiaya_bangun: TLabel;
    Labelbiaya_sempadan: TLabel;
    Labelperiksaan_gbr: TLabel;
    Labelpengawsan: TLabel;
    Labelpendaftran: TLabel;
    Labeltotal_biaya: TLabel;
    Labelpembulatan_biaya: TLabel;
    edt1: TEdit;
    img1: TImage;
    edt2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnbatalClick(Sender: TObject);
    procedure btnbantuClick(Sender: TObject);
    procedure btnprosesClick(Sender: TObject);
    procedure edtb_reribusiChange(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure edtb_reribusiKeyPress(Sender: TObject; var Key: Char);
    procedure dtptgl_bayarCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_trans_retribusi: Tf_trans_retribusi;
  b_bangunan, b_bangun_jln, b_sempadan, b_pemeriksa_gbr, b_pengawasan, b_daftar, b_total, b_bulat_total : Currency;


implementation

uses
  u_dm, u_bantu_ijin_imb, Math, DB, u_trans_retribusi_depan;

{$R *.dfm}

procedure Tf_trans_retribusi.FormShow(Sender: TObject);
begin
 konek_awal(dm.qryretribusi,'tbl_retribusi','kd_ijin');
 if edt1.Text='tambah' then
  begin
    edit_kosong([edtkode_ijin,edtnoktp,edtnama_pem,edtdesa,edtjns_bangun,edtpanjang_bgn,edtlebar_bgn,edtluas_bgn,edtb_reribusi]);
    dtptgl_bayar.Date:=Now;
    mmoalamat.Clear;
    labelbiaya_bangun.Caption:=',-';
    Labelbiaya_sempadan.Caption:=',-';
    Labelperiksaan_gbr.Caption:=',-';
    Labelpengawsan.Caption:=',-';
    Labelpendaftran.Caption:=',-';
    Labeltotal_biaya.Caption:=',-';
    Labelpembulatan_biaya.Caption:=',-';

    mmoalamat.Enabled:=false;
    dtptgl_bayar.Enabled:=false;
    btn_mati([btnsimpan]);
    btn_hidup([btnbantu,btnbatal,btnproses]);
  end
  else
 if edt1.Text='ubah' then
  begin
    btn_mati([btnsimpan,btnbantu]);
    btn_hidup([btnproses,btnbatal]);
    dtptgl_bayar.Enabled:=True;
  end;

  edit_mati([edtkode_ijin,edtnoktp,edtnama_pem,edtdesa,edtjns_bangun,edtpanjang_bgn,edtlebar_bgn,edtluas_bgn]);
  edtb_reribusi.Enabled:=True;
end;

procedure Tf_trans_retribusi.btnbatalClick(Sender: TObject);
begin
 f_trans_retribusi_depan.FormShow(Sender);
 close;
end;

procedure Tf_trans_retribusi.btnbantuClick(Sender: TObject);
begin
  with dm.qrytampil_ijinimb do
  begin
    close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara,');
    sql.Add('a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c where a.no_ktp=b.no_ktp and');
    sql.Add('a.kode_bangun=c.kode_bangun and a.status='+QuotedStr('Syarat Lengkap')+' and a.ket_bayar='+QuotedStr('-')+' order by a.kd_ijin asc');
    Open;
    if IsEmpty then
     begin
       MessageDlg('Tidak Ada Permohoan Izin Mendirikan Bangunan',mtInformation,[mbok],0);
       Exit;
     end
     else
     begin
      FormShow(Sender);
      f_bantu_ijin_imb.edt1.Text:='retribusi';
      f_bantu_ijin_imb.ShowModal;
     end;
  end;
end;

procedure Tf_trans_retribusi.btnprosesClick(Sender: TObject);
begin
 if (edtnoktp.Text='') or (edtb_reribusi.Text='') then
  begin
    MessageDlg('Semua Data Harus Diisi',mtWarning,[mbok],0);
    if edtnoktp.Text='' then btnbantu.SetFocus else
    if edtb_reribusi.Text='' then edtb_reribusi.SetFocus;
    Exit;
  end;

 b_bangunan :=floor(StrToCurr(edtluas_bgn.Text) * StrToCurr(edtb_reribusi.Text));
 b_bangun_jln := Floor(b_bangunan * (1.10/100) * (1.25/100) * (1/100) * 1000000);
 b_sempadan := Floor((1/100) * b_bangun_jln * 10);
 b_pemeriksa_gbr := floor((0.05/100) * b_bangun_jln * 10) ;
 b_pengawasan := Floor((0.05/100) * b_bangun_jln * 10) ;
 b_daftar := 5000;

 b_total := floor(b_bangunan + b_sempadan + b_pemeriksa_gbr + b_pengawasan + b_daftar);
 b_bulat_total := (Trunc(b_total) div 1000) * 1000;

 labelbiaya_bangun.Caption := ribuan(CurrToStr(b_bangunan))+',-';
 Labelbiaya_sempadan.Caption := ribuan(CurrToStr(b_sempadan))+',-';
 Labelperiksaan_gbr.Caption := ribuan(CurrToStr(b_pemeriksa_gbr))+',-';
 Labelpengawsan.Caption := ribuan(CurrToStr(b_pengawasan))+',-';
 Labelpendaftran.Caption := ribuan(CurrToStr(b_daftar))+',-';

 Labeltotal_biaya.Caption := ribuan(CurrToStr(b_total))+',-';
 Labelpembulatan_biaya.Caption := ribuan(CurrToStr(b_bulat_total))+',-';

 MessageDlg('Perhitunagn Total Biaya Retribusi Selesai !!!',mtInformation,[mbok],0);
 btnsimpan.Enabled:=True;
end;

procedure Tf_trans_retribusi.edtb_reribusiChange(Sender: TObject);
begin
 btnsimpan.Enabled:=false;
end;

procedure Tf_trans_retribusi.btnsimpanClick(Sender: TObject);
begin
 konek_awal(dm.qryretribusi,'tbl_retribusi','kd_ijin');
 with dm.qryretribusi do
  begin
    if Locate('kd_ijin',edtkode_ijin.Text,[]) then Edit else Append;

    FieldByName('kd_ijin').AsString := edtkode_ijin.Text;
    FieldByName('tgl_bayar').AsDateTime := dtptgl_bayar.Date;
    FieldByName('biaya_retribusi').AsString := edtb_reribusi.Text;
    FieldByName('biaya_bangunan').AsVariant := b_bangunan;
    FieldByName('biaya_bgn_jln').AsVariant := b_bangun_jln;
    FieldByName('biaya_sempadan').AsVariant := b_sempadan;
    FieldByName('biaya_periksa_gbr').AsVariant := b_pemeriksa_gbr;
    FieldByName('biaya_pengawas').AsVariant := b_pengawasan;
    FieldByName('biaya_daftar').AsVariant := b_daftar;
    FieldByName('total_biaya').AsVariant := b_total;
    FieldByName('pembulatan_biaya').AsVariant := b_bulat_total;
    Post;

    MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);

    //ubah ket_bayar data imb transaksi
    with dm.qryijin_imb do
     begin
       close;
       SQL.Clear;
       SQL.Text:='update tbl_ijin_imb set ket_bayar='+QuotedStr('Lunas')+' where kd_ijin='+QuotedStr(edtkode_ijin.Text)+'';
       ExecSQL;
     end;
    konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');
    FormShow(Sender);
    f_trans_retribusi_depan.FormShow(Sender);
    Self.Close;
  end;
end;

procedure Tf_trans_retribusi.edtb_reribusiKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',#13,#8,#9]) then key:=#0;
 if Key=#13 then
  begin
    btnproses.Click;
  end;
end;

procedure Tf_trans_retribusi.dtptgl_bayarCloseUp(Sender: TObject);
var
  tgl_bayar : string;
begin
 tgl_bayar := DateToStr(dtptgl_bayar.Date);
 if tgl_bayar < edt2.Text then
  begin
    MessageDlg('Tanggal Salah',mtWarning,[mbok],0);
    dtptgl_bayar.Date := Now;
    dtptgl_bayar.SetFocus;
    Exit;
  end;
end;

end.
