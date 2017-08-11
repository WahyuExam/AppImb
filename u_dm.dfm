object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 272
  Top = 167
  Height = 447
  Width = 765
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=db_im' +
      'b.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB' +
      ':System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Databas' +
      'e Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking' +
      ' Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bul' +
      'k Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Cr' +
      'eate System Database=False;Jet OLEDB:Encrypt Database=False;Jet ' +
      'OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Witho' +
      'ut Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object XPManifest1: TXPManifest
    Left = 80
    Top = 16
  end
  object qrypengguna: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_pengguna')
    Left = 32
    Top = 72
  end
  object qryjawab: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_jawab')
    Left = 32
    Top = 128
  end
  object qrypemohon: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_pemohon')
    Left = 120
    Top = 72
    object wdstrngfld_ktp: TWideStringField
      FieldName = 'no_ktp'
      Size = 25
    end
    object wdstrngfld_pem: TWideStringField
      FieldName = 'nama_pem'
      Size = 50
    end
    object wdstrngfld_lahir: TWideStringField
      FieldName = 'tmp_lahir'
      Size = 50
    end
    object qrypemohontgl_lahir: TDateTimeField
      FieldName = 'tgl_lahir'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wdstrngfldqrypemohonpekerjaan: TWideStringField
      FieldName = 'pekerjaan'
      Size = 25
    end
    object wdstrngfldqrypemohonalamat: TWideStringField
      FieldName = 'alamat'
      Size = 50
    end
    object wdstrngfldqrypemohondesa: TWideStringField
      FieldName = 'desa'
      Size = 30
    end
  end
  object dspemohon: TDataSource
    DataSet = qrypemohon
    Left = 120
    Top = 128
  end
  object qrybangunan: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_bangunan')
    Left = 192
    Top = 72
  end
  object dsbangunan: TDataSource
    DataSet = qrybangunan
    Left = 192
    Top = 136
  end
  object qryijin_imb: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_ijin_imb')
    Left = 352
    Top = 72
  end
  object qrysyarat: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_syarat_ijin')
    Left = 272
    Top = 72
  end
  object qrydet_ijinimb: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_det_ijin')
    Left = 408
    Top = 96
  end
  object qrytampil_ijinimb: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir' +
        ', b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.j' +
        'ns_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm, a.bts_sel, a.bts_bar, a.status, '
      
        'a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b, tb' +
        'l_bangunan c where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_ba' +
        'ngun')
    Left = 352
    Top = 136
    object wdstrngfld_ijinimbkd_ijin: TWideStringField
      FieldName = 'kd_ijin'
      Size = 10
    end
    object qrytampil_ijinimbtgl_ijin: TDateTimeField
      FieldName = 'tgl_ijin'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wdstrngfld_ijinimbno_ktp: TWideStringField
      FieldName = 'no_ktp'
      Size = 25
    end
    object wdstrngfld_ijinimbnama_pem: TWideStringField
      FieldName = 'nama_pem'
      Size = 50
    end
    object wdstrngfld_ijinimbtmp_lahir: TWideStringField
      FieldName = 'tmp_lahir'
      Size = 50
    end
    object qrytampil_ijinimbtgl_lahir: TDateTimeField
      FieldName = 'tgl_lahir'
    end
    object wdstrngfld_ijinimbpekerjaan: TWideStringField
      FieldName = 'pekerjaan'
      Size = 25
    end
    object wdstrngfld_ijinimbalamat: TWideStringField
      FieldName = 'alamat'
      Size = 50
    end
    object wdstrngfld_ijinimbdesa: TWideStringField
      FieldName = 'desa'
      Size = 30
    end
    object wdstrngfld_ijinimbkode_bangun: TWideStringField
      FieldName = 'kode_bangun'
      Size = 10
    end
    object wdstrngfld_ijinimbjns_bangunan: TWideStringField
      FieldName = 'jns_bangunan'
      Size = 50
    end
    object wdstrngfld_ijinimbmilik_tanah: TWideStringField
      FieldName = 'milik_tanah'
      Size = 25
    end
    object wdstrngfld_ijinimbbtk_bangun: TWideStringField
      FieldName = 'btk_bangun'
      Size = 25
    end
    object wdstrngfld_ijinimbtingkat: TWideStringField
      FieldName = 'tingkat'
      Size = 7
    end
    object wdstrngfld_ijinimbkon_bangun: TWideStringField
      FieldName = 'kon_bangun'
    end
    object wdstrngfld_ijinimbatap: TWideStringField
      FieldName = 'atap'
    end
    object qrytampil_ijinimbp_bangun: TFloatField
      FieldName = 'p_bangun'
    end
    object qrytampil_ijinimbl_bangun: TFloatField
      FieldName = 'l_bangun'
    end
    object qrytampil_ijinimbluas: TFloatField
      FieldName = 'luas'
    end
    object wdstrngfld_ijinimbbts_utara: TWideStringField
      FieldName = 'bts_utara'
      Size = 25
    end
    object wdstrngfld_ijinimbbts_tim: TWideStringField
      FieldName = 'bts_tim'
      Size = 25
    end
    object wdstrngfld_ijinimbbts_sel: TWideStringField
      FieldName = 'bts_sel'
      Size = 25
    end
    object wdstrngfld_ijinimbbts_bar: TWideStringField
      FieldName = 'bts_bar'
      Size = 25
    end
    object wdstrngfld_ijinimbstatus: TWideStringField
      FieldName = 'status'
    end
    object wdstrngfld_ijinimbket_bayar: TWideStringField
      FieldName = 'ket_bayar'
      Size = 25
    end
    object wdstrngfld_ijinimbket_terbit: TWideStringField
      FieldName = 'ket_terbit'
      Size = 25
    end
    object wdstrngfld_ijinimblok_tanah: TWideStringField
      FieldName = 'lok_tanah'
      Size = 100
    end
  end
  object dstampil_ijinimb: TDataSource
    DataSet = qrytampil_ijinimb
    Left = 416
    Top = 160
  end
  object qryretribusi: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_retribusi')
    Left = 520
    Top = 72
  end
  object qrytampil_retribusi: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir,' +
        ' b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.jn' +
        's_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm,  a.bts_sel, a.bts_bar, '
      
        'a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retrib' +
        'usi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biay' +
        'a_periksa_gbr, d.biaya_pengawas, d.biaya_daftar, '
      
        'd.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemoh' +
        'on b, tbl_bangunan c, tbl_retribusi d where a.no_ktp=b.no_ktp an' +
        'd a.kode_bangun=c.kode_bangun '
      'and d.kd_ijin=a.kd_ijin')
    Left = 552
    Top = 128
    object wdstrngfld_retribusikd_ijin: TWideStringField
      FieldName = 'kd_ijin'
      Size = 10
    end
    object qrytampil_retribusitgl_ijin: TDateTimeField
      FieldName = 'tgl_ijin'
    end
    object wdstrngfld_retribusino_ktp: TWideStringField
      FieldName = 'no_ktp'
      Size = 25
    end
    object wdstrngfld_retribusinama_pem: TWideStringField
      FieldName = 'nama_pem'
      Size = 50
    end
    object wdstrngfld_retribusitmp_lahir: TWideStringField
      FieldName = 'tmp_lahir'
      Size = 50
    end
    object qrytampil_retribusitgl_lahir: TDateTimeField
      FieldName = 'tgl_lahir'
    end
    object wdstrngfld_retribusipekerjaan: TWideStringField
      FieldName = 'pekerjaan'
      Size = 25
    end
    object wdstrngfld_retribusialamat: TWideStringField
      FieldName = 'alamat'
      Size = 50
    end
    object wdstrngfld_retribusidesa: TWideStringField
      FieldName = 'desa'
      Size = 30
    end
    object wdstrngfld_retribusikode_bangun: TWideStringField
      FieldName = 'kode_bangun'
      Size = 10
    end
    object wdstrngfld_retribusijns_bangunan: TWideStringField
      FieldName = 'jns_bangunan'
      Size = 50
    end
    object wdstrngfld_retribusimilik_tanah: TWideStringField
      FieldName = 'milik_tanah'
      Size = 25
    end
    object wdstrngfld_retribusibtk_bangun: TWideStringField
      FieldName = 'btk_bangun'
      Size = 25
    end
    object wdstrngfld_retribusitingkat: TWideStringField
      FieldName = 'tingkat'
      Size = 7
    end
    object wdstrngfld_retribusikon_bangun: TWideStringField
      FieldName = 'kon_bangun'
    end
    object wdstrngfld_retribusiatap: TWideStringField
      FieldName = 'atap'
    end
    object qrytampil_retribusip_bangun: TFloatField
      FieldName = 'p_bangun'
    end
    object qrytampil_retribusil_bangun: TFloatField
      FieldName = 'l_bangun'
    end
    object qrytampil_retribusiluas: TFloatField
      FieldName = 'luas'
    end
    object wdstrngfld_retribusibts_utara: TWideStringField
      FieldName = 'bts_utara'
      Size = 25
    end
    object wdstrngfld_retribusibts_tim: TWideStringField
      FieldName = 'bts_tim'
      Size = 25
    end
    object wdstrngfld_retribusibts_sel: TWideStringField
      FieldName = 'bts_sel'
      Size = 25
    end
    object wdstrngfld_retribusibts_bar: TWideStringField
      FieldName = 'bts_bar'
      Size = 25
    end
    object wdstrngfld_retribusistatus: TWideStringField
      FieldName = 'status'
    end
    object qrytampil_retribusitgl_bayar: TDateTimeField
      FieldName = 'tgl_bayar'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrytampil_retribusibiaya_bangunan: TBCDField
      FieldName = 'biaya_bangunan'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusibiaya_bgn_jln: TBCDField
      FieldName = 'biaya_bgn_jln'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusibiaya_sempadan: TBCDField
      FieldName = 'biaya_sempadan'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusibiaya_periksa_gbr: TBCDField
      FieldName = 'biaya_periksa_gbr'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusibiaya_pengawas: TBCDField
      FieldName = 'biaya_pengawas'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusibiaya_daftar: TBCDField
      FieldName = 'biaya_daftar'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusitotal_biaya: TBCDField
      FieldName = 'total_biaya'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_retribusipembulatan_biaya: TBCDField
      FieldName = 'pembulatan_biaya'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object wdstrngfld_retribusiket_bayar: TWideStringField
      FieldName = 'ket_bayar'
      Size = 25
    end
    object qrytampil_retribusibiaya_retribusi: TBCDField
      FieldName = 'biaya_retribusi'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object wdstrngfld_retribusiket_terbit: TWideStringField
      FieldName = 'ket_terbit'
      Size = 25
    end
    object wdstrngfld_retribusilok_tanah: TWideStringField
      FieldName = 'lok_tanah'
      Size = 100
    end
  end
  object dstampil_retribusi: TDataSource
    DataSet = qrytampil_retribusi
    Left = 584
    Top = 184
  end
  object qryterbit_surat: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_terbit_surat')
    Left = 40
    Top = 216
  end
  object qrytampil_terbit_surat: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir' +
        ', b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.j' +
        'ns_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm,  a.bts_sel, a.bts_bar, '
      
        'a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retrib' +
        'usi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biay' +
        'a_periksa_gbr, d.biaya_pengawas, d.biaya_daftar, '
      
        'd.total_biaya, d.pembulatan_biaya, e.tgl_terbit from tbl_ijin_im' +
        'b a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d, tbl_terbit_' +
        'surat e where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun '
      'and d.kd_ijin=a.kd_ijin and e.kd_ijin=a.kd_ijin')
    Left = 96
    Top = 256
    object wdstrngfld_terbit_suratkd_ijin: TWideStringField
      FieldName = 'kd_ijin'
      Size = 10
    end
    object qrytampil_terbit_surattgl_ijin: TDateTimeField
      FieldName = 'tgl_ijin'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wdstrngfld_terbit_suratno_ktp: TWideStringField
      FieldName = 'no_ktp'
      Size = 25
    end
    object wdstrngfld_terbit_suratnama_pem: TWideStringField
      FieldName = 'nama_pem'
      Size = 50
    end
    object wdstrngfld_terbit_surattmp_lahir: TWideStringField
      FieldName = 'tmp_lahir'
      Size = 50
    end
    object qrytampil_terbit_surattgl_lahir: TDateTimeField
      FieldName = 'tgl_lahir'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wdstrngfld_terbit_suratpekerjaan: TWideStringField
      FieldName = 'pekerjaan'
      Size = 25
    end
    object wdstrngfld_terbit_suratalamat: TWideStringField
      FieldName = 'alamat'
      Size = 50
    end
    object wdstrngfld_terbit_suratdesa: TWideStringField
      FieldName = 'desa'
      Size = 30
    end
    object wdstrngfld_terbit_suratkode_bangun: TWideStringField
      FieldName = 'kode_bangun'
      Size = 10
    end
    object wdstrngfld_terbit_suratjns_bangunan: TWideStringField
      FieldName = 'jns_bangunan'
      Size = 50
    end
    object wdstrngfld_terbit_suratmilik_tanah: TWideStringField
      FieldName = 'milik_tanah'
      Size = 25
    end
    object wdstrngfld_terbit_suratbtk_bangun: TWideStringField
      FieldName = 'btk_bangun'
      Size = 25
    end
    object wdstrngfld_terbit_surattingkat: TWideStringField
      FieldName = 'tingkat'
      Size = 7
    end
    object wdstrngfld_terbit_suratkon_bangun: TWideStringField
      FieldName = 'kon_bangun'
    end
    object wdstrngfld_terbit_suratatap: TWideStringField
      FieldName = 'atap'
    end
    object qrytampil_terbit_suratp_bangun: TFloatField
      FieldName = 'p_bangun'
    end
    object qrytampil_terbit_suratl_bangun: TFloatField
      FieldName = 'l_bangun'
    end
    object qrytampil_terbit_suratluas: TFloatField
      FieldName = 'luas'
    end
    object wdstrngfld_terbit_suratbts_utara: TWideStringField
      FieldName = 'bts_utara'
      Size = 25
    end
    object wdstrngfld_terbit_suratbts_tim: TWideStringField
      FieldName = 'bts_tim'
      Size = 25
    end
    object wdstrngfld_terbit_suratbts_sel: TWideStringField
      FieldName = 'bts_sel'
      Size = 25
    end
    object wdstrngfld_terbit_suratbts_bar: TWideStringField
      FieldName = 'bts_bar'
      Size = 25
    end
    object wdstrngfld_terbit_suratstatus: TWideStringField
      FieldName = 'status'
    end
    object wdstrngfld_terbit_suratket_bayar: TWideStringField
      FieldName = 'ket_bayar'
      Size = 25
    end
    object wdstrngfld_terbit_suratket_terbit: TWideStringField
      FieldName = 'ket_terbit'
      Size = 25
    end
    object qrytampil_terbit_surattgl_bayar: TDateTimeField
      FieldName = 'tgl_bayar'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrytampil_terbit_suratbiaya_retribusi: TBCDField
      FieldName = 'biaya_retribusi'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_bangunan: TBCDField
      FieldName = 'biaya_bangunan'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_bgn_jln: TBCDField
      FieldName = 'biaya_bgn_jln'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_sempadan: TBCDField
      FieldName = 'biaya_sempadan'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_periksa_gbr: TBCDField
      FieldName = 'biaya_periksa_gbr'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_pengawas: TBCDField
      FieldName = 'biaya_pengawas'
      Precision = 19
    end
    object qrytampil_terbit_suratbiaya_daftar: TBCDField
      FieldName = 'biaya_daftar'
      Precision = 19
    end
    object qrytampil_terbit_surattotal_biaya: TBCDField
      FieldName = 'total_biaya'
      Precision = 19
    end
    object qrytampil_terbit_suratpembulatan_biaya: TBCDField
      FieldName = 'pembulatan_biaya'
      DisplayFormat = 'Rp #,###'
      Precision = 19
    end
    object qrytampil_terbit_surattgl_terbit: TDateTimeField
      FieldName = 'tgl_terbit'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object wdstrngfld_terbit_suratlok_tanah: TWideStringField
      FieldName = 'lok_tanah'
      Size = 100
    end
  end
  object dstampil_terbit_surat: TDataSource
    DataSet = qrytampil_terbit_surat
    Left = 112
    Top = 312
  end
  object qrytampil_lapijin: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir' +
        ', b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.j' +
        'ns_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm, a.bts_sel, a.bts_bar, a.status, '
      
        'a.ket_bayar, a.ket_terbit from tbl_ijin_imb a, tbl_pemohon b, tb' +
        'l_bangunan c where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_ba' +
        'ngun')
    Left = 352
    Top = 272
  end
  object dstampil_lapijin: TDataSource
    DataSet = qrytampil_lapijin
    Left = 400
    Top = 320
  end
  object qrytampil_lapretribusi: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir,' +
        ' b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.jn' +
        's_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm,  a.bts_sel, a.bts_bar, '
      
        'a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retrib' +
        'usi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biay' +
        'a_periksa_gbr, d.biaya_pengawas, d.biaya_daftar, '
      
        'd.total_biaya, d.pembulatan_biaya from tbl_ijin_imb a, tbl_pemoh' +
        'on b, tbl_bangunan c, tbl_retribusi d where a.no_ktp=b.no_ktp an' +
        'd a.kode_bangun=c.kode_bangun '
      'and d.kd_ijin=a.kd_ijin')
    Left = 464
    Top = 272
  end
  object ds1tampil_lapretribusi: TDataSource
    DataSet = qrytampil_lapretribusi
    Left = 496
    Top = 328
  end
  object qrytampil_lapterbitsurat: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  a.kd_ijin, a.tgl_ijin, b.no_ktp, b.nama_pem, b.tmp_lahir' +
        ', b.tgl_lahir, b.pekerjaan, b.alamat, b.desa, c.kode_bangun, c.j' +
        'ns_bangunan, '
      
        'a.milik_tanah, a.lok_tanah, a.btk_bangun, a.tingkat, a.kon_bangu' +
        'n, a.atap, a.p_bangun, a.l_bangun, a.luas, a.bts_utara, a.bts_ti' +
        'm,  a.bts_sel, a.bts_bar, '
      
        'a.status, a.ket_bayar, a.ket_terbit, d.tgl_bayar, d.biaya_retrib' +
        'usi, d.biaya_bangunan, d.biaya_bgn_jln, d.biaya_sempadan, d.biay' +
        'a_periksa_gbr, d.biaya_pengawas, d.biaya_daftar, '
      
        'd.total_biaya, d.pembulatan_biaya, e.tgl_terbit from tbl_ijin_im' +
        'b a, tbl_pemohon b, tbl_bangunan c, tbl_retribusi d, tbl_terbit_' +
        'surat e where a.no_ktp=b.no_ktp and a.kode_bangun=c.kode_bangun '
      'and d.kd_ijin=a.kd_ijin and e.kd_ijin=a.kd_ijin')
    Left = 584
    Top = 272
  end
  object dstampil_laterbitsurat: TDataSource
    DataSet = qrytampil_lapterbitsurat
    Left = 616
    Top = 328
  end
  object qryundang: TADOQuery
    Active = True
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbl_undang')
    Left = 664
    Top = 80
  end
end
