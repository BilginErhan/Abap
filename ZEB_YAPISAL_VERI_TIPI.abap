*&---------------------------------------------------------------------*
*& Report  ZEB_YAPISAL_VERI_TIPI
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_YAPISAL_VERI_TIPI.


TYPES : BEGIN OF adres,
       sokak    type c LENGTH 10,
       cadde    type c LENGTH 20,
       mahalle  type c LENGTH 30,
       no       type c LENGTH 3,
END OF adres.

DATA : BEGIN OF calisan,
      isim      TYPE c LENGTH 30,
      soyisim   type c LENGTH 30,
      yas       TYPE i,
      tel       type c LENGTH 11,
      adresi     type adres,
END OF calisan.

CALISAN-ISIM    = 'erhan'.
CALISAN-soyisim = 'bilgin'.
CALISAN-YAS     = 22.
CALISAN-tel     = '12345678912'.

CALISAN-ADRESI-CADDE = '1231'.
CALISAN-ADRESI-SOKAK = '2312'.
CALISAN-ADRESI-MAHALLE = '132'.
CALISAN-ADRESI-no = '123'.

WRITE :/ 'calisan isim    :',CALISAN-ISIM,
       / 'calisan soyisim :',CALISAN-SOYISIM,
       / 'calisan yas     :',CALISAN-YAS,
       / 'calisan tel     :',CALISAN-TEL,
       / 'cadde           :',CALISAN-ADRESI-CADDE,
       / 'sokak           :',CALISAN-ADRESI-SOKAK,
       / 'mahalle         :',CALISAN-ADRESI-MAHALLE,
       / 'no              :',CALISAN-ADRESI-NO.