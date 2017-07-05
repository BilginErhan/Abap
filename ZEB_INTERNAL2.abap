*&---------------------------------------------------------------------*
*& Report  ZEB_INTERNAL2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_INTERNAL2.


*sorted internal tablolara bakalým

TYPES : BEGIN OF personel_s,
        sira    TYPE i,
        ad      TYPE string,
        soyad   TYPE string,
        tel     TYPE c LENGTH 11,
  END OF personel_s,

  personel_t TYPE SORTED TABLE OF personel_s WITH NON-UNIQUE KEY sira.

data : personel         TYPE personel_s,
       personel_listesi TYPE personel_t.

define kayit.
  personel-SIRA     = &1.
  personel-AD       = &2.
  personel-SOYAD    = &3.
  personel-TEL      = &4.
  insert personel into table personel_listesi.
  clear personel.
end-of-definition.

kayit  3 'alfa' 'yazilim' '07070707'.
kayit  1 'adem' 'bilgin' '1313213'.
kayit  2 'faruk' 'fazýl' '45151515'.


WRITE :/ 'Sorted tablo yazdýralým' COLOR COL_GROUP.
skip 1.
LOOP at personel_listesi INTO personel.
  write : / 'Sirasi : ',personel-sira,
          / 'Ad     : ',personel-ad,
          / 'Soyad  : ',personel-soyad,
          / 'Tel    : ',personel-tel.
  skip 1.
ENDLOOP.

personel-sira = 1.
personel-ad = 'erhan'.
personel-soyad = 'bil'.
personel-tel = '1111111'.

MODIFY TABLE PERSONEL_LISTESI FROM personel.
WRITE :/ 'Modify iþlemi' COLOR COL_GROUP.
skip 1.

LOOP at personel_listesi INTO personel.
  write : / 'Sirasi : ',personel-sira,
          / 'Ad     : ',personel-ad,
          / 'Soyad  : ',personel-soyad,
          / 'Tel    : ',personel-tel.
  skip 1.
ENDLOOP.

WRITE :/ 'Internal tablo alfa yazýlým satýrýnýn silinmesi' COLOR COL_GROUP.

delete PERSONEL_LISTESI where ad = 'alfa'.

LOOP at personel_listesi INTO personel.
  write : / 'Sirasi : ',personel-sira,
          / 'Ad     : ',personel-ad,
          / 'Soyad  : ',personel-soyad,
          / 'Tel    : ',personel-tel.
  skip 1.
ENDLOOP.