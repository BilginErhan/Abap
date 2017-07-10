*&---------------------------------------------------------------------*
*& Report  ZEB_DDIC_ORNEK
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_DDIC_ORNEK.

"gs global structer
"gt global table

"öðrenci kayýt structer ve listesi
data : gs_ogrenci_kayit type zeb_ogrenci_kayit,
       gt_ogrenci_kayit type zeb_ogrenci_kayit_liste.

"ders not structer ve listesi
data : gs_ders_not type zeb_ogrenci_not,
       gt_ders_not type zogr_not_liste.

data : gt_notlar type zogr_not_liste,
       gv_nott  like line of gt_notlar,
       gv_not1 like LINE OF gv_nott-notlar.


data : gt_telefon_no type zeb_ogrenci_telno_liste,
       gv_tel_no     LIKE LINE OF  gt_telefon_no,
       gv_not        type i.

gs_ogrenci_kayit-isim = 'erhan'.
gs_ogrenci_kayit-soyisim = 'bilgin'.
gs_ogrenci_kayit-bolum = 'bilgisayar'.
gs_ogrenci_kayit-adres-SEHIR = 'istanbul'.
gs_ogrenci_kayit-adres-SOKAK = 'turgay'.
gs_ogrenci_kayit-adres-EVNO = 13.

gs_ders_not-DERS_ADI = 'Yazýlým'.
append 50 to gs_ders_not-notlar.
append 70 to gs_ders_not-notlar.

insert gs_ders_not into table gt_ders_not.
clear gs_ders_not.

gs_ders_not-ders_adi = 'Algoritma'.
append 140 to gs_ders_not-NOTLAR.
append 32 to gs_ders_not-notlar.

insert gs_ders_not into table gt_ders_not.

gs_ogrenci_kayit-notlar = gt_ders_not.



gv_tel_no = '123123'.
insert gv_tel_no into table gt_telefon_no.

gv_tel_no = '123515'.
insert gv_tel_no into table gt_telefon_no.

gs_ogrenci_kayit-telefon = gt_telefon_no.

insert gs_ogrenci_kayit into table gt_ogrenci_kayit.

clear gs_ogrenci_kayit.

LOOP AT gt_ogrenci_kayit into gs_ogrenci_kayit.

  write / 'Ogernci bilgileri'.

write :/ 'Isim', at 10 'Soyisim', at 10 'Bolum',at 10 'sehir', at 10 'sokak',at 10'evno', at 10  'telefon', at 10 'notlar'.
skip 1.
write :/ gs_ogrenci_kayit-isim    under 'Isim',
         gs_ogrenci_kayit-soyisim ,
         gs_ogrenci_kayit-bolum   ,
         gs_ogrenci_kayit-adres-SEHIR ,
         gs_ogrenci_kayit-adres-sokak ,
         gs_ogrenci_kayit-adres-evno  .
         "gs_ogrenci_kayit-telefon
         "gs_ogrenci_kayit-NOTLAR  under 'notlar'.
  LOOP AT gs_ogrenci_kayit-telefon into GV_TEL_NO.
    write /: GV_TEL_NO,sy-tabix.
  ENDLOOP.

  write /: gs_ogrenci_kayit-adres-sokak,
            gs_ogrenci_kayit-adres-sehir,
            gs_ogrenci_kayit-adres-evno.
  LOOP AT gs_ogrenci_kayit-notlar into gv_nott.
      write /: 'ders_adi : ',gv_nott-DERS_ADI.
        LOOP AT gv_nott-NOTLAR into gv_not1.
          write /:'notlar : ',gv_not1.
        ENDLOOP.
  ENDLOOP.
ENDLOOP.