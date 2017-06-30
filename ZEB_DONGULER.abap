*&---------------------------------------------------------------------*
*& Report  ZEB_DONGULER
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_DONGULER.

data gv_isim type c LENGTH 10 VALUE 'erhan'.

do 5 TIMES.
  WRITE / gv_isim.
ENDDO.

skip 2.

do.
  WRITE / gv_isim.
  IF gv_isim = 'erhan1'.
    exit.
  ENDIF.
  gv_isim = 'erhan1'.
ENDDO.

data gv_sayi type i VALUE 2.

while gv_sayi < 100.
  gv_sayi = gv_sayi * 2.
  write / gv_sayi.
ENDWHILE.