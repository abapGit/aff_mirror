INTERFACE zif_abapgit_aff_enhs_v1
  PUBLIC.

  TYPES ty_tool TYPE c LENGTH 10.

  CONSTANTS:
    BEGIN OF co_tool,
      badi_definition TYPE ty_tool VALUE 'BADI_DEF',
    END OF co_tool.

  TYPES ty_instantiation TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_instantiation,
      creating_new_instances     TYPE ty_instantiation VALUE 'N',
      reuse_instances            TYPE ty_instantiation VALUE 'S',
      context_specific_instances TYPE ty_instantiation VALUE 'Y',
    END OF co_instantiation.

  TYPES ty_filter_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_filter_type,
      integer        TYPE ty_filter_type VALUE 'I',
      character_like TYPE ty_filter_type VALUE 'C',
      string         TYPE ty_filter_type VALUE 'S',
      numeric        TYPE ty_filter_type VALUE 'N',
      packed         TYPE ty_filter_type VALUE 'P',
    END OF co_filter_type.

  TYPES ty_value_check_object_type TYPE string.

  CONSTANTS:
    BEGIN OF co_value_check_object_type,
      domain       TYPE ty_value_check_object_type VALUE 'DOMADD',
      data_element TYPE ty_value_check_object_type VALUE 'DTELDE',
    END OF co_value_check_object_type.

  TYPES:
    BEGIN OF ty_value_check_ddic,
      type        TYPE ty_value_check_object_type,
      object_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_value_check_ddic.

  TYPES:
    BEGIN OF ty_value_check_class,
      object_name    TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      length         TYPE i,
      decimal_places TYPE i,
    END OF ty_value_check_class.

  TYPES:
    BEGIN OF ty_badi_def_filter,
      name                 TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description          TYPE c LENGTH 255,
      type                 TYPE ty_filter_type,
      only_constant_values TYPE abap_bool,
      value_check_ddic     TYPE ty_value_check_ddic,
      value_check_class    TYPE ty_value_check_class,
    END OF ty_badi_def_filter.

  TYPES ty_badi_def_filters TYPE STANDARD TABLE OF ty_badi_def_filter WITH DEFAULT KEY.

  TYPES ty_example_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30.

  TYPES ty_example_classes TYPE STANDARD TABLE OF ty_example_class WITH DEFAULT KEY.


  TYPES:
    BEGIN OF ty_badi_def,
      name               TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description        TYPE c LENGTH 255,
      interface          TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      instantiation      TYPE ty_instantiation,
      multiple_use       TYPE abap_bool,
      sap_internal       TYPE abap_bool,
      example_classes    TYPE ty_example_classes,
      fallback_class     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      filter_limitation  TYPE abap_bool,
      documentation_id   TYPE c LENGTH 60,
      amdp               TYPE abap_bool,
      filters            TYPE ty_badi_def_filters,
    END OF ty_badi_def.

  TYPES ty_badi_defs TYPE STANDARD TABLE OF ty_badi_def WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_configuration,
      sap_internal TYPE abap_bool,
      tool         TYPE ty_tool,
    END OF ty_configuration,

    BEGIN OF ty_main,
      format_version   TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header           TYPE zif_abapgit_aff_types_v1=>ty_header_100,
      configuration    TYPE ty_configuration,
      badi_definitions TYPE ty_badi_defs,
    END OF ty_main.

ENDINTERFACE.
