unit u_lap_ijin_imb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Lib_ku, jpeg;

type
  Tf_lap_ijinimb = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbbbulan: TComboBox;
    edttahun: TEdit;
    grp4: TGroupBox;
    btnlihat: TBitBtn;
    btnkeluar: TBitBtn;
    edt1: TEdit;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btnlihatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbbulanClick(Sender: TObject);
    procedure cbbbulanKeyPress(Sender: TObject; var Key: Char);
    procedure edttahunKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_lap_ijinimb: Tf_lap_ijinimb;
  hari : Integer;
  awal, akhir : TDate;

implementation

uses DateUtils, u_dm, u_bantu_ijin_imb, ADODB, DB, u_bantu_lap, 
  u_report_ijin_imb, u_report_bayar_retribusi, u_report_terbit_surat;

{$R *.dfm}

procedure Tf_lap_ijinimb.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_lap_ijinimb.btnlihatClick(Sender: TObject);
begin
  if (cbbbulan.Text='') or (edttahun.Text='') then
   begin
     MessageDlg('Bulan dan Tahun Harus Diisi',mtWarning,[mbOK],0);
     if cbbbulan.Text='' then cbbbulan.SetFocus else
     if edttahun.Text='' then edttahun.SetFocus;
     Exit;
   end;

  hari  := DaysInAMonth(StrToInt(edttahun.Text),cbbbulan.ItemIndex+1);
  awal  := EncodeDate(StrToInt(edttahun.Text),cbbbulan.ItemIndex+1,1);
  akhir := EncodeDate(StrToInt(edttahun.Text),cbbbulan.ItemIndex+1,hari);

  if edt1.Text='lap_ijin' then
   begin
     with dm.qrytampil_ijinimb do
      begin
        close;
        SQL.Clear;
        SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
        sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
        sql.Add('a.bts_utara, a.bts_tim, a.bts_sel, a.bts_bar, a.status,a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b,');
        sql.Add('tbl_bangunan c where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and a.tgl_ijin between :awal and :akhir order by a.kd_ijin asc');
        Prepared;
        Parameters[0].Value := DateToStr(awal);
        Parameters[1].Value := DateToStr(akhir);
        Open;
        if IsEmpty then
         begin
           MessageDlg('Tidak Ada Permohonan Izin IMB Pada Bulan ini',mtInformation,[mbok],0);
           Exit;
         end
         else
         begin
           konek_awal(dm.qryjawab,'tbl_jawab','NIP');
           report_ijinimb.qrlbltgl.Caption:=bulan(Now);
           report_ijinimb.qrlblbulan.Caption:=cbbbulan.Text;
           report_ijinimb.qrlbltahun.Caption:=edttahun.Text;
           report_ijinimb.Preview;
         end;
      end;
   end
   else
  if edt1.Text='lap_retribusi' then
   begin
     with dm.qrytampil_retribusi do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
        sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
        sql.Add('a.bts_utara, a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi,');
        sql.Add('d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr, d.biaya_pengawas, d.biaya_daftar,');
        sql.Add('d.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d where a.no_ktp=b.no_ktp');
        sql.add('and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and a.ket_bayar='+QuotedStr('Lunas')+' and d.tgl_bayar between :awal and :akhir order by a.kd_ijin asc');
        Prepared;
        Parameters[0].Value := DateToStr(awal);
        Parameters[1].Value := DateToStr(akhir);
        Open;
        if IsEmpty then
         begin
           MessageDlg('Tidak Ada Pembayaran Retribusi Izin IMB Pada Bulan ini',mtInformation,[mbok],0);
           Exit;
         end
         else
         begin
           konek_awal(dm.qryjawab,'tbl_jawab','NIP');
           report_bayar_retribusi.qrlbltgl.Caption:=bulan(Now);
           report_bayar_retribusi.qrlblbulan.Caption:=cbbbulan.Text;
           report_bayar_retribusi.qrlbltahun.Caption:=edttahun.Text;
           report_bayar_retribusi.Preview;
         end;
      end;
   end
   else
  if edt1.Text='lap_terbit_ijin' then
   begin
     with dm.qrytampil_terbit_surat do
      begin
        close;
        sql.Clear;
        sql.add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
        SQL.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
        sql.Add('a.bts_utara, a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retribusi,');
        sql.Add('d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biaya_periksa_gbr, d.biaya_pengawas, d.biaya_daftar,');
        sql.Add('d.total_biaya, d.pembulatan_biaya, e.tgl_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d, tbl_terbit_surat e');
        sql.Add('where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and d.kd_ijin=a.kd_ijin and e.kd_ijin=a.kd_ijin');
        sql.Add('and a.ket_terbit='+QuotedStr('Terbit')+' and e.tgl_terbit between :awal and :akhir order by a.kd_ijin asc');
        Prepared;
        Parameters[0].Value := DateToStr(awal);
        Parameters[1].Value := DateToStr(akhir);
        Open;
        if IsEmpty then
         begin
           MessageDlg('Tidak Ada Penerbitan Surat Izin IMB Pada Bulan ini',mtInformation,[mbok],0);
           Exit;
         end
         else
         begin
           konek_awal(dm.qryjawab,'tbl_jawab','NIP');
           report_terbit_surat.qrlbltgl.Caption:=bulan(Now);
           report_terbit_surat.qrlblbulan.Caption:=cbbbulan.Text;
           report_terbit_surat.qrlbltahun.Caption:=edttahun.Text;
           report_terbit_surat.Preview;
         end;
      end;
   end;
end;

procedure Tf_lap_ijinimb.FormShow(Sender: TObject);
begin
 edit_kosong([edttahun]);
 cbbbulan.Text:='';
end;

procedure Tf_lap_ijinimb.cbbbulanClick(Sender: TObject);
begin
 edttahun.Text:=FormatDateTime('yyyy',Now);
end;

procedure Tf_lap_ijinimb.cbbbulanKeyPress(Sender: TObject; var Key: Char);
begin
 Key:=#0;
end;

procedure Tf_lap_ijinimb.edttahunKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8,#9]) then Key:=#0;
end;

end.
