*&---------------------------------------------------------------------*
*& Report  ZEB_IF_ENDIF
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZEB_KONTROL_YAPISI.

data : gv_gun type i VALUE 1.

write / 'if else-if örneði' color COL_POSITIVE.

IF gv_gun = 1.
  write /'pazartesi'.
ELSEIF gv_gun = 2.
  write /'salý'.
ELSEIF gv_gun = 3.
  write /'çarþamba'.
ELSEIF gv_gun = 4.
  write /'Perþembe'.
ELSEIF gv_gun = 5.
  write /'cuma'.
ELSEIF gv_gun = 6.
  write /'cumartesi'.
ELSEIF gv_gun = 7.
  write /'pazar'.
ENDIF.

skip 1.
uline.
skip 1.

data : gv_gun1 type i VALUE 5.


write / 'case endcase örneði' color COL_POSITIVE.

case gv_gun1.
  WHEN 1.
    WRITE  / 'PAZARTESI'.
  WHEN 2.
    WRITE  / 'SALI'.
  WHEN 3.
    WRITE  / 'Çarþamba'.
  WHEN 4.
    WRITE  / 'perþebe'.
  WHEN 5.
    WRITE  / 'cuma'.
  WHEN 6.
    WRITE  / 'cumartesi'.
  WHEN 7.
    WRITE  / 'pazar'.
ENDCASE.