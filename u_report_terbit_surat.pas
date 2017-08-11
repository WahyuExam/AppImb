unit u_report_terbit_surat;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  Treport_terbit_surat = class(TQuickRep)
    qrbndColumnHeaderBand1: TQRBand;
    qrlbl2: TQRLabel;
    QRShape1: TQRShape;
    qrlbl3: TQRLabel;
    QRShape2: TQRShape;
    qrlbl4: TQRLabel;
    QRShape7: TQRShape;
    qrlbl10: TQRLabel;
    QRShape8: TQRShape;
    qrlbl11: TQRLabel;
    QRShape10: TQRShape;
    qrlbl13: TQRLabel;
    QRShape15: TQRShape;
    qrlbl14: TQRLabel;
    qrbndDetailBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape18: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape20: TQRShape;
    QRDBText12: TQRDBText;
    qrbndSummaryBand1: TQRBand;
    QRShape6: TQRShape;
    qrlbl7: TQRLabel;
    qrlbltgl: TQRLabel;
    qrlbl8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlbl9: TQRLabel;
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    QRShape3: TQRShape;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    QRImage1: TQRImage;
    qrlbl12: TQRLabel;
    qrlbl15: TQRLabel;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlblbulan: TQRLabel;
    qrlbltahun: TQRLabel;
  private

  public

  end;

var
  report_terbit_surat: Treport_terbit_surat;

implementation

uses
  u_dm;

{$R *.DFM}

end.
