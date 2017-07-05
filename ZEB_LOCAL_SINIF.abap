*&---------------------------------------------------------------------*
*& Report  ZEB_LOCAL_SINIF
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_LOCAL_SINIF.

*lcl(local class)
CLASS lcl_kitap DEFINITION.
  PUBLIC SECTION.
*Method tanımlamaları kitap_kayit,kitap_listele ve kitap_sil methodları vardır.
    METHODS :
      kitap_kayit IMPORTING iv_kitap_adi    TYPE string
                            iv_kitap_yazar  TYPE string
                            iv_kitap_adedi  TYPE string,
      kitap_listele,
      kitap_sil IMPORTING iv_kitap_adi TYPE string.
   PRIVATE SECTION.
*Bu kısımda standart internal tablo oluşturulmuştur.
      TYPES : BEGIN OF kitap_s,
          kitap_adi   TYPE string,
          kitap_yazar TYPE string,
          kitap_adedi TYPE i,
        END OF kitap_s,
        kitap_t TYPE STANDARD TABLE OF kitap_s WITH DEFAULT KEY.

        data : mv       type kitap_s,
               mv_liste type kitap_t.

ENDCLASS.

**bu kısımda classa ait methodlar tanımlanmıştır.
class lcl_kitap IMPLEMENTATION.
  METHOD KITAP_KAYIT.
    mv-kitap_adi    = iv_kitap_adi.
    mv-kitap_yazar = iv_kitap_yazar.
    mv-kitap_adedi  = iv_kitap_adedi.
    APPEND mv to mv_liste.
    clear mv.
  ENDMETHOD.

  method kitap_listele.
    loop at mv_liste into mv.
      WRITE : / 'Kitap adı      : ', mv-kitap_adi,
              / 'Kitap yazari   : ', mv-kitap_yazar,
              / 'Kitap adedi    : ', mv-kitap_adedi.
      skip 1.
    ENDLOOP.
  ENDMETHOD.

  METHOD KITAP_SIL.
    delete mv_liste where kitap_adi = iv_kitap_adi.
    if sy-subrc = 0.
      WRITE :/ 'Kitap başarılı bir şekilde silindi' COLOR COL_GROUP.
      skip 1.
      loop at mv_liste into mv.
        WRITE : / 'Kitap adı      : ', mv-kitap_adi,
                / 'Kitap yazari   : ', mv-kitap_yazar,
                / 'Kitap adedi    : ', mv-kitap_adedi.
      ENDLOOP.
    ELSE.
      WRITE :/ iv_kitap_adi ,' adlı kayıt bulunamadı veya yanlış yazdınız'  COLOR COL_GROUP.
      skip 1.
    ENDIF.

  ENDMETHOD.
ENDCLASS.

data lo_nesne_kitap TYPE REF TO lcl_kitap.
*class objemizi oluşturalım.

START-OF-SELECTION.

create object lo_nesne_kitap.

define kayit.

lo_nesne_kitap->kitap_kayit( EXPORTING  iv_kitap_adi    = &1
                                        iv_kitap_yazar  = &2
                                        iv_kitap_adedi  = &3).

end-of-definition.


kayit 'sap' 'alfa' '100'.
kayit 'abap' 'yazilim' '50'.
kayit 'basis' 'alfa' '61'.


lo_nesne_kitap->kitap_listele( ).

define sil.

lo_nesne_kitap->kitap_sil( EXPORTING iv_kitap_adi = &1).

end-of-definition.

sil 'basis'.
sil 'abapci'.

end-OF-SELECTION.