CLASS zcl_bs_ytb_debug_example DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF sale,
             position    TYPE i,
             description TYPE string,
             value       TYPE p LENGTH 15 DECIMALS 2,
             currency    TYPE waers,
           END OF sale.
    TYPES sales TYPE STANDARD TABLE OF sale WITH EMPTY KEY.

  PRIVATE SECTION.
    METHODS get_table_content
      RETURNING VALUE(result) TYPE sales.

    METHODS raise_a_stacked_exception.

    METHODS raise_and_add_message
      RAISING zcx_bs_ytb_general_failure.

    METHODS raise_an_optional_error
      RAISING zcx_bs_ytb_general_failure.

    METHODS get_json_content
      RETURNING VALUE(result) TYPE string.
ENDCLASS.


CLASS zcl_bs_ytb_debug_example IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(table_content) = get_table_content( ).

    out->write( table_content ).

    TRY.
        raise_a_stacked_exception( ).
      CATCH cx_root INTO DATA(error).
        out->write( error->get_text( ) ).
    ENDTRY.

    DATA(json_string) = get_json_content( ).

    out->write( json_string ).
  ENDMETHOD.


  METHOD get_table_content.
    RETURN VALUE #( ( position = 1 description = `Ben's computer` value = '100.00' currency = 'USD' )
                    ( position = 2 description = `On little chair` value = '20.99' currency = 'EUR' )
                    ( position = 3 description = `A dishwasher` value = '250.00' currency = 'EUR' )
                    ( position = 4 description = `Used old car` value = '1250.00' currency = 'USD' ) ).
  ENDMETHOD.


  METHOD raise_a_stacked_exception.
    TRY.
        raise_and_add_message( ).
      CATCH zcx_bs_ytb_general_failure INTO DATA(failure).
        RAISE EXCEPTION NEW cx_sy_itab_line_not_found( previous = failure ).
    ENDTRY.
  ENDMETHOD.


  METHOD raise_and_add_message.
    TRY.
        raise_an_optional_error( ).
      CATCH zcx_bs_ytb_general_failure INTO DATA(failure).
        RAISE EXCEPTION NEW zcx_bs_ytb_general_failure( textid   = zcx_bs_ytb_general_failure=>message_specific
                                                        previous = failure ).
    ENDTRY.
  ENDMETHOD.


  METHOD raise_an_optional_error.
    DATA(raise_error) = abap_false.

    IF raise_error = abap_true.
      RAISE EXCEPTION NEW zcx_bs_ytb_general_failure( ).
    ENDIF.
  ENDMETHOD.


  METHOD get_json_content.
    RETURN `{ "Name": "Gerd", "Age": 10, "Child": True }`.
  ENDMETHOD.
ENDCLASS.
