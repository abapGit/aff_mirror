INTERFACE zif_abapgit_aff_sajc_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_header,
      description           TYPE c LENGTH 120,
      original_language     TYPE sy-langu,
      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE ty_header,
      class_name            TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_exit_class      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      value_help_exit_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_main.
ENDINTERFACE.
