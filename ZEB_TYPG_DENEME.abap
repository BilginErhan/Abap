*&---------------------------------------------------------------------*
*& Report  ZEB_TYPG_DENEME
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_TYPG_DENEME.

type-pools ZTYPG.

data :  isim    type ztypg_isim     VALUE 'erhan',
        soyisim type ztypg_soyisim  VALUE 'bilgin',
        tel     type ztypg_tel      VALUE '12345678912',
        adres   type ztypg_adres    VALUE 'turgay yolu caddesi',
        yas     type ztypg_yas      VALUE 22.

skip 1.
uline.
skip 1.

write /'Tip havuzu ile degisken tanýmlama ve yazdýrma'.

write : / 'isim     :', isim,
        / 'soyisim  :', SOYISIM,
        / 'tel      :', tel,
        / 'adres    :', adres,
        / 'yas      :', yas.