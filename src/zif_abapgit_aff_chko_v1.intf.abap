INTERFACE zif_abapgit_aff_chko_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_parameter,
      name         TYPE string,
      description  TYPE c LENGTH 255,
      hidden       TYPE abap_bool,
    END OF ty_parameter.

  TYPES:
    ty_parameters TYPE HASHED TABLE OF ty_parameter WITH UNIQUE KEY name.

  TYPES ty_check_type TYPE c LENGTH 1.

  TYPES:
    BEGIN OF ty_main,
      format_version     TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header             TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      category           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      implementing_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_type     TYPE ty_check_type,
      parameters         TYPE ty_parameters,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_check_type,
      local              TYPE ty_check_type VALUE 'L',
      remote_enabled     TYPE ty_check_type VALUE 'R',
    END OF co_check_type.
ENDINTERFACE.
