unit u_report_bangunan;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  Treport_bangunan = class(TQuickRep)
    qrbndColumnHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrbndSummaryBand1: TQRBand;
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrlbl2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape6: TQRShape;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    QRImage1: TQRImage;
    qrlbl7: TQRLabel;
    qrlbltgl: TQRLabel;
    qrlbl8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlbl9: TQRLabel;
  private

  public

  end;

var
  report_bangunan: Treport_bangunan;

implementation

uses
  u_dm;

{$R *.DFM}

end.
