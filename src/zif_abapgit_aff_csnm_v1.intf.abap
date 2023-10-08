INTERFACE zif_abapgit_aff_csnm_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_csn_file,
      file TYPE string,
    END OF ty_csn_file.

  TYPES ty_csn_files TYPE STANDARD TABLE OF ty_csn_file WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      csn_files      TYPE ty_csn_files,
    END OF ty_main.
ENDINTERFACE.
