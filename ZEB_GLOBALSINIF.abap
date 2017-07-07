*&---------------------------------------------------------------------*
*& Report  ZEB_GLOBALSINIF
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_GLOBALSINIF.

data global_sinif type ref to ZEB_CALISAN.

START-OF-SELECTION.

create object GLOBAL_SINIF
  exporting
    IV_ISIM    = 'Erhan'
    IV_SOYISIM = 'Bilgin'.
  .

global_sinif->MAAS_HESAPLA( 10 ).
global_sinif->YAZDIR( ).
global_sinif->MAAS_HESAPLA( 5 ).
GLOBAL_SINIF->YAZDIR( ).