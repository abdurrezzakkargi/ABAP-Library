CLASS zcl_string DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS bead_strings
      IMPORTING
        VALUE(it_string)    TYPE string_table
        VALUE(iv_seperator) TYPE c DEFAULT ' '
      RETURNING
        VALUE(rv_strng)     TYPE string
      EXCEPTIONS no_data.
  PRIVATE SECTION.
    DATA: str TYPE string.
ENDCLASS.

CLASS zcl_string IMPLEMENTATION.
  METHOD bead_strings.
    DESCRIBE TABLE it_string.
    IF sy-tfill = 0.
      MESSAGE 'No data!'  TYPE 'S' RAISING
      no_data.
    ENDIF.
    LOOP AT it_string INTO str.
      IF sy-tabix > 1.
        CONCATENATE rv_strng str INTO rv_strng SEPARATED
        BY iv_seperator.
      ELSE.
        rv_strng = str.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
