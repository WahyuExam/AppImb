unit u_trans_ijin_belakang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Lib_ku, CheckLst,
  jpeg;

type
  Tf_trans_imb_belakang = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    bvl1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    grp3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtkode: TEdit;
    edtnoktp: TEdit;
    edtnama_pem: TEdit;
    edtpekerjaan: TEdit;
    edtalamat: TEdit;
    edtdesa: TEdit;
    dtptglizin: TDateTimePicker;
    edtnama_milik: TEdit;
    cbbbtkbangunan: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    edtkons_bangun: TEdit;
    edtatap: TEdit;
    rbya: TRadioButton;
    rbtidak: TRadioButton;
    edtpanjang_bangun: TEdit;
    edtlbr_bangun: TEdit;
    edtluas_bangun: TEdit;
    dblkcbbjnsbangunan: TDBLookupComboBox;
    grp4: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    edtseb_utara: TEdit;
    edtseb_tim: TEdit;
    edtseb_sel: TEdit;
    edtseb_barat: TEdit;
    grp5: TGroupBox;
    grp6: TGroupBox;
    btnbatal: TBitBtn;
    btnsimpan: TBitBtn;
    chklstsyarat: TCheckListBox;
    btnbantu: TBitBtn;
    edt1: TEdit;
    lst1: TListBox;
    Label34: TLabel;
    Label35: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    edtloktanah: TEdit;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnbatalClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnbantuClick(Sender: TObject);
    procedure edtpanjang_bangunKeyPress(Sender: TObject; var Key: Char);
    procedure edtlbr_bangunKeyPress(Sender: TObject; var Key: Char);
    procedure cbbbtkbangunanKeyPress(Sender: TObject; var Key: Char);
    procedure edtnama_milikKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbjnsbangunanCloseUp(Sender: TObject);
    procedure cbbbtkbangunanClick(Sender: TObject);
    procedure edtloktanahKeyPress(Sender: TObject; var Key: Char);
    procedure dtptglizinCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_trans_imb_belakang: Tf_trans_imb_belakang;
  a, b : Integer;
  ada : Boolean;
  pjg, lbr : Real;
  ket : string;

implementation

uses
  u_dm, DB, u_data_pemohon, u_trans_ijin_depan, ADODB;

{$R *.dfm}

procedure Tf_trans_imb_belakang.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_trans_imb_belakang.FormShow(Sender: TObject);
begin
 konek_awal(dm.qrysyarat,'tbl_syarat_ijin','kd_syarat');
 chklstsyarat.Clear;
 for a:=1 to dm.qrysyarat.RecordCount do
  begin
    dm.qrysyarat.RecNo := a;
    chklstsyarat.Items.Add(dm.qrysyarat.fieldbyname('syarat').AsString);
  end;

 konek_awal(dm.qrybangunan,'tbl_bangunan','kode_bangun');
 if edt1.Text='tambah' then
  begin
   edtkode.Text := kode_oto('tbl_ijin_imb','kd_ijin','IZN',3,dm.qryijin_imb);
   edit_kosong([edtnoktp,edtnama_pem,edtpekerjaan,edtalamat,edtdesa,edtnama_milik,edtkons_bangun,edtatap,edtpanjang_bangun,edtlbr_bangun,edtluas_bangun]);
   edit_kosong([edtseb_utara,edtseb_tim,edtseb_sel,edtseb_barat,edtloktanah]);
   dtptglizin.Date:=Now;
   dblkcbbjnsbangunan.KeyValue:=Null;
   cbbbtkbangunan.Text:='';
   rbya.Checked:=false; rbtidak.Checked:=false;

   btnbantu.Enabled:=True;
   edit_mati([edtkode,edtnoktp,edtnama_pem,edtpekerjaan,edtalamat,edtdesa,edtluas_bangun]);
  end
  else
 if edt1.Text='ubah' then
  begin
    for a:=0 to lst1.Count-1 do
     begin
       for b:=0 to chklstsyarat.Count-1 do
        begin
          if lst1.Items.Strings[a] = chklstsyarat.Items.Strings[b] then
           begin
             chklstsyarat.Checked[b]:=True;
           end;
        end;
     end;

    edit_mati([edtkode,edtnoktp,edtnama_pem,edtpekerjaan,edtalamat,edtdesa]);
    btnbantu.Enabled:=false;
  end;
end;

procedure Tf_trans_imb_belakang.btnbatalClick(Sender: TObject);
begin
 f_trans_imb_depan.FormShow(Sender);
 close;
end;

procedure Tf_trans_imb_belakang.btnsimpanClick(Sender: TObject);
begin
 if (edtnoktp.Text='') or (Trim(edtnama_milik.Text)='') or (dblkcbbjnsbangunan.KeyValue=null) or (cbbbtkbangunan.Text='') or (Trim(edtkons_bangun.Text)='') or (Trim(edtatap.Text)='') or ((rbya.Checked=false) and (rbtidak.Checked=false)) or
    (edtpanjang_bangun.Text='') or (edtlbr_bangun.Text='') or (Trim(edtseb_utara.Text)='') or (Trim(edtseb_tim.Text)='') or (Trim(edtseb_sel.Text)='') or (Trim(edtseb_barat.Text)='') or (Trim(edtloktanah.Text)='') then
    begin
      MessageDlg('Semua Data Wajib Diisi',mtWarning,[mbok],0);
      if edtnoktp.Text='' then btnbantu.SetFocus else
      if Trim(edtnama_milik.Text)='' then edtnama_milik.SetFocus else
      if Trim(edtloktanah.Text)='' then edtloktanah.SetFocus else
      if dblkcbbjnsbangunan.KeyValue=null then dblkcbbjnsbangunan.SetFocus else
      if cbbbtkbangunan.Text='' then cbbbtkbangunan.SetFocus else
      if Trim(edtkons_bangun.Text)='' Then edtkons_bangun.SetFocus else
      if Trim(edtatap.Text)='' then edtatap.SetFocus else
      if (rbya.Checked=False) and (rbtidak.Checked=false) then MessageDlg('Inputan Bertingkat Belum Dipilih',mtWarning,[mbOK],0) else
      if edtpanjang_bangun.Text='' then edtpanjang_bangun.SetFocus else
      if edtlbr_bangun.Text='' then edtlbr_bangun.SetFocus else
      if Trim(edtseb_utara.Text)='' then edtseb_utara.SetFocus else
      if Trim(edtseb_tim.Text)='' then edtseb_tim.SetFocus else
      if Trim(edtseb_sel.Text)='' then edtseb_sel.SetFocus else
      if Trim(edtseb_barat.Text)='' then edtseb_barat.SetFocus;
      Exit;
    end;


   edtluas_bangun.Text:=FloatToStr(StrToFloat(edtpanjang_bangun.Text)*StrToFloat(edtlbr_bangun.Text));
   konek_awal(dm.qryijin_imb,'tbl_ijin_imb','kd_ijin');
   with dm.qryijin_imb do
    begin
      if edt1.Text='tambah' then
       begin
         if dm.qryijin_imb.Locate('no_ktp;kode_bangun;lok_tanah;bts_utara;bts_tim;bts_sel;bts_bar;ket_terbit',VarArrayOf([edtnoktp.Text,dblkcbbjnsbangunan.KeyValue,edtloktanah.Text,edtseb_utara.Text,edtseb_tim.Text,edtseb_sel.Text,edtseb_barat.Text,'-']),[]) then
          begin
            MessageDlg('Data Sudah Ada dan Masih Dalam Proses Penerbitan Surat Izin',mtWarning,[mbOK],0);
            FormShow(Sender);
            Exit;
          end
          else
          begin
           Append;
           FieldByName('kd_ijin').AsString := edtkode.Text;
          end;
       end
       else
      if edt1.Text='ubah' then
       begin
        if Locate('kd_ijin',edtkode.Text,[]) then Edit;
       end;

       FieldByName('tgl_ijin').AsDateTime := dtptglizin.Date;
       FieldByName('no_ktp').AsString := edtnoktp.Text;
       FieldByName('kode_bangun').AsString := dblkcbbjnsbangunan.KeyValue;
       FieldByName('milik_tanah').AsString := edtnama_pem.Text;
       FieldByName('lok_tanah').AsString := edtloktanah.Text;
       FieldByName('btk_bangun').AsString := cbbbtkbangunan.Text;

       if rbya.Checked=True then FieldByName('tingkat').AsString :=rbya.Caption else
       if rbtidak.Checked=True then FieldByName('tingkat').AsString := rbtidak.Caption;

       FieldByName('kon_bangun').AsString := edtkons_bangun.Text;
       FieldByName('atap').AsString := edtatap.Text;
       FieldByName('p_bangun').AsString := edtpanjang_bangun.Text;
       FieldByName('l_bangun').AsString := edtlbr_bangun.Text;
       FieldByName('luas').AsString := edtluas_bangun.Text;
       FieldByName('bts_utara').AsString := edtseb_utara.Text;
       FieldByName('bts_tim').AsString := edtseb_tim.Text;
       FieldByName('bts_sel').AsString := edtseb_sel.Text;
       FieldByName('bts_bar').AsString := edtseb_barat.Text;
       FieldByName('ket_bayar').AsString:='-';
       FieldByName('ket_terbit').AsString :='-';
       Post;

       konek_awal(dm.qrydet_ijinimb,'tbl_det_ijin','kd_ijin');
       with dm.qrydet_ijinimb do
        begin
          konek_awal(dm.qrysyarat,'tbl_syarat_ijin','kd_syarat');
          for a:=1 to dm.qrysyarat.RecordCount do
           begin
             dm.qrysyarat.RecNo:=a;
             if Locate('kd_ijin;kd_syarat',VarArrayOf([edtkode.Text,dm.qrysyarat.FieldByName('kd_syarat').AsString]),[]) then Edit else Append;

             FieldByName('kd_ijin').AsString := edtkode.Text;
             FieldByName('kd_syarat').AsString := dm.qrysyarat.fieldbyname('kd_syarat').AsString;
             Post;
           end;
        end;

       //cheklisbok
       lst1.Clear;
       for a:=0 to chklstsyarat.Count-1 do
        begin
         if chklstsyarat.Checked[a]=True then
           begin
            with dm.qrysyarat do
             begin
              if Locate('syarat',chklstsyarat.Items.Strings[a],[]) then
               begin
                 lst1.Items.Add(fieldbyname('kd_syarat').AsString);
               end;
             end;
           end;
        end;

        //simpan
        with dm.qrydet_ijinimb do
         begin
          close;
          SQL.Clear;
          SQL.Text:='update tbl_det_ijin set ket='+QuotedStr('')+' where kd_ijin='+QuotedStr(edtkode.Text)+'';
          ExecSQL;

          konek_awal(dm.qrydet_ijinimb,'tbl_det_ijin','kd_ijin');
          for a:=0 to lst1.Count-1 do
           begin
             if Locate('kd_ijin;kd_syarat',VarArrayOf([edtkode.Text,lst1.Items.Strings[a]]),[]) then
              begin
               Edit;
               FieldByName('ket').AsString := 'Ada';
               Post;
              end;
           end;
         end;

        //ubah status
        with dm.qrydet_ijinimb do
         begin
           close;
           SQL.Clear;
           SQL.Text:='select * from tbl_det_ijin where kd_ijin='+QuotedStr(edtkode.Text)+'';
           Open;
           ada := False;
           for a:=1 to RecordCount do
            begin
              RecNo:=a;
              if FieldByName('ket').AsString='' then ada:=True;
            end;
         end;

         with dm.qryijin_imb do
          begin
            if Locate('kd_ijin',edtkode.Text,[]) then
             begin
               Edit;
               if ada=True then FieldByName('status').AsString := 'Syarat Belum Lengkap' else
               if ada=False then FieldByName('status').AsString := 'Syarat Lengkap';
               Post;
             end;
          end;

       MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
       FormShow(Sender);
       f_trans_imb_depan.FormShow(Sender);
       Self.Close;
    end;
end;

procedure Tf_trans_imb_belakang.btnbantuClick(Sender: TObject);
begin
 f_bantu_pemohon.ShowModal;
end;

procedure Tf_trans_imb_belakang.edtpanjang_bangunKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8,#9,'.']) then key:=#0;
 if Key=#13 then
  begin
    if edtlbr_bangun.Text='' then  lbr:=0 else lbr:=StrToFloat(edtlbr_bangun.Text);
    edtluas_bangun.Text:= FloatToStr(StrToFloat(edtpanjang_bangun.Text)*lbr);
    edtlbr_bangun.SetFocus;
  end;
end;

procedure Tf_trans_imb_belakang.edtlbr_bangunKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',#13,#8,#9,'.']) then key:=#0;
 if Key=#13 then
  begin
    if edtpanjang_bangun.Text='' then  pjg:=0 else pjg:=StrToFloat(edtpanjang_bangun.Text);
    edtluas_bangun.Text:= FloatToStr(pjg * StrToFloat(edtlbr_bangun.Text));
    edtseb_utara.SetFocus;
  end;
end;

procedure Tf_trans_imb_belakang.cbbbtkbangunanKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure Tf_trans_imb_belakang.edtnama_milikKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['a'..'z','A'..'Z',#13,#32,#8,#9,'.',',','''','(',')','-']) then Key:=#0;
 if Key=#13 then
  SelectNext(sender as TWinControl,True,True);
end;

procedure Tf_trans_imb_belakang.dblkcbbjnsbangunanCloseUp(Sender: TObject);
begin
 cbbbtkbangunan.SetFocus;
end;

procedure Tf_trans_imb_belakang.cbbbtkbangunanClick(Sender: TObject);
begin
 edtkons_bangun.SetFocus;
end;

procedure Tf_trans_imb_belakang.edtloktanahKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['a'..'z','A'..'Z','0'..'9',#13,#32,#8,#9,'.',',','''','(',')','-']) then Key:=#0;
 if Key=#13 then
  SelectNext(sender as TWinControl,True,True);
end;

procedure Tf_trans_imb_belakang.dtptglizinCloseUp(Sender: TObject);
begin
 if dtptglizin.Date > Now then
  begin
    MessageDlg('Tanggal Tidak Boleh Melebihi Tanggal Sekarang',mtWarning,[mbok],0);
    dtptglizin.Date:=Now;
    dtptglizin.SetFocus;
    Exit;
  end;
end;

end.
