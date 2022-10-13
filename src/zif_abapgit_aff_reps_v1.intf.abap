INTERFACE zif_abapgit_aff_reps_v1
  PUBLIC.

  TYPES ty_include_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_include_type,
      include        TYPE ty_include_type VALUE 'I',
      function_group TYPE ty_include_type VALUE 'F',
    END OF co_include_type.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_only_description,
      edit_locked    TYPE abap_bool,
      include_type   TYPE ty_include_type,
    END OF ty_main.

ENDINTERFACE.
