*&---------------------------------------------------------------------*
*& Report  ZEB_SYSTEM_ALANLARI
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_SYSTEM_ALANLARI.


write : / 'Kullan�c� ad�  :', sy-uname,
        / 'Sistem dili    :', sy-langu,
        / 'g�n�n tarihi   :', sy-datum,
        / 'yap�lan i�in ba�ar�l� olup olmad��� :', sy-subrc,
        / 'do while d�ng�s� ka� kez d�nd�      :', sy-repid,
        / 'program ad�    :', sy-uzeit,
        / 'program�n tcode:', sy-tcode,
        / 'tablo d�ng�lerinde hang tablo sat�r�n�n i�lendi�i :', sy-tabix.