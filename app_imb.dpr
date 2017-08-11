program app_imb;

uses
  Forms,
  u_menu in 'u_menu.pas' {f_menu},
  u_peng_salindata in 'u_peng_salindata.pas' {f_peng_salindata},
  u_dm in 'u_dm.pas' {dm: TDataModule},
  u_peng_gantisandi in 'u_peng_gantisandi.pas' {f_peng_gantisandi},
  u_peng_jawab in 'u_peng_jawab.pas' {f_peng_jawab},
  u_mast_penduduk in 'u_mast_penduduk.pas' {f_mast_penduduk},
  u_mast_bangunan in 'u_mast_bangunan.pas' {f_mast_bangunan},
  u_report_bangunan in 'u_report_bangunan.pas' {report_bangunan: TQuickRep},
  u_report_penduduk in 'u_report_penduduk.pas' {report_pemohon: TQuickRep},
  u_trans_ijin_depan in 'u_trans_ijin_depan.pas' {f_trans_imb_depan},
  u_trans_ijin_belakang in 'u_trans_ijin_belakang.pas' {f_trans_imb_belakang},
  u_data_pemohon in 'u_data_pemohon.pas' {f_bantu_pemohon},
  u_trans_retribusi in 'u_trans_retribusi.pas' {f_trans_retribusi},
  u_bantu_ijin_imb in 'u_bantu_ijin_imb.pas' {f_bantu_ijin_imb},
  u_trans_retribusi_depan in 'u_trans_retribusi_depan.pas' {f_trans_retribusi_depan},
  u_trans_terbit_surat in 'u_trans_terbit_surat.pas' {f_trans_terbit_surat},
  u_lap_ijin_imb in 'u_lap_ijin_imb.pas' {f_lap_ijinimb},
  u_bantu_lap in 'u_bantu_lap.pas' {f_bantu_lap},
  u_report_ijin_imb in 'u_report_ijin_imb.pas' {report_ijinimb: TQuickRep},
  u_report_bayar_retribusi in 'u_report_bayar_retribusi.pas' {report_bayar_retribusi: TQuickRep},
  u_report_terbit_surat in 'u_report_terbit_surat.pas' {report_terbit_surat: TQuickRep},
  u_srt_ijin in 'u_srt_ijin.pas' {surat_ijin: TQuickRep},
  u_surat_rincian_reribusi in 'u_surat_rincian_reribusi.pas' {surat_rincian_retribusi: TQuickRep},
  u_surat_terbit in 'u_surat_terbit.pas' {srt_terbit_ijin: TQuickRep},
  u_login in 'u_login.pas' {f_login};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tf_login, f_login);
  Application.CreateForm(Tf_menu, f_menu);
  Application.CreateForm(Tf_peng_salindata, f_peng_salindata);
  Application.CreateForm(Tf_peng_gantisandi, f_peng_gantisandi);
  Application.CreateForm(Tf_peng_jawab, f_peng_jawab);
  Application.CreateForm(Tf_mast_penduduk, f_mast_penduduk);
  Application.CreateForm(Tf_mast_bangunan, f_mast_bangunan);
  Application.CreateForm(Treport_bangunan, report_bangunan);
  Application.CreateForm(Treport_pemohon, report_pemohon);
  Application.CreateForm(Tf_trans_imb_depan, f_trans_imb_depan);
  Application.CreateForm(Tf_trans_imb_belakang, f_trans_imb_belakang);
  Application.CreateForm(Tf_bantu_pemohon, f_bantu_pemohon);
  Application.CreateForm(Tf_trans_retribusi, f_trans_retribusi);
  Application.CreateForm(Tf_bantu_ijin_imb, f_bantu_ijin_imb);
  Application.CreateForm(Tf_trans_retribusi_depan, f_trans_retribusi_depan);
  Application.CreateForm(Tf_trans_terbit_surat, f_trans_terbit_surat);
  Application.CreateForm(Tf_lap_ijinimb, f_lap_ijinimb);
  Application.CreateForm(Tf_bantu_lap, f_bantu_lap);
  Application.CreateForm(Treport_ijinimb, report_ijinimb);
  Application.CreateForm(Treport_bayar_retribusi, report_bayar_retribusi);
  Application.CreateForm(Treport_terbit_surat, report_terbit_surat);
  Application.CreateForm(Tsurat_ijin, surat_ijin);
  Application.CreateForm(Tsurat_rincian_retribusi, surat_rincian_retribusi);
  Application.CreateForm(Tsrt_terbit_ijin, srt_terbit_ijin);
  Application.Run;
end.
