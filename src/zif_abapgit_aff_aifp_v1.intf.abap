INTERFACE zif_abapgit_aff_aifp_v1
  PUBLIC.

  TYPES:
    ty_check_scenario TYPE c LENGTH 10.
  TYPES:
    ty_simple_check_type TYPE c LENGTH 1.
  TYPES:
    ty_database_check_type TYPE c LENGTH 1.
  TYPES:
    ty_field_type TYPE c LENGTH 7.
  TYPES:
    ty_variable_type TYPE c LENGTH 5.
  TYPES:
    BEGIN OF ty_variable,
      number TYPE i,
      type   TYPE ty_variable_type,
      field  TYPE string,
      value  TYPE string,
    END OF ty_variable.
  TYPES:
    ty_variables TYPE STANDARD TABLE OF ty_variable WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_message,
      message_class        TYPE c LENGTH 20,
      message_number       TYPE c LENGTH 3,
      variable_assignments TYPE ty_variables,
    END OF ty_message.
  TYPES:
    BEGIN OF ty_field_check,
      check_type TYPE ty_simple_check_type,
      operator   TYPE zif_abapgit_aff_types_v1=>ty_option,
      field_type TYPE ty_field_type,
      field      TYPE c LENGTH 60,
      value      TYPE c LENGTH 60,
    END OF ty_field_check.
  TYPES:
    BEGIN OF ty_database_check,
      table           TYPE c LENGTH 45,
      where_condition TYPE c LENGTH 200,
      check_type      TYPE ty_database_check_type,
      field_name      TYPE c LENGTH 45,
      operator        TYPE zif_abapgit_aff_types_v1=>ty_option,
      field_type      TYPE ty_field_type,
      field           TYPE c LENGTH 60,
      value           TYPE c LENGTH 60,
    END OF ty_database_check.
  TYPES:
    BEGIN OF ty_custom_implementation,
      class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_custom_implementation.

  TYPES:
    BEGIN OF ty_single_check,
      description           TYPE c LENGTH 120,
      id                    TYPE n LENGTH 3,
      scenario              TYPE ty_check_scenario,
      field_check           TYPE ty_field_check,
      database_check        TYPE ty_database_check,
      custom_implementation TYPE ty_custom_implementation,
      success_message       TYPE ty_message,
    END OF ty_single_check.
  TYPES:
    ty_single_checks TYPE STANDARD TABLE OF ty_single_check WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_general_information,
      namespace TYPE c LENGTH 15,
      aif_check TYPE c LENGTH 20,
    END OF ty_general_information.
  TYPES:
    BEGIN OF ty_main,
      format_version           TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                   TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information      TYPE ty_general_information,
      error_message            TYPE ty_message,
      single_check_assignments TYPE ty_single_checks,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_check_scenario,
      simple_field_check          TYPE ty_check_scenario VALUE 'SMPL',
      advanced_field_check        TYPE ty_check_scenario VALUE 'ADVD',
      simple_field_and_db_check   TYPE ty_check_scenario VALUE 'SMDB',
      advanced_field_and_db_check TYPE ty_check_scenario VALUE 'ADDB',
      database_check              TYPE ty_check_scenario VALUE 'DBCK',
      custom_implementation       TYPE ty_check_scenario VALUE 'IMPL',
    END OF co_check_scenario.
  CONSTANTS:
    BEGIN OF co_simple_check_type,
      empty                       TYPE ty_simple_check_type VALUE 'I',
      not_empty                   TYPE ty_simple_check_type VALUE 'N',
      empty_or_zero               TYPE ty_simple_check_type VALUE '0',
      numeric_integer             TYPE ty_simple_check_type VALUE '1',
      numeric_empty               TYPE ty_simple_check_type VALUE '2',
      numeric_negative            TYPE ty_simple_check_type VALUE '3',
      numeric_comma               TYPE ty_simple_check_type VALUE '4',
      numeric_dot                 TYPE ty_simple_check_type VALUE '5',
      only_chars_capital          TYPE ty_simple_check_type VALUE 'A',
      only_chars_lower            TYPE ty_simple_check_type VALUE 'a',
      only_chars                  TYPE ty_simple_check_type VALUE 'Z',
      alphanumeric_special_umlaut TYPE ty_simple_check_type VALUE 'X',
    END OF co_simple_check_type.
  CONSTANTS:
    BEGIN OF co_database_check_type,
      check_existence     TYPE ty_database_check_type VALUE '1',
      check_non_existence TYPE ty_database_check_type VALUE '2',
      compare             TYPE ty_database_check_type VALUE '3',
    END OF co_database_check_type.
  CONSTANTS:
    BEGIN OF co_field_type,
      defined_field TYPE ty_field_type VALUE 'DEF_FLD',
      pattern       TYPE ty_field_type VALUE 'STRING',
      system_field  TYPE ty_field_type VALUE 'SYS_FLD',
    END OF co_field_type.
  CONSTANTS:
    BEGIN OF co_variable_type,
*      "! <p class="shorttext">Source Structure</p>
*      "! Source structure
*      source_structure        TYPE ty_variable_type VALUE 'SRC_S',
*      "! <p class="shorttext">Destination Structure</p>
*      "! Destination structure
*      destination_structure   TYPE ty_variable_type VALUE 'DST_S',
      constant                TYPE ty_variable_type VALUE 'CONST',
      system_field            TYPE ty_variable_type VALUE 'SYSTF',
      defined_field           TYPE ty_variable_type VALUE 'D_FLD',
    END OF co_variable_type.
ENDINTERFACE.
