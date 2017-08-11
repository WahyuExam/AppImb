unit u_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Lib_ku, jpeg, ExtCtrls;

type
  Tf_login = class(TForm)
    edtsandi: TEdit;
    img1: TImage;
    btnmasuk: TBitBtn;
    btnkeluar: TBitBtn;
    procedure btnkeluarClick(Sender: TObject);
    procedure btnmasukClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtsandiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_login: Tf_login;

implementation

uses
  u_dm, u_menu;

{$R *.dfm}

procedure Tf_login.btnkeluarClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure Tf_login.btnmasukClick(Sender: TObject);
begin
 konek_awal(dm.qrypengguna,'tbl_pengguna','pengguna');
 if Trim(edtsandi.Text)='' then
  begin
    MessageDlg('Kata Sandi Belum Diisi',mtWarning,[mbok],0);
    edtsandi.SetFocus;
  end
  else
  begin
    if edtsandi.Text=dm.qrypengguna.FieldByName('sandi').AsString then
     begin
       f_menu.Show;
     end
     else
     begin
       MessageDlg('Kata Sandi Salah',mtError,[mbOK],0);
       edtsandi.Clear; edtsandi.SetFocus;
     end;
  end;
end;

procedure Tf_login.FormShow(Sender: TObject);
begin
 edtsandi.Clear;
 edtsandi.SetFocus;
end;

procedure Tf_login.edtsandiKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then btnmasuk.Click;
end;

end.
