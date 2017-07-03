*&---------------------------------------------------------------------*
*& report  zeb_internal1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

report  zeb_internal1.

*standart internal tablo ve macroyu öğrenelim bugün

*type tanımlaması yaptım
types : begin of not_s_cizelgesi,
  adı   type string,
  soyad type string,
  vize  type i,
  final type i,
end of not_s_cizelgesi,
*standart internal tablomuzu tanımladık
not_t_cizelgesi type standard table of not_s_cizelgesi with default key.
*değişkenlerimi tanımladık
data : not_cizelge_listesi  type not_t_cizelgesi,
       not_cizelge          type not_s_cizelgesi.


*macro tanımlama örneği
define kayit.
  not_cizelge-adi = &1.
  not_cizelge-soyad = &2.
  not_cizelge-vize = &3.
  not_cizelge-final = &4.
  append not_cizelge to not_cizelge_listesi.
  clear not_cizelge.
end-of-definition.

*macro çağırma
kayit 'erhan' 'bİlgİn' '50' '70'.
kayit 'fatİh' 'kara' '70' '44'.

*internal tablomuzu yazdıralalım.

write :/ 'öğrenci not çizelgesi' color col_heading.
skip 1.
uline.

loop at not_cizelge_listesi into not_cizelge.
  write :/ 'öğrenci adı    : ', not_cizelge-adi,
         / 'öğrenci soyadı : ', not_cizelge-soyad,
         / 'öğrenci vizesi :', not_cizelge-vize,
         / 'öğrenci finali :', not_cizelge-final.
  skip 1.
endloop.

*clear not_cizelge_listesi.
uline.
*boş satır eklemesi
append initial line to not_cizelge_listesi.
write :/ 'boş satır eklendi' color col_heading.
skip 1.

loop at not_cizelge_listesi into not_cizelge.
  write :/ 'öğrenci adı    : ', not_cizelge-adi,
         / 'öğrenci soyadı : ', not_cizelge-soyad,
         / 'öğrenci vizesi :', not_cizelge-vize,
         / 'öğrenci finali :', not_cizelge-final.
  skip 1.
endloop.

uline.
WRITE :/ 'insert ile kayıt işlemi' COLOR COL_HEADING.
SKIP 1.
not_cizelge-adi = 'insert_adı'.
not_cizelge-soyad = 'inset_soyad'.
not_cizelge-vize = 11.
not_cizelge-final = 41.
insert not_cizelge INTO TABLE not_cizelge_listesi.
loop at not_cizelge_listesi into not_cizelge.
  write :/ 'öğrenci adı    : ', not_cizelge-adi,
         / 'öğrenci soyadı : ', not_cizelge-soyad,
         / 'öğrenci vizesi :', not_cizelge-vize,
         / 'öğrenci finali :', not_cizelge-final.
  skip 1.
endloop.

*inernal tablo sıralama işlemi

*artan biçimde sıralama
SORT NOT_CIZELGE_LISTESI by final.

*azalan biçimde sıralama
SORT not_cizelge_listesi by final DESCENDING.

*Finale göre sıralama yapıldı
WRITE  / ' Finale göre sıralama' COLOR COL_GROUP.
loop at not_cizelge_listesi into not_cizelge.
  write :/ 'öğrenci adı    : ', not_cizelge-adi,
         / 'öğrenci soyadı : ', not_cizelge-soyad,
         / 'öğrenci vizesi :', not_cizelge-vize,
         / 'öğrenci finali :', not_cizelge-final.
  skip 1.
endloop.