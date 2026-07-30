INTERFACE zif_abapgit_aff_sxtg_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_transaction_code,
      name TYPE c LENGTH 20,
    END OF ty_transaction_code.

  TYPES ty_transaction_codes TYPE STANDARD TABLE OF ty_transaction_code WITH KEY name.

  TYPES:
    BEGIN OF ty_general_information,
      extension_include          TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      application_data_structure TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      ui_extension_entity        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_no_abap_lv,

      general_information TYPE ty_general_information,

      transaction_codes   TYPE ty_transaction_codes,
    END OF ty_main.

ENDINTERFACE.
