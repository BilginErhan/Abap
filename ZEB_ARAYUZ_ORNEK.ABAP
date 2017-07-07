*&---------------------------------------------------------------------*
*& Report  ZEB_ARAYUZ_ORNEK
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_ARAYUZ_ORNEK.

interface arayuz.
  methods mesaj.
endinterface.


class sayi definition.
  public section.
    interfaces arayuz.
    methods sayi_ekle.
  private section.
    data tam_sayi type i.
endclass.

class sayi implementation.
  method arayuz~mesaj.
    write :/'The number is',tam_sayi.
  endmethod.

  method sayi_ekle.
    add 7 to tam_sayi.
  endmethod.
endclass.

class surucu definition.
  public section.
    interfaces arayuz.
    aliases mesaj for arayuz~mesaj.
    methods hiz.
  private section.
    data tekerlek type i.
endclass.

class surucu implementation.
  method mesaj.
    write :/'Total number of wheel is',tekerlek.
  endmethod.

  method hiz.
    add 4 to tekerlek.
  endmethod.
endclass.


start-of-selection.

data obje1 type ref to sayi.

create object obje1.

call method obje1->sayi_ekle.
call method obje1->arayuz~mesaj.

data obje2 type ref to surucu.
create object obje2.

call method obje2->hiz.
call method obje2->mesaj.