CLASS zcl_bs_ytb_class_runner DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_ytb_class_runner IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( `Hello GitHub` ).
  ENDMETHOD.
ENDCLASS.
