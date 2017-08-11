unit u_bantu_ijin_imb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Lib_ku, jpeg, ExtCtrls;

type
  Tf_bantu_ijin_imb = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    dbgrd1: TDBGrid;
    grp3: TGroupBox;
    btnpilih: TBitBtn;
    btnkeluar: TBitBtn;
    edt1: TEdit;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btnpilihClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_bantu_ijin_imb: Tf_bantu_ijin_imb;

implementation

uses
  u_dm, u_trans_retribusi, DB, u_trans_terbit_surat, u_lap_ijin_imb;

{$R *.dfm}

procedure Tf_bantu_ijin_imb.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_bantu_ijin_imb.btnpilihClick(Sender: TObject);
begin
 if edt1.Text='retribusi' then
  begin
   with f_trans_retribusi do
    begin
     edtkode_ijin.Text := Self.dbgrd1.Fields[0].AsString;
     edt2.Text := DateToStr(Self.dbgrd1.Fields[1].AsDateTime);
     edtnoktp.Text := Self.dbgrd1.Fields[2].AsString;
     edtnama_pem.Text := Self.dbgrd1.Fields[3].AsString;
     mmoalamat.Text := Self.dbgrd1.Fields[7].AsString;
     edtdesa.Text := Self.dbgrd1.Fields[23].AsString;
     edtjns_bangun.Text := Self.dbgrd1.Fields[9].AsString;
     edtpanjang_bgn.Text := Self.dbgrd1.Fields[15].AsString;
     edtlebar_bgn.Text := Self.dbgrd1.Fields[16].AsString;
     edtluas_bgn.Text := Self.dbgrd1.Fields[17].AsString;
     dtptgl_bayar.Enabled:=True;
    end;
  end
  else
 if edt1.Text='terbit_ijin' then
  begin
    with f_trans_terbit_surat do
     begin
       edtkode_ijin.Text := Self.dbgrd1.Fields[0].AsString;
       edttgl_mohon.Text := bulan(Self.dbgrd1.Fields[1].AsDateTime);
       edttgl.Text := DateToStr(Self.dbgrd1.Fields[1].AsDateTime);
       edtnoktp.Text := Self.dbgrd1.Fields[2].AsString;
       edtnama_pem.Text := Self.dbgrd1.Fields[3].AsString;
       mmoalamat.Text := Self.dbgrd1.Fields[7].AsString;
       edtdesa.Text := self.dbgrd1.Fields[23].AsString;

       edtjns_bngunan.Text := Self.dbgrd1.Fields[9].AsString;
       edtp_bangun.Text := Self.dbgrd1.Fields[15].AsString;
       edtl_bangun.Text := Self.dbgrd1.Fields[16].AsString;
       edtluas.Text := Self.dbgrd1.Fields[17].AsString;

       konek_awal(dm.qryretribusi,'tbl_retribusi','kd_ijin');
       with dm.qryretribusi do
        begin
          if Locate('kd_ijin',Self.dbgrd1.Fields[0].AsString,[]) then
           begin
             edttgl_bayar.Text := bulan(fieldbyname('tgl_bayar').AsDateTime);
             edttotal.Text := ribuan(fieldbyname('pembulatan_biaya').AsString);
           end;
        end;

       Labelketerangan.Caption := 'Keterangan : Biaya Retribusi Sudah Dibayar Lunas';
       dtptgl_terbit.Enabled:=True;
       dtptgl_terbit.SetFocus;
     end;
  end;
 Close;
end;

end.
