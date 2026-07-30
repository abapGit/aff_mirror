INTERFACE zif_abapgit_aff_msag_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_message,
      number TYPE c LENGTH 3,
      text   TYPE c LENGTH 73,
    END OF ty_message.

  TYPES ty_messages TYPE SORTED TABLE OF ty_message WITH UNIQUE KEY number.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_no_abap_lv,
      messages       TYPE ty_messages,
    END OF ty_main.

ENDINTERFACE.
