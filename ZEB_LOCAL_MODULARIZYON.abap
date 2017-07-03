*&---------------------------------------------------------------------*
*& Report  ZEB_LOCAL_MODULARIZYON
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_LOCAL_MODULARIZYON.

*TARİH VE SAAT YAZDIRMA

perform tarih_zaman.
perform sistem.
perform tarih_zaman.
perform sistem.

data : gv_sayi1 TYPE i VALUE 2,
       gv_sayi2 TYPE i VALUE 3,
       gv_sayi3 TYPE i VALUE 4.

skip 1.

WRITE : / 'Fonksiyona yollanmadan önce .' COLOR COL_GROUP,
        / 'gv_sayi1 : ', gv_sayi1,
        / 'gv_sayi2 : ', GV_SAYI2,
        / 'gv_sayi3 : ', GV_SAYI3.


PERFORM sayilarin_karesi  USING     gv_sayi1
                          CHANGING  gv_sayi2
                                    gv_sayi3.
skip 1.

WRITE :/ 'Fonksiyona yollandıktan sonra .' COLOR COL_GROUP,
        / 'gv_sayi1 : ', GV_SAYI1,
        / 'gv_sayi2 : ', GV_SAYI2,
        / 'gv_sayi3 : ', GV_SAYI3.


form sayilarin_karesi USING    VALUE(gv_sayi1) type i
                      CHANGING VALUE(gv_sayi2) type i
                                     gv_sayi3  TYPE i.


  gv_sayi1 = 12.
  gv_sayi2 = 10.
  gv_sayi3 = 15.

ENDFORM.

form tarih_zaman.
  WRITE : / 'Tarih :', sy-datum,
          / 'Zaman :', sy-uzeit.
endform.

form sistem.
  WRITE : /'Sistem kullanıcısı ', sy-uname COLOR COL_GROUP.
endform.