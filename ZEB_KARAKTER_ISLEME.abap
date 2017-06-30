*&---------------------------------------------------------------------*
*& Report  ZEB_KARAKTER_ISLEME
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_KARAKTER_ISLEME.

data : gv_sayi type n LENGTH 3 VALUE '213',
       gv_yazi type c LENGTH 10 VALUE 'erhanbil',
       gv_deg1 TYPE string,
       gv_deg2 TYPE string.

IF gv_sayi CO '123456789'.
  WRITE : / gv_sayi,' sayýsý 123456789 sayýsýndaki rakamlardan oluþuyor'.
ENDIF.

skip 1.

IF gv_sayi CN '58713587'.
  WRITE: / gv_sayi,' sayýsý 58713587 sayýsýndanki rakamlardan oluþmuyor'..
ENDIF.

skip 1.

gv_deg1 = 'ALFAYAZILIM'.
gv_deg2 = 'YL'.

IF gv_deg1 CA gv_deg2.
  WRITE :/ gv_deg1, gv_deg2 , 'den en az birini içerir'.
ENDIF.

skip 1.

gv_deg2 = 'erhan'.

IF gv_deg1 NA gv_deg2.
  WRITE :/ gv_deg1, gv_deg2 , 'den hiç birini içermiyor'.
ENDIF.

skip 1.

gv_deg2 = 'YAZILIM'.

IF gv_deg1 CS gv_deg2.
  WRITE :/ gv_deg1, gv_deg2 , 'içeriyor var'.
ENDIF.

skip 1.

gv_deg2 = 'MUHENDIS'.

IF gv_deg1 NS gv_deg2.
  WRITE :/ gv_deg1,gv_deg2, 'içermiyor'.
ENDIF.

skip 1.

gv_deg2 = '*FAYAZ*'.

IF gv_deg1 CP gv_deg2.
  WRITE :/ gv_deg1,gv_deg2, 'KAPSAR'.
ENDIF.

skip 1.

gv_deg2 = '*FAYAZ'.

IF gv_deg1 NP gv_deg2.
  WRITE :/ gv_deg1,gv_deg2, 'KAPSAMAZ'.
ENDIF.

skip 1.