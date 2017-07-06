*&---------------------------------------------------------------------*
*& Report  ZEB_LOCAL_SINIF1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_LOCAL_SINIF1.



class lcl_araba DEFINITION.
"class tanımlaması yapıldı
public section.
"public methodlar tanımlandı
  methods:
        constructor  importing  iv_araba_rengi      type string
                                iv_araba_marka      type string
                                iv_araba_kapiSayisi type i
                                iv_araba_yakit      type string
                                iv_araba_maxHiz     type i,

          ARABAOZELLIKLERIYAZDIR,
          HiziArttir  importing iv_araba_hizi type i,
          HiziDusur   importing iv_araba_hizi type i,
          VitesArttir,
          VitesDusur.
  private section.
    data : araba_rengi      type string,
           araba_marka      type string,
           araba_kapiSayisi type i,
           araba_yakit      type string,
           araba_maxHiz     type i,
           araba_hizi       type i VALUE 0,
           araba_vites      type i value 1.
  endclass.

"classın method tanımlamaları yapıldı.
class lcl_araba implementation.

    method constructor.
      araba_rengi       = iv_araba_rengi.
      araba_marka       = iv_araba_marka.
      araba_kapiSayisi  = iv_araba_kapiSayisi.
      araba_yakit       = iv_araba_yakit.
      araba_maxHiz      = iv_araba_maxHiz.
    endmethod.

    method ARABAOZELLIKLERIYAZDIR.
      write: / 'Araba Rengi :'        , araba_rengi,
             / 'Araba Marka :'        , araba_marka,
             / 'Araba Kapı Sayısı :'  , araba_kapiSayisi,
             / 'Araba Yakıt       :'  , araba_yakit,
             / 'Araba Max Hiz     :'  , araba_maxhiz,
             / 'Araba Suanki Hizi :'  , araba_hizi,
             / 'Araba Şuan Vitesi :'  , araba_vites.
    endmethod.

    method hiziarttir.
      araba_hizi = araba_hizi + iv_araba_hizi.
    endmethod.

    method hizidusur.
      araba_hizi = araba_hizi - iv_araba_hizi.
    endmethod.

    method vitesArttir.
      araba_vites = araba_vites + 1.
    endmethod.

    method vitesDusur.
      araba_vites = araba_vites - 1.
    endmethod.

  endclass.

  data : araba1 type ref to lcl_araba,
         araba2 type ref to lcl_araba.

start-of-selection.

  create object ARABA1
    exporting
      IV_ARABA_RENGI      = 'Kırmızı'
      IV_ARABA_MARKA      = 'Honda'
      IV_ARABA_KAPISAYISI = 2
      IV_ARABA_YAKIT      = 'Benzin'
      IV_ARABA_MAXHIZ     = 340.

  create object ARABA2
    exporting
      IV_ARABA_RENGI      = 'Mavi'
      IV_ARABA_MARKA      = 'Opel'
      IV_ARABA_KAPISAYISI = 4
      IV_ARABA_YAKIT      = 'Dizel'
      IV_ARABA_MAXHIZ     = 240.

define yazdir.
  Write :/'Araba1 in özellikleri ' COLOR COL_GROUP.
  skip 1.

  ARABA1->ARABAOZELLIKLERIYAZDIR( ).

  uline.
  WRITE :/'Araba2 nin özellikleri' COLOR COL_GROUP.
  ARABA2->ARABAOZELLIKLERIYAZDIR( ).
end-of-definition.

yazdir.

  ARABA1->HIZIARTTIR( 100 ).
  ARABA2->HIZIARTTIR( 150 ).
  DO 3 TIMES.
    araba1->VITESARTTIR( ).
    araba1->VITESARTTIR( ).
    araba2->VITESARTTIR( ).
  ENDDO.

yazdir.

araba1->HIZIDUSUR( 50 ).
araba2->HIZIDUSUR( 75 ).

DO 2 TIMES.
  araba1->VITESDUSUR( ).
  araba2->VITESDUSUR( ).
ENDDO.

yazdir.