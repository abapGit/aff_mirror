INTERFACE zif_abapgit_aff_chkv_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_range,
      sign   TYPE zif_abapgit_aff_types_v1=>ty_sign,
      option TYPE zif_abapgit_aff_types_v1=>ty_option,
      low    TYPE string,
      high   TYPE string,
    END OF ty_range,

    ty_ranges      TYPE STANDARD TABLE OF ty_range WITH DEFAULT KEY,

    ty_param_value TYPE string,
    BEGIN OF ty_structured_value_comp,
      field TYPE string,
      value TYPE string,
    END OF ty_structured_value_comp,
    ty_structured_value TYPE SORTED TABLE OF ty_structured_value_comp WITH UNIQUE KEY field,
    ty_structured_value_list TYPE STANDARD TABLE OF ty_structured_value WITH DEFAULT KEY,

    BEGIN OF ty_parameter,
      name                  TYPE string,
      value                 TYPE string,
      structured_value      TYPE ty_structured_value,
      structured_value_list TYPE ty_structured_value_list,
      value_list            TYPE STANDARD TABLE OF ty_param_value WITH DEFAULT KEY,
      value_range_list      TYPE ty_ranges,
    END OF ty_parameter,

    ty_parameters TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_check,
      check_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      parameters TYPE ty_parameters,
    END OF ty_check.

  TYPES:
      ty_checks TYPE STANDARD TABLE OF ty_check WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_main,
      format_version  TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header          TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      remote_enabled  TYPE abap_bool,
      selected_checks TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
