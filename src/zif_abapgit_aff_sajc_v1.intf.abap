INTERFACE zif_abapgit_aff_sajc_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_header,
      description           TYPE c LENGTH 120,
      original_language     TYPE sy-langu,
      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

  TYPES ty_program_name TYPE c LENGTH 40.

  TYPES:
    BEGIN OF ty_exit_classes,
      check        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      value_help   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      notification TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_exit_classes.

  TYPES:
    BEGIN OF ty_general_information,
      class_name   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      program_name TYPE ty_program_name,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE ty_header,
      general_information TYPE ty_general_information,
      exit_classes        TYPE ty_exit_classes,
    END OF ty_main.
ENDINTERFACE.
