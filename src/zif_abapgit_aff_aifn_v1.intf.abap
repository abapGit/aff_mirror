INTERFACE zif_abapgit_aff_aifn_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_general_information,
      aif_namespace TYPE c LENGTH 6,
    END OF ty_general_information,

    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
