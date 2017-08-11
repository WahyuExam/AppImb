unit u_peng_salindata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Lib_ku, Grids, DBGrids, jpeg, ExtCtrls;

type
  Tf_peng_salindata = class(TForm)
    grp1: TGroupBox;
    Label1: TLabel;
    grp2: TGroupBox;
    btnsalin: TBitBtn;
    btnpanggiil: TBitBtn;
    btnkeluar: TBitBtn;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    img1: TImage;
    procedure btnkeluarClick(Sender: TObject);
    procedure btnsalinClick(Sender: TObject);
    procedure btnpanggiilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_peng_salindata: Tf_peng_salindata;
  a : string;

implementation

uses
  u_dm;

{$R *.dfm}

procedure Tf_peng_salindata.btnkeluarClick(Sender: TObject);
begin
 close;
end;

procedure Tf_peng_salindata.btnsalinClick(Sender: TObject);
begin
 salin_data(dlgSave1,'db_imb',a);
end;

procedure Tf_peng_salindata.btnpanggiilClick(Sender: TObject);
begin
 panggil_data(dlgOpen1,dm.con1,'db_imb',a);
end;

procedure Tf_peng_salindata.FormShow(Sender: TObject);
begin
 a:=GetCurrentDir+'\db_imb.mdb';
end;

end.
