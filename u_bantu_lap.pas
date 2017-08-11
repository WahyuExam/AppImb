unit u_bantu_lap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, jpeg, ExtCtrls;

type
  Tf_bantu_lap = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    edt1: TEdit;
    grp2: TGroupBox;
    dbgrdijin: TDBGrid;
    grp3: TGroupBox;
    btnpilih: TBitBtn;
    btnkeluar: TBitBtn;
    dbgrdretribusi: TDBGrid;
    dbgrdterbiy_ijin: TDBGrid;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btnpilihClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_bantu_lap: Tf_bantu_lap;

implementation

uses
  u_dm, u_lap_ijin_imb, DB;

{$R *.dfm}

procedure Tf_bantu_lap.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_bantu_lap.btnpilihClick(Sender: TObject);
begin
 {if edt1.Text='lap_ijin' then
  begin
    f_lap_ijinimb.edtkode.Text := dbgrdijin.Fields[0].AsString;
    f_lap_ijinimb.edtnoktp.Text := dbgrdijin.Fields[2].AsString;
    f_lap_ijinimb.edtnama.Text := dbgrdijin.Fields[3].AsString;
  end
  else
 if edt1.Text='lap_retribusi' then
  begin
    f_lap_ijinimb.edtkode.Text := dbgrdretribusi.Fields[0].AsString;
    f_lap_ijinimb.edtnoktp.Text := dbgrdretribusi.Fields[2].AsString;
    f_lap_ijinimb.edtnama.Text := dbgrdretribusi.Fields[3].AsString;
  end
  else
 if edt1.Text='lap_terbit_ijin' then
  begin
    f_lap_ijinimb.edtkode.Text := dbgrdterbiy_ijin.Fields[0].AsString;
    f_lap_ijinimb.edtnoktp.Text := dbgrdterbiy_ijin.Fields[2].AsString;
    f_lap_ijinimb.edtnama.Text := dbgrdterbiy_ijin.Fields[3].AsString;
  end;
  Close;   }
end;

end.
