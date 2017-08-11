unit u_surat_rincian_reribusi;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  Tsurat_rincian_retribusi = class(TQuickRep)
    qrbndColumnHeaderBand1: TQRBand;
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl_nama: TQRLabel;
    qrlblokasi_tanah: TQRLabel;
    QRShape1: TQRShape;
    qrlbl3: TQRLabel;
    QRShape2: TQRShape;
    qrlbl4: TQRLabel;
    QRShape3: TQRShape;
    qrlbl5: TQRLabel;
    QRShape4: TQRShape;
    qrlbl6: TQRLabel;
    QRShape5: TQRShape;
    qrlbl7: TQRLabel;
    QRShape6: TQRShape;
    qrlbl8: TQRLabel;
    QRShape7: TQRShape;
    qrlbl9: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlbl10: TQRLabel;
    QRDBText1: TQRDBText;
    qrlblukuran: TQRLabel;
    QRDBText2: TQRDBText;
    qrlblb_retribusi: TQRLabel;
    qrlblb_bangun: TQRLabel;
    QRShape14: TQRShape;
    qrlbl11: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    qrlblb_bgn_2: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    qrlbl12: TQRLabel;
    qrlbl13: TQRLabel;
    qrlblb_bgn_smw: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    qrlbl15: TQRLabel;
    qrlblb_sempada: TQRLabel;
    QRShape24: TQRShape;
    qrlbl14: TQRLabel;
    QRShape25: TQRShape;
    qrlblb_periksa_gbr: TQRLabel;
    QRShape26: TQRShape;
    qrlbl16: TQRLabel;
    QRShape27: TQRShape;
    qrlblb_pebgawas: TQRLabel;
    QRShape28: TQRShape;
    qrlbl17: TQRLabel;
    QRShape29: TQRShape;
    qrlbl18: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    qrlbl19: TQRLabel;
    qrlbl20: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    qrlblsempadan: TQRLabel;
    qrlblperiksa_gbr: TQRLabel;
    qrlblpengawasan: TQRLabel;
    qrlbldaftar: TQRLabel;
    qrlbltotal: TQRLabel;
    qrlblbulat: TQRLabel;
    qrbndSummaryBand1: TQRBand;
    qrlbl27: TQRLabel;
    qrlbltgl: TQRLabel;
    qrlbl28: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlbl29: TQRLabel;
  private

  public

  end;

var
  surat_rincian_retribusi: Tsurat_rincian_retribusi;

implementation

uses
  u_dm;

{$R *.DFM}

end.
