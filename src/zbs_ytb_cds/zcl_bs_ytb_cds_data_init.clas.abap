CLASS zcl_bs_ytb_cds_data_init DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    TYPES headers TYPE STANDARD TABLE OF zbs_ytb_header WITH EMPTY KEY.

    DATA actual_user TYPE sxco_user_name.

    METHODS create_headers
      RETURNING VALUE(result) TYPE headers.
ENDCLASS.


CLASS zcl_bs_ytb_cds_data_init IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    actual_user = xco_cp=>sy->user( )->name.

    DELETE FROM zbs_ytb_header.
    INSERT zbs_ytb_header FROM TABLE @( create_headers( ) ).
    out->write( |New headers: { sy-dbcnt }| ).

    COMMIT WORK.
  ENDMETHOD.


  METHOD create_headers.
    RETURN VALUE #( clerk = actual_user
                    ( document_id   = '4000000001'
                      description   = 'New computer with a mouse'
                      partner_id    = '10001'
                      creation_date = '20250101'
                      payment_date  = '20250115' )
                    ( document_id   = '4000000002'
                      description   = 'Keyboard and mouse'
                      partner_id    = '10002'
                      creation_date = '20250102'
                      payment_date  = '20250131' )
                    ( document_id   = '4000000003'
                      description   = 'Monitor for the old one'
                      partner_id    = '10003'
                      creation_date = '20250105'
                      payment_date  = '20250109' )
                    ( document_id   = '4000000004'
                      description   = 'Desk for standing'
                      partner_id    = '10002'
                      creation_date = '20250106'
                      payment_date  = '20250117' )
                    ( document_id   = '4000000005'
                      description   = 'Office-desk'
                      partner_id    = '10002'
                      creation_date = '20250117'
                      payment_date  = '20250203' )
                    ( document_id   = '4000000006'
                      description   = 'Pizza for the team'
                      partner_id    = '10004'
                      creation_date = '20250117'
                      payment_date  = '20250118' )
                    ( document_id   = '4000000007'
                      description   = 'Coffee cups'
                      partner_id    = '10001'
                      creation_date = '20250118'
                      payment_date  = '20250118' )
                    ( document_id   = '4000000008'
                      description   = 'Desk setup'
                      partner_id    = '10003'
                      creation_date = '20250123'
                      payment_date  = '20250202' )
                    ( document_id   = '4000000009'
                      description   = 'New computer with a mouse'
                      partner_id    = '10002'
                      creation_date = '20250127'
                      payment_date  = '20250205' ) ).
  ENDMETHOD.
ENDCLASS.
