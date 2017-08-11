unit u_peng_jawab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Lib_ku, jpeg, ExtCtrls;

type
  Tf_peng_jawab = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtnip: TEdit;
    edtnama: TEdit;
    edtjabatan: TEdit;
    grp3: TGroupBox;
    btnubah: TBitBtn;
    btnsimpan: TBitBtn;
    btnkeluar: TBitBtn;
    img1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnubahClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure edtnipKeyPress(Sender: TObject; var Key: Char);
    procedure edtnamaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_peng_jawab: Tf_peng_jawab;

implementation

uses
  u_dm, DB;

{$R *.dfm}

procedure Tf_peng_jawab.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_peng_jawab.FormShow(Sender: TObject);
begin
 edit_mati([edtnip,edtnama,edtjabatan]);

 konek_awal(dm.qryjawab,'tbl_jawab','nip');
 with dm.qryjawab do
  begin
    edtnip.Text     := fieldbyname('nip').AsString;
    edtnama.Text    := Fieldbyname('nama').AsString;
    edtjabatan.Text := fieldbyname('jabatan').AsString
  end;

 btnubah.Caption:='Ubah'; btnubah.Enabled:=True;
 btnsimpan.Enabled:=false;
 btnkeluar.Enabled:=True;
end;

procedure Tf_peng_jawab.btnubahClick(Sender: TObject);
begin
  if btnubah.Caption='Ubah' then
  begin
    edit_hidup([edtnip,edtnama,edtjabatan]);
    edtnip.SetFocus;

    btnubah.Caption:='Batal';
    btnsimpan.Enabled:=True;
    btnkeluar.Enabled:=false;
  end
  else
 if btnubah.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_peng_jawab.btnsimpanClick(Sender: TObject);
begin
 if (edtnip.Text='') or (Trim(edtnama.Text)='') or (Trim(edtjabatan.Text)='') then
  begin
    MessageDlg('Semua Data Harus Diisi',mtWarning,[mbok],0);
    if edtnip.Text='' then edtnip.SetFocus else
    if Trim(edtnama.Text)='' then edtnama.SetFocus else
    if Trim(edtjabatan.Text)='' then edtjabatan.SetFocus;
    Exit;
  end;

 if MessageDlg('Yakin Data Akan Diubah ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    with dm.qryjawab do
     begin
      Edit;
      FieldByName('nip').AsString  := edtnip.Text;
      FieldByName('nama').AsString := edtnama.Text;
      FieldByName('jabatan').AsString := edtjabatan.Text;
      Post;
     end;
    MessageDlg('Data Sudah Disimpan',mtInformation,[mbOK],0);
    FormShow(Sender);
  end;
end;

procedure Tf_peng_jawab.edtnipKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8,#9,'.']) then Key:=#0;
 if Key=#13 then edtnama.SetFocus;
end;

procedure Tf_peng_jawab.edtnamaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['a'..'z','A'..'Z',#13,#32,#8,#9,',','.']) then Key:=#0;
 if Key=#13 then SelectNext(sender as TWinControl, True, True);
end;

end.
