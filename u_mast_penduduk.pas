unit u_mast_penduduk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Lib_ku, jpeg,
  ExtCtrls;

type
  Tf_mast_penduduk = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtnoktp: TEdit;
    edtnama: TEdit;
    edttempat: TEdit;
    edtpekerjaan: TEdit;
    mmoalamat: TMemo;
    dtptgllahir: TDateTimePicker;
    grp3: TGroupBox;
    btncampur: TBitBtn;
    btnsimpan: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    grp4: TGroupBox;
    grp5: TGroupBox;
    dbgrd1: TDBGrid;
    Label7: TLabel;
    edtpencarian: TEdit;
    btnkeluar: TBitBtn;
    Label8: TLabel;
    edtdesa: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncampurClick(Sender: TObject);
    procedure edtnoktpKeyPress(Sender: TObject; var Key: Char);
    procedure edtnamaKeyPress(Sender: TObject; var Key: Char);
    procedure dtptgllahirCloseUp(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure edtpencarianChange(Sender: TObject);
    procedure edtnamaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_mast_penduduk: Tf_mast_penduduk;
  status, id_pemohon, no_ktp, nama, tempat, pekerjaan, alamat, desa : string;
  tgl_lahir : TDate;
  tgl, bln, thn : string;

implementation

uses
  u_dm, DB, StrUtils;

{$R *.dfm}

procedure Tf_mast_penduduk.btnkeluarClick(Sender: TObject);
begin
 Close;
end;

procedure Tf_mast_penduduk.FormShow(Sender: TObject);
begin
 edit_kosong([edtnoktp,edtnama,edttempat,edtpekerjaan,edtpencarian,edtdesa]);
 dtptgllahir.Date:=Now;
 mmoalamat.Clear;

 edit_mati([edtnoktp,edtnama,edttempat,edtpekerjaan,edtdesa]);
 dtptgllahir.Enabled:=False;
 mmoalamat.Enabled:=false;

 edtpencarian.Enabled:=True;
 dbgrd1.Enabled:=True;

 btn_mati([btnsimpan,btnubah,btnhapus]);
 btn_hidup([btncampur,btnkeluar]);
 btncampur.Caption:='Tambah';

 konek_awal(dm.qrypemohon,'tbl_pemohon','no_ktp');
 tgl := DateToStr(dtptgllahir.Date);
end;

procedure Tf_mast_penduduk.btncampurClick(Sender: TObject);
begin
 if btncampur.Caption='Tambah' then
  begin
    edit_kosong([edtnoktp,edtnama,edttempat,edtpekerjaan,edtdesa]);
    mmoalamat.Clear;
    dtptgllahir.Date:=Now;
    edit_hidup([edtnoktp,edtnama,edttempat,edtpekerjaan,edtdesa]);
    dtptgllahir.Enabled:=True;
    mmoalamat.Enabled:=True;
    edtnoktp.SetFocus;

    btn_hidup([btncampur,btnsimpan]);
    btn_mati([btnubah,btnhapus,btnkeluar]);
    btncampur.Caption:='Batal';

    dbgrd1.Enabled:=false;
    edtpencarian.Clear; edtpencarian.Enabled:=false;
    status:='simpan';
  end
  else
 if btncampur.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_mast_penduduk.edtnoktpKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8,#9]) then Key:=#0;
 if Key=#13 then
  begin
   if Length(edtnoktp.Text) < 16 then
    begin
      MessageDlg('NIK Tidak Boleh Kurang Dari 16 Digit',mtWarning,[mbOK],0);
      edtnoktp.SetFocus;
      Exit;
    end;

   if status='simpan' then
    begin
     if dm.qrypemohon.Locate('no_ktp',edtnoktp.Text,[]) then
      begin
        MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
        edtnoktp.SetFocus;
        edit_kosong([edtnoktp,edtnama,edttempat,edtpekerjaan]);
        mmoalamat.Clear;
        Exit;
      end
      else
      begin
       edtnama.SetFocus;
       {tgl := MidStr(edtnoktp.Text,7,2);
       bln := MidStr(edtnoktp.Text,9,2);
       thn := MidStr(edtnoktp.Text,11,4);
       dtptgllahir.Date := EncodeDate(StrToInt(thn),StrToInt(bln),StrToInt(tgl))   }
      end;
    end
    else
   if status='ubah' then
    begin
     if edtnoktp.Text<>no_ktp then
      begin
       if dm.qrypemohon.Locate('no_ktp',edtnoktp.Text,[]) then
        begin
          MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
          edtnoktp.SetFocus; edtnoktp.Text:=no_ktp;
          Exit;
        end
        else
        begin
         edtnama.SetFocus;
         {tgl := MidStr(edtnoktp.Text,7,2);
         bln := MidStr(edtnoktp.Text,9,2);
         thn := MidStr(edtnoktp.Text,11,4);
         dtptgllahir.Date := EncodeDate(StrToInt(thn),StrToInt(bln),StrToInt(tgl))   }
        end;
      end;
    end;
  end;
end;

procedure Tf_mast_penduduk.edtnamaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['a'..'z','A'..'Z',#13,#32,#8,#9,'.',',','''']) then Key:=#0;
 if Key=#13 then
  SelectNext(sender as TWinControl, True, True);
end;

procedure Tf_mast_penduduk.dtptgllahirCloseUp(Sender: TObject);
begin
 edtpekerjaan.SetFocus;
 tgl := DateToStr(dtptgllahir.Date);
end;

procedure Tf_mast_penduduk.btnsimpanClick(Sender: TObject);
begin
 if (Trim(edtnoktp.Text)='') or (Trim(edtnama.Text)='') or (Trim(edttempat.Text)='') or (Trim(edtpekerjaan.Text)='') or (Trim(mmoalamat.Text)='') or (Trim(edtdesa.Text)='') then
  begin
    MessageDlg('Semua Data Wajib Diisi',mtWarning,[mbok],0);
    if Trim(edtnoktp.Text)='' then edtnoktp.SetFocus else
    if Trim(edtnama.Text)='' then edtnama.SetFocus else
    if Trim(edttempat.Text)='' then edttempat.SetFocus else
    if Trim(edtpekerjaan.Text)='' then edtpekerjaan.SetFocus else
    if Trim(mmoalamat.Text)='' then mmoalamat.SetFocus;
    if Trim(edtdesa.Text)='' then edtdesa.SetFocus;
    Exit;
  end;

 if Length(edtnoktp.Text) < 16 then
  begin
    MessageDlg('NIK Tidak Boleh Kurang Dari 16 Digit',mtWarning,[mbOK],0);
    edtnoktp.SetFocus;
    Exit;
  end;

 with dm.qrypemohon do
  begin
    if status='simpan' then
     begin
       if Locate('no_ktp',edtnoktp.Text,[]) then
        begin
          MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
          edtnoktp.SetFocus;
          edit_kosong([edtnoktp,edtnama,edttempat,edtpekerjaan]);
          mmoalamat.Clear;
          Exit;
        end
        else
       if Locate('nama_pem;tmp_lahir;alamat;tgl_lahir',VarArrayOf([edtnama.Text,edttempat.Text,mmoalamat.Text,DateToStr(dtptgllahir.Date)]),[]) then
         begin
           MessageDlg('Data Sudah Ada',mtWarning,[mbOK],0);
           edtnama.SetFocus;
           Exit;
         end
       else
        begin
          Append;
        end;
     end
     else
    if status='ubah' then
     begin
       if (edtnoktp.Text=no_ktp) and (edtnama.Text=nama) and (edttempat.Text=tempat) and (DateToStr(dtptgllahir.Date)=DateToStr(tgl_lahir)) and (edtpekerjaan.Text=pekerjaan) and (mmoalamat.Text=alamat) and (edtdesa.Text=desa) then
        begin
          FormShow(Sender);
          Exit;
        end
        else
       if (edtnoktp.Text<>no_ktp) then
        begin
          if Locate('no_ktp', edtnoktp.Text,[]) then
           begin
             MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
             edtnoktp.SetFocus; edtnoktp.Text:=no_ktp; Exit;
           end
           else
           begin
             //edtnoktp.SetFocus; edtnoktp.Text:=no_ktp;
           end;
        end
        else
       if (edtnama.Text<>nama) or (edttempat.Text<>tempat) or (DateToStr(dtptgllahir.Date)<>DateToStr(tgl_lahir)) or (mmoalamat.Text<>alamat) then
        begin
          if Locate('nama_pem;tmp_lahir;tgl_lahir;alamat',VarArrayOf([edtnama.Text,edttempat.Text,DateToStr(dtptgllahir.Date),mmoalamat.Text]),[]) then
           begin
             MessageDlg('Data Sudah Ada',mtWarning,[mbOK],0);
             edtnama.SetFocus;
             Exit;
           end
           else
           begin
            //edtnoktp.SetFocus; edtnoktp.Text:=no_ktp;
           end;
        end;

       if Locate('no_ktp',no_ktp,[]) then Edit;
     end;

     FieldByName('no_ktp').AsString := edtnoktp.Text;
     FieldByName('nama_pem').AsString := edtnama.Text;
     FieldByName('tmp_lahir').AsString := edttempat.Text;
     FieldByName('tgl_lahir').AsString := DateToStr(dtptgllahir.Date);
     FieldByName('pekerjaan').AsString := edtpekerjaan.Text;
     FieldByName('alamat').AsString := mmoalamat.Text;
     FieldByName('desa').AsString := edtdesa.Text;
     Post;

     MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
     FormShow(Sender);
  end;
end;

procedure Tf_mast_penduduk.dbgrd1CellClick(Column: TColumn);
begin
 no_ktp := dbgrd1.Fields[0].AsString; edtnoktp.Text:=no_ktp;
 nama := dbgrd1.Fields[1].AsString; edtnama.Text:=nama;
 tempat := dbgrd1.Fields[2].AsString; edttempat.Text:=tempat;
 tgl_lahir := StrToDate(dbgrd1.Fields[3].AsString); dtptgllahir.Date := tgl_lahir;
 pekerjaan := dbgrd1.Fields[4].AsString; edtpekerjaan.Text:=pekerjaan;
 alamat := dbgrd1.Fields[5].AsString; mmoalamat.Text:=alamat;
 desa := dbgrd1.Fields[6].AsString; edtdesa.Text:=desa;
end;

procedure Tf_mast_penduduk.dbgrd1DblClick(Sender: TObject);
begin
 btn_hidup([btnubah,btnhapus,btncampur]);
 btn_mati([btnsimpan,btnkeluar]);
 btncampur.Caption:='Batal';
 dbgrd1.Enabled:=false;
end;

procedure Tf_mast_penduduk.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with dm.qrypemohon do
     begin
       if Locate('no_ktp',edtnoktp.Text,[]) then Delete;
       MessageDlg('Data Sudah Dihapus',mtInformation,[mbok],0);
       FormShow(Sender);
     end;
  end;
end;

procedure Tf_mast_penduduk.btnubahClick(Sender: TObject);
begin
 edit_hidup([edtnoktp,edtnama,edttempat,edtpekerjaan,edtdesa]);
 dtptgllahir.Enabled:=True;
 mmoalamat.Enabled:=True;
 edtnoktp.SetFocus;

 btn_mati([btnubah,btnhapus,btnkeluar]);
 btn_hidup([btncampur,btnsimpan]);
 btncampur.Caption:='Batal';

 edtpencarian.Enabled:=false; edtpencarian.Clear;
 dbgrd1.Enabled:=false;
 status:='ubah';
end;

procedure Tf_mast_penduduk.edtpencarianChange(Sender: TObject);
begin
 if edtpencarian.Text='' then konek_awal(dm.qrypemohon,'tbl_pemohon','no_ktp') else
  begin
    with dm.qrypemohon do
     begin
       close;
       SQL.Clear;
       SQL.Text:='select * from tbl_pemohon where no_ktp like ''%'+edtpencarian.Text+'%'' or nama_pem like ''%'+edtpencarian.Text+'%''';
       Open;
     end;
  end;
end;

procedure Tf_mast_penduduk.edtnamaEnter(Sender: TObject);
begin
 if Length(edtnoktp.Text) < 16 then
  begin
   MessageDlg('NIK Tidak Boleh Kurang Dari 16 Digit',mtWarning,[mbOK],0);
   edtnoktp.SetFocus;
   Exit;
  end;

  if status='simpan' then
    begin
     if dm.qrypemohon.Locate('no_ktp',edtnoktp.Text,[]) then
      begin
        MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
        edtnoktp.SetFocus;
        edit_kosong([edtnoktp,edtnama,edttempat,edtpekerjaan]);
        mmoalamat.Clear;
        Exit;
      end
      else
      begin
       edtnama.SetFocus;
       {tgl := MidStr(edtnoktp.Text,7,2);
       bln := MidStr(edtnoktp.Text,9,2);
       thn := MidStr(edtnoktp.Text,11,4);
       dtptgllahir.Date := EncodeDate(StrToInt(thn),StrToInt(bln),StrToInt(tgl))   }
      end;
    end
  else
  if status='ubah' then
   begin
    if edtnoktp.Text<>no_ktp then
     begin
       if dm.qrypemohon.Locate('no_ktp',edtnoktp.Text,[]) then
        begin
          MessageDlg('NIK Sudah Ada',mtWarning,[mbok],0);
          edtnoktp.SetFocus; edtnoktp.Text:=no_ktp;
          Exit;
        end
        else
        begin
         edtnama.SetFocus;
         {tgl := MidStr(edtnoktp.Text,7,2);
         bln := MidStr(edtnoktp.Text,9,2);
         thn := MidStr(edtnoktp.Text,11,4);
         dtptgllahir.Date := EncodeDate(StrToInt(thn),StrToInt(bln),StrToInt(tgl))   }
        end;
      end;
   end;
end;

end.
