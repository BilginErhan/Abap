*&---------------------------------------------------------------------*
*& Report  ZEB_FUNCTIONGROUP_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_FUNCTIONGROUP_TEST.


PARAMETERS :
  pa_sayi TYPE i,
  pa_op TYPE string.

data gv_sonuc TYPE f.
gv_sonuc = pa_sayi.
case pa_op.

  WHEN '!'.
    CALL FUNCTION 'ZEB_FAKTORIYEL_HESAPLAMA'
      EXPORTING
        IV_SAYI = pa_sayi
      IMPORTING
        EV_SONUC = gv_sonuc
      EXCEPTIONS
        sonuc_hesaplanamadi = 1
        others = 2.
    WRITE : /'Faktoriyel sonucu :', gv_sonuc.

  WHEN 'S'.
    CALL FUNCTION 'ZEB_KAREKOK_ALMA'
     CHANGING
       CV_SAYI = gv_sonuc
     EXCEPTIONS
       hata = 1
       others = 2.
    WRITE : /'Karekok sonucu :', gv_sonuc.

ENDCASE.