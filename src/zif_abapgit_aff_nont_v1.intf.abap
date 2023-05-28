INTERFACE zif_abapgit_aff_nont_v1
  PUBLIC.

  TYPES:

    BEGIN OF ty_main,
      format_version  TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header          TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      name            TYPE c LENGTH 30,

      sap_object_type TYPE c LENGTH 30,

      root_node  TYPE abap_bool,

    END OF ty_main.

ENDINTERFACE.
