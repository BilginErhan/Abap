*&---------------------------------------------------------------------*
*& report  zeb_veri_turleri
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

report  zeb_veri_turleri.

*tam veri türleri

data : gv_tarih           type d       value '20120406',
       gv_zaman           type t       value '083243',
       gv_tamsayi         type i       value 678,
       gv_ondalikli       type f       value '23.56',
       gv_karakter        type string  value 'abap veri turleri',
       gv_bit_dizisi      type xstring value '0009ef'.


*tam olmayan veritürleri

data : gv_karakter1           type c length 5 value 'abcde',
       gv_numerik_karakter    type n LENGTH 6 VALUE '063000',
       gv_bit_dizi            type x value IS INITIAL,
       gv_ondalikli_p         type p LENGTH 4 DECIMALS 3 VALUE '908.561'.

WRITE :/'tam veri türleri ile tanýmlanan degiskenler' color COL_HEADING.
skip 1.
uline.
skip 1.

WRITE : / 'gv_tarih        :', GV_TARIH,
        / 'gv_zaman        :', GV_ZAMAN,
        / 'gv_tamsayi      :', GV_TAMSAYI,
        / 'gv_ondalikli    :', GV_ONDALIKLI,
        / 'gv_karakter_diz :', GV_KARAKTER,
        / 'gv_bit_dizisi   :', GV_BIT_DIZISI.

skip 4.

write / 'Tam olmayan veri türleri ile tanýmlanan degiskenler' color COL_NEGATIVE.

skip 1.
uline.
skip 1.

write : / 'gv_karakter      :', GV_KARAKTER1,
        / 'gv_numerik_karak :', GV_NUMERIK_KARAKTER,
        / 'gv_bit_dizisi    :', GV_BIT_DIZI,
        / 'gv_ondalikli     :', GV_ONDALIKLI.

types : gty_faiz    type p LENGTH 4 DECIMALS 3,
        gty_posta   type n LENGTH 5.

data : gv_posta type GTY_POSTA VALUE '12345',
       gv_faiz  TYPE GTY_FAIZ VALUE '1.457'.

skip 1.

WRITE : / 'Özel tip tanýmlama' color COL_KEY.

uline.

write : / 'gv_posta   :', GV_POSTA,
        / 'gv_faiz    :', GV_FAIZ.