unit u_trans_ijin_depan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Lib_ku, Buttons, Grids, DBGrids, jpeg, ExtCtrls;

type
  Tf_trans_imb_depan = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    grp3: TGroupBox;
    dbgrd1: TDBGrid;
    btncampur: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    btnkeluar: TBitBtn;
    grp5: TGroupBox;
    Label7: TLabel;
    edtpencarian: TEdit;
    btncetak: TBitBtn;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncampurClick(Sender: TObject);
    procedure edtpencarianChange(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
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
  f_trans_imb_depan: Tf_trans_imb_depan;
  kode_ijin : string;
  a : Integer;

implementation

uses
  u_dm, u_trans_ijin_belakang, DB, u_srt_ijin, ADODB;

{$R *.dfm}

procedure Tf_trans_imb_depan.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_trans_imb_depan.FormShow(Sender: TObject);
begin
 btn_mati([btnubah,btnhapus,btncetak]);
 btn_hidup([btncampur,btnkeluar]);
 btncampur.Caption:='Tambah';

 edtpencarian.Clear;
 dbgrd1.Enabled:=True;
 konek;
end;

procedure Tf_trans_imb_depan.btncampurClick(Sender: TObject);
begin
 if btncampur.Caption='Tambah' then
  begin
   f_trans_imb_belakang.edt1.Text:='tambah';
   f_trans_imb_belakang.ShowModal;
  end
  else
 if btncampur.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_trans_imb_depan.konek;
begin
 with dm.qrytampil_ijinimb do
  begin
    close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara,');
    sql.Add('a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c where a.no_ktp=b.no_ktp and');
    sql.Add('a.kode_bangun=c.kode_bangun and a.ket_terbit='+QuotedStr('-')+' order by a.kd_ijin asc');
    Open;
  end;
end;

procedure Tf_trans_imb_depan.edtpencarianChange(Sender: TObject);
begin
 if edtpencarian.Text='' then konek else
  begin
   with dm.qrytampil_ijinimb do
    begin
      close;
      SQL.Clear;
      SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
      sql.add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara,');
      sql.Add('a.bts_tim,  a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b, tbl_bangunan c where a.no_ktp=b.no_ktp and');
      sql.Add('a.kode_bangun=c.kode_bangun and a.ket_terbit='+QuotedStr('-')+' and (a.kd_ijin like ''%'+edtpencarian.Text+'%'' or b.no_ktp like ''%'+edtpencarian.Text+'%'')');
      Open;
    end;
  end;
end;

procedure Tf_trans_imb_depan.dbgrd1DblClick(Sender: TObject);
begin
 if dbgrd1.Fields[0].AsString='' then Exit;

 kode_ijin := dbgrd1.Fields[0].AsString;
 btn_hidup([btnubah,btnhapus,btncetak]);
 btn_mati([btnkeluar]);
 btncampur.Caption:='Batal';
 dbgrd1.Enabled:=false;
end;

procedure Tf_trans_imb_depan.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbyes,mbNo],0)=mryes then
  begin
    konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');
    if dm.qryijin_imb.Locate('kd_ijin',kode_ijin,[]) then
     begin
       dm.qryijin_imb.Delete;
       FormShow(Sender);
       MessageDlg('Data Sudah Dihapus',mtInformation,[mbok],0);
     end;
  end;
end;

procedure Tf_trans_imb_depan.btnubahClick(Sender: TObject);
begin
 with f_trans_imb_belakang do
   begin
    edt1.Text:='ubah';
    edtkode.Text := Self.dbgrd1.Fields[0].AsString;
    dtptglizin.Date := Self.dbgrd1.Fields[1].AsDateTime;

    edtnoktp.Text := Self.dbgrd1.Fields[2].AsString;
    edtnama_pem.Text := Self.dbgrd1.Fields[3].AsString;
    edtpekerjaan.Text := Self.dbgrd1.Fields[6].AsString;
    edtalamat.Text := Self.dbgrd1.Fields[7].AsString;
    edtdesa.Text := Self.dbgrd1.Fields[23].AsString;
    edtnama_milik.Text := Self.dbgrd1.Fields[10].AsString;
    edtloktanah.Text := Self.dbgrd1.Fields[26].AsString;

    dblkcbbjnsbangunan.KeyValue := Self.dbgrd1.Fields[8].AsString;
    cbbbtkbangunan.Text := Self.dbgrd1.Fields[11].AsString;
    edtkons_bangun.Text := Self.dbgrd1.Fields[13].AsString;
    edtatap.Text := Self.dbgrd1.Fields[14].AsString;

    if Self.dbgrd1.Fields[12].AsString='Ya' then rbya.Checked:=True else
    if Self.dbgrd1.Fields[12].AsString='Tidak' then rbtidak.Checked:=True;

    edtpanjang_bangun.Text := Self.dbgrd1.Fields[15].AsString;
    edtlbr_bangun.Text := Self.dbgrd1.Fields[16].AsString;
    edtluas_bangun.Text := Self.dbgrd1.Fields[17].AsString;

    edtseb_utara.Text := Self.dbgrd1.Fields[18].AsString;
    edtseb_tim.Text := Self.dbgrd1.Fields[19].AsString;
    edtseb_sel.Text := Self.dbgrd1.Fields[20].AsString;
    edtseb_barat.Text := Self.dbgrd1.Fields[21].AsString;

    konek_awal(dm.qrydet_ijinimb,'tbl_det_ijin','kd_ijin');
    with dm.qrydet_ijinimb do
     begin
       close;
       SQL.Clear;
       SQL.Text:='select * from tbl_det_ijin where kd_ijin='+QuotedStr(Self.dbgrd1.Fields[0].AsString)+'';
       Open;
       lst1.Clear;
       for a:=1 to RecordCount do
        begin
          RecNo:=a;

          if FieldByName('ket').AsString='Ada' then
           begin
             konek_awal(dm.qrysyarat,'tbl_syarat_ijin','kd_syarat');
             if dm.qrysyarat.Locate('kd_syarat',dm.qrydet_ijinimb.fieldbyname('kd_syarat').AsString,[]) then
              begin
                lst1.Items.Add(dm.qrysyarat.fieldbyname('syarat').AsString);
              end;
           end;
        end;
     end;
     ShowModal;
   end;
end;

procedure Tf_trans_imb_depan.btncetakClick(Sender: TObject);
var tingkat, kons_bangunan_lap : string;
begin
 konek_awal(dm.qrysyarat,'tbl_syarat_ijin','kd_syarat');
 with dm.qrytampil_lapijin do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir, b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun,');
    sql.Add('c.jns_bangunan, a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangun, a.atap, a.p_bangun, a.l_bangun, a.luas,');
    sql.Add('a.bts_utara, a.bts_tim, a.bts_sel, a.bts_bar, a.status, a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b,');
    sql.Add('tbl_bangunan c where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun and a.kd_ijin='+QuotedStr(kode_ijin)+'');
    Open;
    with surat_ijin do
     begin
      if FieldByName('tingkat').AsString='Ya' then tingkat:='Bertingkat' else
      if FieldByName('tingkat').AsString='Tidak' then tingkat:='Tidak Bertingkat';

      qrlbltgl_izin.Caption := bulan(fieldbyname('tgl_ijin').AsDateTime);
      qrlblbentuk_bgn.Caption := fieldbyname('btk_bangun').AsString+' dan '+tingkat;

      if FieldByName('atap').AsString = '-' then kons_bangunan_lap:=fieldbyname('kon_bangun').AsString else kons_bangunan_lap:=fieldbyname('kon_bangun').AsString+' beratap '+fieldbyname('atap').AsString;
      qrlblkon_bgn.Caption := kons_bangunan_lap;
      qrlblukuran.Caption := 'Panjang '+fieldbyname('p_bangun').AsString+' m x Lebar '+fieldbyname('l_bangun').AsString+' m = Luas '+fieldbyname('luas').AsString+' M2';
      Preview;
     end;
  end;
  FormShow(Sender);
end;

end.
