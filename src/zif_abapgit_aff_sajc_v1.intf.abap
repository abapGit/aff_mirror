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
    BEGIN OF ty_general_information,
      class_name   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      program_name TYPE ty_program_name,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_exit_classes,
      check        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      value_help   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      notification TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_exit_classes.

  TYPES ty_parameter_name TYPE c LENGTH 38.
  TYPES ty_group_name TYPE c LENGTH 10.
  TYPES ty_section_name TYPE c LENGTH 10.
  TYPES ty_parameter_title_text TYPE c LENGTH 255.
  TYPES ty_title_text TYPE c LENGTH 120.
  TYPES ty_radio_button_group TYPE c LENGTH 4.
  TYPES ty_screen_element TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_screen_element,
      none         TYPE ty_screen_element VALUE ' ',
      checkbox     TYPE ty_screen_element VALUE 'C',
      radio_button TYPE ty_screen_element VALUE 'R',
      list_box     TYPE ty_screen_element VALUE 'L',
    END OF co_screen_element.

  TYPES:
    BEGIN OF ty_parameter,
      name                 TYPE ty_parameter_name,
      title                TYPE ty_parameter_title_text,
      group                TYPE ty_group_name,
      indented             TYPE abap_bool,
      mandatory            TYPE abap_bool,
      hidden               TYPE abap_bool,
      read_only            TYPE abap_bool,
      enabled_by_parameter TYPE ty_parameter_name,
      screen_element       TYPE ty_screen_element,
      radio_button_group   TYPE ty_radio_button_group,
      backend_call         TYPE abap_bool,
      single_values        TYPE abap_bool,
      text_editor_lines    TYPE i,
    END OF ty_parameter.
  TYPES:
    ty_parameter_table TYPE STANDARD TABLE OF ty_parameter WITH KEY name.

  TYPES:
    BEGIN OF ty_group,
      name    TYPE ty_group_name,
      title   TYPE ty_title_text,
      section TYPE ty_section_name,
    END OF ty_group.
  TYPES:
    ty_group_table TYPE STANDARD TABLE OF ty_group WITH KEY name.

  TYPES:
    BEGIN OF ty_section,
      name  TYPE ty_section_name,
      title TYPE ty_title_text,
    END OF ty_section.
  TYPES:
    ty_section_table TYPE STANDARD TABLE OF ty_section WITH KEY name.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE ty_header,
      general_information TYPE ty_general_information,
      exit_classes        TYPE ty_exit_classes,
      sections            TYPE ty_section_table,
      groups              TYPE ty_group_table,
      parameters          TYPE ty_parameter_table,
    END OF ty_main.
ENDINTERFACE.
