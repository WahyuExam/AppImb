unit u_report_ijin_imb;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  Treport_ijinimb = class(TQuickRep)
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
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    qrlbl12: TQRLabel;
    qrlbl13: TQRLabel;
    qrbndDetailBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRShape15: TQRShape;
    qrlbl14: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrlbl15: TQRLabel;
    QRShape18: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrlbl18: TQRLabel;
    qrlbl19: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl16: TQRLabel;
    qrlbltahun: TQRLabel;
    qrlblbulan: TQRLabel;
  private

  public

  end;

var
  report_ijinimb: Treport_ijinimb;

implementation

uses
  u_dm;

{$R *.DFM}

end.
