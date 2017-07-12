*&---------------------------------------------------------------------*
*& Report  ZEB_SCREEN_CALISMA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_SCREEN_CALISMA.

tables : ZEB_MSF_KULLANIC,ZEB_MSF_PERSONEL,ZEB_MSF_MASRAF,ZEB_MSF_SORUMLU.

data : personel like ZEB_MSF_PERSONEL.

personel-PID = 1.
personel-PADI = 'Fırat'.
personel-PSOYADI = 'bilgin'.
personel-PUNVAN = 'hebele danışman'.
personel-PPOZISYON = 'Y'.
personel-PMAIL = 'blgn6161@gmail.com'.
personel-PDTARIH = '19950101'.
personel-PADRES = 'turgay yolu caddesi vs.vs.'.
personel-PCINSIYET = 'Erkek'.
personel-PTELEFON = '01231231212'.

"insert ZEB_MSF_PERSONEL from personel.

IF sy-subrc eq 0.
  write :/'basarili!!'.
ELSE.
  WRITE :/'hata'.
ENDIF.

"DELETE FROM ZEB_MSF_PERSONEL.


data : kullanici type ZEB_MSF_KULLANIC.

kullanici-KULLANICIID = 1.
kullanici-KULLANICIADI = 'Erhan'.
kullanici-KULLANICISIFRE = '12345'.
kullanici-PID = 1.

"insert ZEB_MSF_KULLANIC from KULLANICI.


data: begin of innerjoin,

  kullaniciid     type zeb_msf_kullanic-kullaniciid,
  kullaniciadi    type zeb_msf_kullanic-kullaniciadi,
  kullanicisifre  type zeb_msf_kullanic-kullanicisifre,
  pid             type zeb_msf_personel-pid,
  padi            type zeb_msf_personel-padi,
  psoyadi         type zeb_msf_personel-psoyadi,
  punvan          type zeb_msf_personel-punvan,
  ppozisyon       type zeb_msf_personel-ppozisyon,
  pmail           type zeb_msf_personel-pmail,
  pdtarih         type zeb_msf_personel-pdtarih,
  padres          type zeb_msf_personel-padres,
  pcinsiyet       type zeb_msf_personel-pcinsiyet,
  ptelefon        type zeb_msf_personel-ptelefon,
end of innerjoin.


data internaltablo like STANDARD TABLE OF innerjoin.


select * into CORRESPONDING FIELDS OF TABLE internaltablo
  from ZEB_MSF_KULLANIC as k inner join ZEB_MSF_PERSONEL as p on k~pid = p~pid.


  LOOP AT internaltablo into innerjoin.
      write innerjoin-PADI.
  ENDLOOP.

"CALL SCREEN 0100.

INCLUDE ZEB_SCREEN_CALISMA_USER_COMI01.

INCLUDE ZEB_SCREEN_CALISMA_STATUS_0O01.