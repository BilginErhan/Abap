*&---------------------------------------------------------------------*
*& Report  ZEB_SYSTEM_ALANLARI
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_SYSTEM_ALANLARI.


write : / 'Kullanýcý adý  :', sy-uname,
        / 'Sistem dili    :', sy-langu,
        / 'günün tarihi   :', sy-datum,
        / 'yapýlan iþin baþarýlý olup olmadýðý :', sy-subrc,
        / 'do while döngüsü kaç kez döndü      :', sy-repid,
        / 'program adý    :', sy-uzeit,
        / 'programýn tcode:', sy-tcode,
        / 'tablo döngülerinde hang tablo satýrýnýn iþlendiði :', sy-tabix.