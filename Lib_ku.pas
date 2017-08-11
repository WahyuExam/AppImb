unit Lib_ku;

interface
 uses SysUtils, StdCtrls, DB, ADODB, Windows, Dialogs, Classes, Messages, Controls;

 var a, i : Integer;

 procedure edit_kosong (com : array of TEdit);
 procedure edit_mati(com : array of TEdit);
 procedure edit_hidup (com : array of TEdit);
 procedure btn_hidup (com:array of TButton);
 procedure btn_mati (com:array of TButton);
 procedure salin_data (nama_save : TSaveDialog; nama_db, a : String);
 procedure panggil_data (nama_open : TOpenDialog; nama_konek : TADOConnection; nama_db, a : string);
 procedure konek_awal (nama_qry : TADOQuery; nama_tbl, kode_kunci : string);
 function kode_oto (nm_tbl, kd_tbl, kd_isi : string; jml_angka :Integer; nm_qry : TADOQuery):string;
 function bulan (vtgl : TDate):string;
 function ribuan (vuang : string) : string;

implementation

uses StrUtils;

procedure edit_kosong(com: array of TEdit);
begin
  for i:=Low(com) to High(com) do
   begin
    if (com[i] is TEdit) then
     begin
       (com[i] as TEdit).Text:='';
     end;
   end;
end;

procedure edit_hidup(com: array of TEdit);
begin
  for a:=Low(com) to High(com) do
   begin
     (com[a] as TEdit).Enabled :=True;
   end;
end;

procedure edit_mati(com: array of TEdit);
begin
  for a:=Low(com) to High(com) do
   begin
     (com[a] as TEdit).Enabled :=False;
   end;
end;

function kode_oto(nm_tbl, kd_tbl, kd_isi: string; jml_angka :Integer; nm_qry : TADOQuery): string;
var
  kode, k : string;
begin
  k:='';
  for a:=1 to jml_angka-1 do
   begin
     k:=k+'0';
   end;
   k := k+'1';

  with nm_qry do
   begin
     close;
     SQL.Clear;
     SQL.Text:='select * from '+nm_tbl+' order by '+kd_tbl+' asc';
     Open;
     if IsEmpty then kode:=k else
      begin
        Last;
        kode := RightStr(fieldbyname(kd_tbl).AsString,jml_angka);
        kode := IntToStr(StrToInt(kode)+1);
      end;
   end;
   Result := kd_isi+'-'+Format('%.'+IntToStr(jml_angka)+'d',[StrToInt(kode)]);
end;

procedure btn_hidup (com:array of TButton);
begin
  for a:=Low(com) to High(com) do
   begin
     (com[a] as TButton).Enabled:=True;
   end;
end;

procedure btn_mati (com:array of TButton);
begin
  for a:=Low(com) to High(com) do
   begin
     (com[a] as TButton).Enabled:=False;
   end;
end;

procedure salin_data (nama_save : TSaveDialog; nama_db, a : String);
var b, c : string;
begin
 nama_save.Execute;
 If nama_save.filename <> '' Then b:=nama_save.FileName else Exit;

 CopyFile(Pchar(a),Pchar(b+'.mdb'),True);
 MessageDlg('Salin Data Berhasil',mtInformation,[mbOK],0);
end;

procedure panggil_data (nama_open : TOpenDialog; nama_konek : TADOConnection; nama_db, a : string);
var b : string;
begin
 nama_open.Execute;
 If nama_open.FileName <> '' Then b:=nama_open.FileName else Exit;

 if MessageDlg('Panggil Data "'+ExtractFileName(b)+'"  ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   nama_konek.Connected:=false;
   nama_konek.ConnectionString:='';

   RenameFile(ExtractFileName(nama_open.FileName), GetCurrentDir+'\'+nama_db+'.mdb');
   CopyFile(PChar(GetCurrentDir+'\'+nama_db+'.mdb'),PChar(a), false);
   SysUtils.DeleteFile(GetCurrentDir+'\'+nama_db+'.mdb');

   nama_konek.ConnectionString:=a;
   nama_konek.Connected:=true;
   MessageDlg('Panggil Data Berhasil',mtInformation,[mbOK],0);
  end;
end;

procedure konek_awal (nama_qry : TADOQuery; nama_tbl, kode_kunci : string);
begin
  with nama_qry do
   begin
     Close;
     SQL.Clear;
     SQL.Text:='select * from '+nama_tbl+' order by '+kode_kunci+' asc';
     Open;
   end;
end;

function bulan (vtgl : TDate):string;
var a : Integer;
const
  nama_bln : array [1..12] of string = ('Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','Nopember','Desember');
begin
  for a:=1 to 12 do
   begin
     LongMonthNames[a] := nama_bln[a];
   end;
   Result := FormatDateTime('dd mmmm yyyy',vtgl);
end;

function ribuan (vuang : string) : string;
var nilairupiah  : string;
    angkarupiah : Currency;
begin
 if vuang='' then Exit;

 nilairupiah := vuang;
 nilairupiah := StringReplace(nilairupiah,',','',[rfReplaceAll,rfIgnoreCase]);
 nilairupiah := StringReplace(nilairupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
 angkarupiah := StrToCurrDef(nilairupiah,0);
 Result := FormatFloat('#,###',angkarupiah);
end;
end.
