INTERFACE zif_abapgit_aff_enho_v1
  PUBLIC.

  TYPES ty_range_filter_comparator TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_range_filter_comparator,
      less_than  TYPE ty_range_filter_comparator VALUE '<',
      less_equal TYPE ty_range_filter_comparator VALUE '<=',
    END OF co_range_filter_comparator.

  TYPES ty_comparator TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_comparator,
      equal                       TYPE ty_comparator VALUE '=',
      less_than                   TYPE ty_comparator VALUE '<',
      greater_than                TYPE ty_comparator VALUE '>',
      less_equal                  TYPE ty_comparator VALUE '<=',
      greater_equal               TYPE ty_comparator VALUE '>=',
      not_equal                   TYPE ty_comparator VALUE '<>',
      conforms_to_pattern         TYPE ty_comparator VALUE 'CP',
      does_not_conform_to_pattern TYPE ty_comparator VALUE 'NP',
      contains_string             TYPE ty_comparator VALUE 'CS',
      contains_no_string          TYPE ty_comparator VALUE 'NS',
      not_specified               TYPE ty_comparator VALUE 'XX',
    END OF co_comparator.


  TYPES:
    BEGIN OF ty_range_filter,
      left_comparator  TYPE ty_range_filter_comparator,
      left_value       TYPE string,
      right_comparator TYPE ty_range_filter_comparator,
      right_value      TYPE string,
    END OF ty_range_filter.

  TYPES:
    BEGIN OF ty_filter,
      name       TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      comparator TYPE ty_comparator,
      value      TYPE string,
      range      TYPE ty_range_filter,
    END OF ty_filter.

  TYPES:
    BEGIN OF ty_inner_or,
      filter TYPE ty_filter,
    END OF ty_inner_or.

  TYPES:
    BEGIN OF ty_and,
      or     TYPE STANDARD TABLE OF ty_inner_or WITH DEFAULT KEY,
      filter TYPE ty_filter,
    END OF ty_and.

  TYPES:
    BEGIN OF ty_outer_or,
      and    TYPE STANDARD TABLE OF ty_and WITH DEFAULT KEY,
      or     TYPE STANDARD TABLE OF ty_inner_or WITH DEFAULT KEY,
      filter TYPE ty_filter,
    END OF ty_outer_or.

  TYPES:
    BEGIN OF ty_filter_values,
      or     TYPE STANDARD TABLE OF ty_outer_or WITH DEFAULT KEY,
      and    TYPE STANDARD TABLE OF ty_and WITH DEFAULT KEY,
      filter TYPE ty_filter,
    END OF ty_filter_values.

  TYPES ty_customizing TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_customizing,
      not_supported          TYPE ty_customizing VALUE 'X',
      supported              TYPE ty_customizing VALUE ' ',
      supported_no_transport TYPE ty_customizing VALUE 'D',
    END OF co_customizing.

  TYPES:
    BEGIN OF ty_badi_implementation,
      name                      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description               TYPE c LENGTH 255,
      badi_definition           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      implementing_class        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      is_example_implementation TYPE abap_bool,
      is_default_implementation TYPE abap_bool,
      is_active_implementation  TYPE abap_bool,
      customizing               TYPE ty_customizing,
      filter_values             TYPE ty_filter_values,
    END OF ty_badi_implementation,

    ty_badi_implementations TYPE STANDARD TABLE OF ty_badi_implementation WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_general_information,
      enhancement_spot TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_100,
      general_information  TYPE ty_general_information,
      badi_implementations TYPE ty_badi_implementations,
    END OF ty_main.

ENDINTERFACE.
