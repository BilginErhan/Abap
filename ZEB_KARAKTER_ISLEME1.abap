*&---------------------------------------------------------------------*
*& Report  ZEB_KARAKTER_ISLEME1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_KARAKTER_ISLEME1.

data : gv_degisken1 TYPE c LENGTH 10 VALUE 'erhan',
       gv_degisken2 TYPE c LENGTH 100 VALUE 'h'.

*search işleminde sy-fdpos sistem değişkeni harfin nerden başladığı indisini tutar.
WRITE :/'SERACH ISLEMI' color COL_HEADING.
SEARCH GV_DEGISKEN1 FOR GV_DEGISKEN2.

WRITE :/ 'Aranan harf ', sy-FDPOS,' indisinde bulunuyor'.
skip 1.
data : gv_degisken0 TYPE c LENGTH 100 VALUE 'q'.

WRITE :/'REPLACE ISLEMI' color COL_HEADING.
REPLACE 'e' WITH GV_DEGISKEN0 INTO GV_DEGISKEN1.
WRITE :/ GV_DEGISKEN1 , 'yeni degeri'.
skip 1.

WRITE :/'TRANSLATE ISLEMI' color COL_HEADING.
TRANSLATE GV_DEGISKEN1 TO UPPER CASE.

WRITE :/'yazı büyütüldü ', GV_DEGISKEN1.
skip 1.

WRITE :/'TRANSLATE ISLEMI' color COL_HEADING.
TRANSLATE GV_DEGISKEN1 TO LOWER CASE.

WRITE :/'yazı kücültüldü', GV_DEGISKEN1.
skip 1.


*condanse içinde bulunan boşlukları siler

gv_degisken0 = 'erhan bilgin'.


WRITE :/'CONDENSE ISLEMI' color COL_HEADING.

WRITE :/'Condense öncesi :', GV_DEGISKEN0.

CONDENSE GV_DEGISKEN0 NO-GAPS.

WRITE :/ 'Condense sonrası :',GV_DEGISKEN0.

*concatenate birden fazla değişkeni birleştirmeye yarar.
gv_degisken1 = 'alfa'.
WRITE :/'CONCATENATE ISLEMI' color COL_HEADING.
CONCATENATE GV_DEGISKEN0 GV_DEGISKEN1 INTO GV_DEGISKEN2.

WRITE :/'CONCATENATE ile birşelen değişkenler :',GV_DEGISKEN2.