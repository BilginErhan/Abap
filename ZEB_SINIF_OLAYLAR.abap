*&---------------------------------------------------------------------*
*& Report  ZEB_SINIF_OLAYLAR
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_SINIF_OLAYLAR.

class lcl_yonetici definition.

  public section.
    methods: constructor importing  iv_isim     type string
                                    iv_soyisim  type string,

             uretimi_kontrol_et importing iv_uretim_parca_sayisi type i.

    events toplantiya_gelin   exporting value(ev_isim)            type string
                                        value(ev_soyisim)         type string
                                        value(ev_uretim_miktari)  type i.
  private section.
    data :  isim      type string,
            soyisim   type string.

endclass.

class lcl_yonetici implementation.
  method constructor.
    isim    = iv_isim.
    soyisim = iv_soyisim.
  endmethod.

  method uretimi_kontrol_et.
    if iv_uretim_parca_sayisi < 5000.
     raise event toplantiya_gelin
            exporting ev_isim           = isim
                      ev_soyisim        = soyisim
                      ev_uretim_miktari = iv_uretim_parca_sayisi.
    endif.
  endmethod.
endclass.

"-----------------------------

class lcl_muhendis definition.
  public section.
    methods: constructor importing iv_isim    type string
                                   iv_soyisim type string,

             toplanti_cagrisi_cevap   for event toplantiya_gelin of lcl_yonetici importing ev_isim
                                                                                           ev_soyisim
                                                                                           ev_uretim_miktari.
  private section.
    data : mv_isim    type string,
           mv_soyisim type string.
endclass.

class lcl_muhendis implementation.
  method toplanti_cagrisi_cevap.
    skip 1.
    write : / '-->Uretim miktari', ev_uretim_miktari,
            / '-->Yönetici      ', ev_isim,ev_soyisim,'toplantiya cagirdi',
            / 'Muhendis ', mv_isim,mv_soyisim     .
  endmethod.

  method constructor.
    mv_isim = iv_isim.
    mv_soyisim = iv_soyisim.
  endmethod.

endclass.


data :  go_yonetici   type ref to lcl_yonetici,
        go_muhendis1  type ref to lcl_muhendis,
        go_muhendis2  type ref to lcl_muhendis.

START-OF-SELECTION.

create object GO_YONETICI
  exporting
    IV_ISIM    = 'Murat'
    IV_SOYISIM = 'Bir'
  .

create object GO_MUHENDIS1
  exporting
    IV_ISIM    = 'Ahmet'
    IV_SOYISIM = 'Bir'
  .

create object GO_MUHENDIS2
  exporting
    IV_ISIM    = 'Ayse'
    IV_SOYISIM = 'Yildiz'
  .

set handler GO_MUHENDIS1->TOPLANTI_CAGRISI_CEVAP for GO_YONETICI.
set handler GO_MUHENDIS2->TOPLANTI_CAGRISI_CEVAP for GO_YONETICI.
"Sorumlu nesneler tanýmlandýr

"12000>5000 olduðundan olay oluþturmaz
GO_YONETICI->URETIMI_KONTROL_ET( 12000 ).


"4000<5000 olduðu için olay eventi çalýþýr ve go_muhendis1 ve go_muhendis2 for event
"deki toplantý caðrýsýna cevap verir
GO_YONETICI->URETIMI_KONTROL_ET( 4000 ).