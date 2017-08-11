unit u_mast_bangunan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Lib_ku, jpeg, ExtCtrls;

type
  Tf_mast_bangunan = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtkode: TEdit;
    edtnama: TEdit;
    grp3: TGroupBox;
    btncampur: TBitBtn;
    btnsimpan: TBitBtn;
    btnubah: TBitBtn;
    btnhapus: TBitBtn;
    btnkeluar: TBitBtn;
    grp4: TGroupBox;
    dbgrd1: TDBGrid;
    grp5: TGroupBox;
    Label7: TLabel;
    edtpencarian: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    img1: TImage;
    procedure FormShow(Sender: TObject);
    procedure btncampurClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnkeluarClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure edtnamaKeyPress(Sender: TObject; var Key: Char);
    procedure edtpencarianChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_mast_bangunan: Tf_mast_bangunan;
  status, kode_bangun, jns_bangunan : string;

implementation

uses u_dm;

{$R *.dfm}

procedure Tf_mast_bangunan.FormShow(Sender: TObject);
begin
 edit_kosong([edtkode,edtnama,edtpencarian]);
 edit_mati([edtkode,edtnama]);

 edtpencarian.Enabled:=True;
 dbgrd1.Enabled:=True;

 btn_mati([btnsimpan,btnubah,btnhapus]);
 btn_hidup([btncampur,btnkeluar]);
 btncampur.Caption:='Tambah';

 konek_awal(dm.qrybangunan,'tbl_bangunan','kode_bangun');
end;

procedure Tf_mast_bangunan.btncampurClick(Sender: TObject);
begin
 if btncampur.Caption='Tambah' then
  begin
    edit_kosong([edtkode,edtnama]);
    edtkode.Text := kode_oto('tbl_bangunan','kode_bangun','BGN',3,dm.qrybangunan);

    edit_hidup([edtnama]);
    edtnama.SetFocus;

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

procedure Tf_mast_bangunan.btnsimpanClick(Sender: TObject);
begin
 if Trim(edtnama.Text)='' then
  begin
    MessageDlg('Jenis Bangunan Wajib Diisi',mtWarning,[mbok],0);
    edtnama.SetFocus;
    Exit;
  end;

 with dm.qrybangunan do
  begin
    if status='simpan' then
     begin
       if Locate('jns_bangunan',edtnama.Text,[]) then
        begin
          MessageDlg('Jenis Bangunan Sudah Ada',mtWarning,[mbok],0);
          edtnama.Clear; edtnama.SetFocus;
          Exit;
        end
        else
        begin
          Append;
          FieldByName('kode_bangun').AsString:=edtkode.Text;
        end;
     end
     else
    if status='ubah' then
     begin
       if (edtkode.Text=kode_bangun) and (edtnama.Text=jns_bangunan) then
        begin
          FormShow(Sender);
          Exit;
        end
        else
       if (edtnama.Text<>jns_bangunan) then
        begin
          if Locate('jns_bangunan',edtnama.Text,[]) then
           begin
             MessageDlg('Jenis Bangunan Sudah Ada',mtWarning,[mbok],0);
             edtnama.SetFocus; edtnama.Text:=jns_bangunan; Exit;
           end
        end;

        if Locate('kode_bangun',edtkode.Text,[]) then Edit;
     end;

     FieldByName('jns_bangunan').AsString := edtnama.Text;
     Post;

     MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
     FormShow(Sender);
  end;
end;

procedure Tf_mast_bangunan.btnubahClick(Sender: TObject);
begin
 edit_hidup([edtnama]);
 edtnama.SetFocus;

 btn_mati([btnubah,btnhapus,btnkeluar]);
 btn_hidup([btncampur,btnsimpan]);
 btncampur.Caption:='Batal';

 edtpencarian.Enabled:=false; edtpencarian.Clear;
 dbgrd1.Enabled:=false;
 status:='ubah';
end;

procedure Tf_mast_bangunan.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Yakin Data Akan Dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with dm.qrybangunan do
     begin
       if Locate('kode_bangun',edtkode.Text,[]) then Delete;
       MessageDlg('Data Sudah Dihapus',mtInformation,[mbok],0);
       FormShow(Sender);
     end;
  end;
end;

procedure Tf_mast_bangunan.btnkeluarClick(Sender: TObject);
begin
 Close;
end;

procedure Tf_mast_bangunan.dbgrd1CellClick(Column: TColumn);
begin
 kode_bangun := dbgrd1.Fields[0].AsString; edtkode.Text:=kode_bangun;
 jns_bangunan := dbgrd1.Fields[1].AsString; edtnama.Text:=jns_bangunan;
end;

procedure Tf_mast_bangunan.dbgrd1DblClick(Sender: TObject);
begin
 btn_hidup([btnubah,btnhapus,btncampur]);
 btn_mati([btnsimpan,btnkeluar]);
 btncampur.Caption:='Batal';
 dbgrd1.Enabled:=false;
end;

procedure Tf_mast_bangunan.edtnamaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['a'..'z','A'..'Z',#13,#32,#8,#9,'.',',','''']) then Key:=#0;
 if Key=#13 then
  SelectNext(sender as TWinControl, True, True);
end;

procedure Tf_mast_bangunan.edtpencarianChange(Sender: TObject);
begin
 if edtpencarian.Text='' then konek_awal(dm.qrybangunan,'tbl_bangunan','kode_bangun') else
  begin
    with dm.qrybangunan do
     begin
       close;
       SQL.Clear;
       SQL.Text:='select * from tbl_bangunan where kode_bangun like ''%'+edtpencarian.Text+'%'' or jns_bangunan like ''%'+edtpencarian.Text+'%''';
       Open;
     end;
  end;
end;

end.
