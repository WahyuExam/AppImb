unit u_peng_gantisandi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Lib_ku, jpeg, ExtCtrls;

type
  Tf_peng_gantisandi = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtnama: TEdit;
    edtsandilama: TEdit;
    edtsandibaru: TEdit;
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
    procedure edtsandibaruKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_peng_gantisandi: Tf_peng_gantisandi;

implementation

uses
  u_dm;

{$R *.dfm}

procedure Tf_peng_gantisandi.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_peng_gantisandi.FormShow(Sender: TObject);
begin
 edit_mati([edtnama,edtsandilama,edtsandibaru]);
 edtsandibaru.Clear;

 konek_awal(dm.qrypengguna,'tbl_pengguna','pengguna');
 with dm.qrypengguna do
  begin
    edtnama.Text      := fieldbyname('pengguna').AsString;
    edtsandilama.Text := Fieldbyname('sandi').AsString;
  end;

 btnubah.Caption:='Ubah'; btnubah.Enabled:=True;
 btnsimpan.Enabled:=false;
 btnkeluar.Enabled:=True;
end;

procedure Tf_peng_gantisandi.btnubahClick(Sender: TObject);
begin
 if btnubah.Caption='Ubah' then
  begin
    edtsandibaru.Enabled:=True;
    edtsandibaru.SetFocus;

    btnubah.Caption:='Batal';
    btnsimpan.Enabled:=True;
    btnkeluar.Enabled:=false;
  end
  else
 if btnubah.Caption='Batal' then FormShow(Sender);
end;

procedure Tf_peng_gantisandi.btnsimpanClick(Sender: TObject);
begin
 if Trim(edtsandibaru.Text)='' then
  begin
    MessageDlg('Kata Sandi Baru Belum Diisi',mtWarning,[mbOK],0);
    edtsandibaru.SetFocus;
    Exit;
  end;
  
 if MessageDlg('Yakin Kata Sandi Akan Diubah ?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    dm.qrypengguna.Edit;
    dm.qrypengguna.FieldByName('sandi').AsString := edtsandibaru.Text;
    dm.qrypengguna.Post;

    MessageDlg('Kata Sandi Sudah Disimpan',mtInformation,[mbOK],0);
    FormShow(Sender);
  end;
end;

procedure Tf_peng_gantisandi.edtsandibaruKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key=#13 then btnsimpan.Click;
end;

end.
