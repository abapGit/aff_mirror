INTERFACE zif_abapgit_aff_aifa_v1
   PUBLIC.

  TYPES ty_field_type TYPE c LENGTH 5.
  CONSTANTS:
    BEGIN OF co_field_type,
      source_structure      TYPE c LENGTH 5 VALUE 'SRC_S',
      destination_structure TYPE c LENGTH 5 VALUE 'DST_S',
      constant              TYPE c LENGTH 5 VALUE 'CONST',
      system_field          TYPE c LENGTH 5 VALUE 'SYSTF',
      sending_system        TYPE c LENGTH 5 VALUE 'SND_S',
      current_line_number   TYPE c LENGTH 5 VALUE 'LINEN',
      hierarchical_mapping  TYPE c LENGTH 5 VALUE 'MAP_H',
    END OF co_field_type.

  TYPES ty_error_handling_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_error_handling_type,
      treat_as_error TYPE c LENGTH 1 VALUE '',
      ignore_data    TYPE c LENGTH 1 VALUE 'I',
    END OF co_error_handling_type.

  TYPES:
    BEGIN OF ty_field_to_check,
      type  TYPE ty_field_type,
      name  TYPE string,
      value TYPE string,
    END OF ty_field_to_check,
    ty_fields_to_check TYPE STANDARD TABLE OF ty_field_to_check WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_general_information,
      namespace           TYPE c LENGTH 15,
      aif_action          TYPE c LENGTH 20,
      main_component_type TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      implementing_class  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    BEGIN OF ty_check_details,
      id              TYPE n LENGTH 3,
      check           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_behaviour TYPE ty_error_handling_type,
      fields          TYPE ty_fields_to_check,
    END OF ty_check_details,
    ty_checks TYPE STANDARD TABLE OF ty_check_details WITH DEFAULT KEY,

    BEGIN OF ty_field_to_restore,
      name TYPE string,
    END OF ty_field_to_restore,
    ty_fields_to_restore TYPE STANDARD TABLE OF ty_field_to_restore WITH DEFAULT KEY,

    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
      fields_to_restore   TYPE ty_fields_to_restore,
      checks              TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
