INTERFACE zif_abapgit_aff_sajt_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_header,
      description           TYPE c LENGTH 120,
      original_language     TYPE sy-langu,
      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

  TYPES:
    ty_catalog_name TYPE c LENGTH 40.

  TYPES:
    BEGIN OF ty_value_range_entry,
      sign   TYPE  zif_abapgit_aff_types_v1=>ty_sign,
      option TYPE  zif_abapgit_aff_types_v1=>ty_option,
      low    TYPE  c LENGTH 255,
      high   TYPE  c LENGTH 255,
    END OF ty_value_range_entry.
  TYPES:
    ty_value_ranges_table TYPE STANDARD TABLE OF ty_value_range_entry WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_single_value_parameter,
      name  TYPE  c LENGTH 8,
      value TYPE  c LENGTH 255,
    END OF ty_single_value_parameter.
  TYPES:
    ty_single_value_param_table TYPE STANDARD TABLE OF ty_single_value_parameter WITH KEY name.

  TYPES:
    BEGIN OF ty_value_ranges_parameter,
      name         TYPE  c LENGTH 8,
      value_ranges TYPE ty_value_ranges_table,
    END OF ty_value_ranges_parameter.
  TYPES:
    ty_value_ranges_param_table TYPE STANDARD TABLE OF ty_value_ranges_parameter WITH KEY name.

  TYPES:
    BEGIN OF ty_parameters,
      single_value_parameters TYPE ty_single_value_param_table,
      value_ranges_parameters TYPE ty_value_ranges_param_table,
    END OF ty_parameters.

  TYPES:
    BEGIN OF ty_general_information,
      catalog_name TYPE ty_catalog_name,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE ty_header,
      general_information TYPE ty_general_information,
      parameters          TYPE ty_parameters,
    END OF ty_main.
ENDINTERFACE.
