INTERFACE zif_abapgit_aff_edcr_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
    END OF ty_main.

ENDINTERFACE.
