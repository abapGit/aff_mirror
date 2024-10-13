INTERFACE zif_abapgit_aff_edck_v1
  PUBLIC.

  TYPES ty_check_classification TYPE c LENGTH 1.
  TYPES ty_check_category TYPE c LENGTH 6.

  TYPES:
    BEGIN OF ty_attributes,
      check_category         TYPE ty_check_category,
      check_classification   TYPE ty_check_classification,
      additional_check_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      result_process_derived TYPE abap_bool,
    END OF ty_attributes.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_attributes,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_check_classification,
      core_delivered_checks         TYPE ty_check_classification VALUE 'C',
      additional_implemented_checks TYPE ty_check_classification VALUE 'A',
    END OF co_check_classification.

  CONSTANTS:
    BEGIN OF co_check_category,
      existence_check           TYPE ty_check_category VALUE 'EXIST',
      status_check              TYPE ty_check_category VALUE 'STATUS',
      edocument_existence_check TYPE ty_check_category VALUE 'EDOCHK',
      content_mismatch_check    TYPE ty_check_category VALUE 'CONMIS',
    END OF co_check_category.
ENDINTERFACE.
