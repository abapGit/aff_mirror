INTERFACE zif_abapgit_aff_fugr_v1
  PUBLIC.

  TYPES ty_status TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_status,
      not_classified   TYPE ty_status VALUE space,
      sap_program      TYPE ty_status VALUE 'P',
      customer_program TYPE ty_status VALUE 'K',
      system_program   TYPE ty_status VALUE 'S',
      test_program     TYPE ty_status VALUE 'T',
    END OF co_status.

  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_60_src,
      fix_point_arithmetic TYPE abap_bool,
      status               TYPE ty_status,
    END OF ty_main.

ENDINTERFACE.
