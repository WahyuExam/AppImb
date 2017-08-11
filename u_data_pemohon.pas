unit u_data_pemohon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Lib_ku, jpeg, ExtCtrls;

type
  Tf_bantu_pemohon = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    dbgrd1: TDBGrid;
    grp3: TGroupBox;
    btnpilih: TBitBtn;
    btnkeluar: TBitBtn;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnpilihClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_bantu_pemohon: Tf_bantu_pemohon;

implementation

uses
  u_dm, u_trans_ijin_belakang;

{$R *.dfm}

procedure Tf_bantu_pemohon.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_bantu_pemohon.FormShow(Sender: TObject);
begin
 konek_awal(dm.qrypemohon,'tbl_pemohon','no_ktp');
end;

procedure Tf_bantu_pemohon.btnpilihClick(Sender: TObject);
begin
 with f_trans_imb_belakang do
  begin
    edtnoktp.Text:=Self.dbgrd1.Fields[0].AsString;
    edtnama_pem.Text:=Self.dbgrd1.Fields[1].AsString;
    edtpekerjaan.Text:=Self.dbgrd1.Fields[4].AsString;
    edtalamat.Text:=Self.dbgrd1.Fields[5].AsString;
    edtdesa.Text:=Self.dbgrd1.Fields[6].AsString;

    edtnama_milik.SetFocus;
  end;
  Close;
end;

end.
