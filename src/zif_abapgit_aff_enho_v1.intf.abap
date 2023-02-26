INTERFACE zif_abapgit_aff_enho_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_filter_values,
      value1 TYPE string,
      value2 TYPE string,
    END OF ty_filter_values.

  TYPES ty_customizing TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_customizing,
      not_supported              TYPE ty_customizing VALUE 'X',
      supported              TYPE ty_customizing VALUE ' ',
      supported_no_transport              TYPE ty_customizing VALUE 'D',
    END OF co_customizing.

  TYPES ty_comparator TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_comparator,
      equal              TYPE ty_comparator VALUE '=',
      less_than          TYPE ty_comparator VALUE '<',
      greater_than       TYPE ty_comparator VALUE '>',
      less_equal         TYPE ty_comparator VALUE '<=',
      greater_equal      TYPE ty_comparator VALUE '>=',
      not_equal          TYPE ty_comparator VALUE '<>',
      covers_pattern     TYPE ty_comparator VALUE 'CP',
      no_pattern         TYPE ty_comparator VALUE 'NP',
      contains_string    TYPE ty_comparator VALUE 'CS',
      contains_no_string TYPE ty_comparator VALUE 'NS',
    END OF co_comparator.

  TYPES:
    BEGIN OF ty_filter_comparators,
      comparator1 TYPE ty_comparator,
      comparator2 TYPE ty_comparator,
    END OF ty_filter_comparators.

  TYPES ty_filter_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_filter_type,
      integer        TYPE ty_filter_type VALUE 'I',
      character_like TYPE ty_filter_type VALUE 'C',
      string         TYPE ty_filter_type VALUE 'S',
      numeric        TYPE ty_filter_type VALUE 'N',
      packed         TYPE ty_filter_type VALUE 'P',
    END OF co_filter_type.


  TYPES:
    BEGIN OF ty_badi_impl_filter,
      filter_name        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      filter_type        TYPE ty_filter_type,
      comparators        TYPE ty_filter_comparators,
      values             TYPE ty_filter_values,
      property_reference TYPE string,
    END OF ty_badi_impl_filter.

  TYPES ty_badi_impl_filters TYPE STANDARD TABLE OF ty_badi_impl_filter WITH DEFAULT KEY.


  TYPES ty_or_combination_of_filters TYPE ty_badi_impl_filters.


  TYPES ty_and_combination_of_or TYPE STANDARD TABLE OF ty_or_combination_of_filters WITH DEFAULT KEY.


  TYPES ty_or_combination_of_and TYPE STANDARD TABLE OF ty_and_combination_of_or WITH DEFAULT KEY.

  TYPES ty_element_usage TYPE c LENGTH 4.

  CONSTANTS:
    BEGIN OF co_element_usage,
      used_object     TYPE ty_element_usage VALUE 'USEO',
      enhanced_object TYPE ty_element_usage VALUE 'EXTO',
      migrated_from   TYPE ty_element_usage VALUE 'MIGR',
    END OF co_element_usage.

  TYPES:
    BEGIN OF ty_referenced_object,
      object_type      TYPE c LENGTH 4,
      object_name      TYPE c LENGTH 120,
      program_id       TYPE c LENGTH 4,
      element_usage    TYPE ty_element_usage,
      main_object_type TYPE  c LENGTH 4,
      main_object_name TYPE  c LENGTH 40,
    END OF ty_referenced_object,

    ty_referenced_objects TYPE STANDARD TABLE OF ty_referenced_object WITH DEFAULT KEY,

    BEGIN OF ty_badi_impl,
      name                      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description               TYPE c LENGTH 255,
      badi_definition           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      implementing_class        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      is_example_implementation TYPE abap_bool,
      is_default_implementation TYPE abap_bool,
      is_active_implementation  TYPE abap_bool,
      customizing  TYPE ty_customizing,
      filter_values             TYPE ty_or_combination_of_and,
    END OF ty_badi_impl,

    ty_badi_impls TYPE STANDARD TABLE OF ty_badi_impl WITH DEFAULT KEY.


  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_100,
      enhancement_spot     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      badi_implementations TYPE ty_badi_impls,
      referenced_objects   TYPE ty_referenced_objects,
    END OF ty_main.

ENDINTERFACE.
