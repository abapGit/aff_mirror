INTERFACE zif_abapgit_aff_saia_v1
  PUBLIC.

  TYPES ty_wb_object_type     TYPE c LENGTH 4.
  TYPES ty_wb_object_sub_type TYPE c LENGTH 3.

  TYPES:
    BEGIN OF ty_workbench_object_type,
      workbench_object_type    TYPE ty_wb_object_type,
      workbench_object_subtype TYPE ty_wb_object_sub_type,
    END OF ty_workbench_object_type.

  TYPES ty_workbench_object_types      TYPE SORTED TABLE OF ty_workbench_object_type WITH UNIQUE DEFAULT KEY.

  TYPES ty_number_of_focused_resources TYPE string.

  CONSTANTS:
    BEGIN OF co_number_of_focused_resources,
      exactly_one   TYPE ty_number_of_focused_resources VALUE 'EXACTLY_ONE',
      at_least_one  TYPE ty_number_of_focused_resources VALUE 'AT_LEAST_ONE',
      more_than_one TYPE ty_number_of_focused_resources VALUE 'MORE_THAN_ONE',
      any           TYPE ty_number_of_focused_resources VALUE 'ANY',
    END OF co_number_of_focused_resources.

  TYPES:
    BEGIN OF ty_filters,
      number_of_focused_resources TYPE ty_number_of_focused_resources,
      supported_dev_object_types  TYPE ty_workbench_object_types,
    END OF ty_filters.

  TYPES ty_action_title TYPE c LENGTH 30.

  TYPES:
    BEGIN OF ty_adt_saia_object,
      title                        TYPE ty_action_title,
      summary                      TYPE string,
      implementing_class           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      input_ui_configuration_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_adt_saia_object.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_100,
      general_information TYPE ty_adt_saia_object,
      filters             TYPE ty_filters,
    END OF ty_main.

ENDINTERFACE.
