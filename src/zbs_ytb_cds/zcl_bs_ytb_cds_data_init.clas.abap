CLASS zcl_bs_ytb_cds_data_init DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    TYPES headers       TYPE STANDARD TABLE OF zbs_ytb_header WITH EMPTY KEY.
    TYPES positions     TYPE STANDARD TABLE OF zbs_ytb_position WITH EMPTY KEY.
    TYPES partners      TYPE STANDARD TABLE OF zbs_ytb_partner WITH EMPTY KEY.
    TYPES products      TYPE STANDARD TABLE OF zbs_ytb_product WITH EMPTY KEY.
    TYPES product_texts TYPE STANDARD TABLE OF zbs_ytb_productt WITH EMPTY KEY.

    DATA actual_user TYPE sxco_user_name.

    METHODS create_headers
      RETURNING VALUE(result) TYPE headers.

    METHODS create_partners
      RETURNING VALUE(result) TYPE partners.

    METHODS create_products
      RETURNING VALUE(result) TYPE products.

    METHODS create_product_texts
      RETURNING VALUE(result) TYPE product_texts.

    METHODS create_positions
      RETURNING VALUE(result) TYPE positions.
ENDCLASS.


CLASS zcl_bs_ytb_cds_data_init IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    actual_user = xco_cp=>sy->user( )->name.

    DELETE FROM zbs_ytb_partner.
    INSERT zbs_ytb_partner FROM TABLE @( create_partners( ) ).
    out->write( |New partners: { sy-dbcnt }| ).

    DELETE FROM zbs_ytb_product.
    INSERT zbs_ytb_product FROM TABLE @( create_products( ) ).
    out->write( |New products: { sy-dbcnt }| ).

    DELETE FROM zbs_ytb_productt.
    INSERT zbs_ytb_productt FROM TABLE @( create_product_texts( ) ).
    out->write( |New product texts: { sy-dbcnt }| ).

    DELETE FROM zbs_ytb_header.
    INSERT zbs_ytb_header FROM TABLE @( create_headers( ) ).
    out->write( |New headers: { sy-dbcnt }| ).

    DELETE FROM zbs_ytb_position.
    INSERT zbs_ytb_position FROM TABLE @( create_positions( ) ).
    out->write( |New positions: { sy-dbcnt }| ).

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


  METHOD create_positions.
    RETURN VALUE #( ( document_id = '4000000001'
                      position_no = '001'
                      product_id  = 'P01/002'
                      quantity    = '1'
                      price       = '110' )
                    ( document_id = '4000000002'
                      position_no = '001'
                      product_id  = 'P01/003'
                      quantity    = '2'
                      price       = '60.25' )
                    ( document_id = '4000000002'
                      position_no = '002'
                      product_id  = 'P01/002'
                      quantity    = '1'
                      price       = '15.99' )
                    ( document_id = '4000000003'
                      position_no = '001'
                      product_id  = 'P01/004'
                      quantity    = '2'
                      price       = '345.49' )
                    ( document_id = '4000000004'
                      position_no = '001'
                      product_id  = 'P01/001'
                      quantity    = '1'
                      price       = '1200' )
                    ( document_id = '4000000005'
                      position_no = '001'
                      product_id  = 'P01/001'
                      quantity    = '1'
                      price       = '699.50' )
                    ( document_id = '4000000006'
                      position_no = '001'
                      product_id  = 'P02/123'
                      quantity    = '12'
                      price       = '15.99' )
                    ( document_id = '4000000007'
                      position_no = '001'
                      product_id  = 'P01/002'
                      quantity    = '7'
                      price       = '5.66' )
                    ( document_id = '4000000008'
                      position_no = '001'
                      product_id  = 'P01/002'
                      quantity    = '4'
                      price       = '98.99' )
                    ( document_id = '4000000008'
                      position_no = '002'
                      product_id  = 'P01/001'
                      quantity    = '2'
                      price       = '799.46' )
                    ( document_id = '4000000008'
                      position_no = '003'
                      product_id  = 'P01/003'
                      quantity    = '4'
                      price       = '120.55' )
                    ( document_id = '4000000008'
                      position_no = '004'
                      product_id  = 'P01/004'
                      quantity    = '4'
                      price       = '275' )
                    ( document_id = '4000000009'
                      position_no = '001'
                      product_id  = 'P01/002'
                      quantity    = '1'
                      price       = '77' )
                    ( document_id = '4000000009'
                      position_no = '002'
                      product_id  = 'P01/004'
                      quantity    = '1'
                      price       = '555' )
                    ( document_id = '4000000009'
                      position_no = '003'
                      product_id  = 'P01/003'
                      quantity    = '1'
                      price       = '89.99' ) ).
  ENDMETHOD.


  METHOD create_partners.
    RETURN VALUE #( ( partner_id   = '10001'
                      first_name   = 'Barbara'
                      last_name    = 'Mauer'
                      street       = 'Langenhorner Chaussee'
                      house_number = '49'
                      zip_code     = '84524'
                      town         = 'Neuötting'
                      country      = 'DE' )
                    ( partner_id   = '10002'
                      first_name   = 'Lixue'
                      last_name    = 'Chien'
                      street       = 'Borstelmannsweg'
                      house_number = '13'
                      zip_code     = '96409'
                      town         = 'Coburg'
                      country      = 'DE' )
                    ( partner_id   = '10003'
                      first_name   = 'Rafael Pinto'
                      last_name    = 'Castro'
                      street       = 'Lille Vibyvej'
                      house_number = '95'
                      zip_code     = '5290'
                      town         = 'Marslev'
                      country      = 'DK' )
                    ( partner_id   = '10004'
                      first_name   = 'Julius S.'
                      last_name    = 'Holm'
                      street       = 'Degnehøjvej'
                      house_number = '75'
                      zip_code     = '6093'
                      town         = 'Sjølund'
                      country      = 'DK' ) ).
  ENDMETHOD.


  METHOD create_products.
    RETURN VALUE #( ( product_id       = 'P01/001'
                      product_unit     = 'STK'
                      product_currency = 'EUR' )
                    ( product_id       = 'P01/002'
                      product_unit     = 'STK'
                      product_currency = 'USD' )
                    ( product_id       = 'P01/003'
                      product_unit     = 'STK'
                      product_currency = 'EUR' )
                    ( product_id       = 'P01/004'
                      product_unit     = 'STK'
                      product_currency = 'CHF' )
                    ( product_id       = 'P02/123'
                      product_unit     = 'KAR'
                      product_currency = 'CHF' ) ).
  ENDMETHOD.


  METHOD create_product_texts.
    RETURN VALUE #( ( language     = 'E'
                      product_id   = 'P01/001'
                      product_text = 'Desk' )
                    ( language     = 'E'
                      product_id   = 'P01/002'
                      product_text = 'Mouse' )
                    ( language     = 'E'
                      product_id   = 'P01/003'
                      product_text = 'Keyboard' )
                    ( language     = 'E'
                      product_id   = 'P01/004'
                      product_text = 'Monitor' )
                    ( language     = 'E'
                      product_id   = 'P02/123'
                      product_text = 'Pizza' )
                    ( language     = 'D'
                      product_id   = 'P01/001'
                      product_text = 'Tisch' )
                    ( language     = 'D'
                      product_id   = 'P01/002'
                      product_text = 'Maus' )
                    ( language     = 'D'
                      product_id   = 'P01/003'
                      product_text = 'Tastatur' )
                    ( language     = 'D'
                      product_id   = 'P01/004'
                      product_text = 'Monitor' )
                    ( language     = 'D'
                      product_id   = 'P02/123'
                      product_text = 'Pizza' )
                    ( language     = 'F'
                      product_id   = 'P01/001'
                      product_text = 'Tableau' )
                    ( language     = 'F'
                      product_id   = 'P01/002'
                      product_text = 'Souris' )
                    ( language     = 'F'
                      product_id   = 'P01/003'
                      product_text = 'Clavier' )
                    ( language     = 'F'
                      product_id   = 'P01/004'
                      product_text = 'Moniteur' )
                    ( language     = 'F'
                      product_id   = 'P02/123'
                      product_text = 'Pizza' ) ).
  ENDMETHOD.
ENDCLASS.
