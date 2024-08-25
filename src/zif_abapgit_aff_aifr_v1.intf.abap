INTERFACE zif_abapgit_aff_aifr_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_recipient_details,
      namespace TYPE c LENGTH 15,
    END OF ty_recipient_details,

    BEGIN OF ty_main,
      format_version    TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header            TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      recipient_details TYPE ty_recipient_details,
    END OF ty_main.
ENDINTERFACE.
