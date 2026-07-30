INTERFACE zif_abapgit_aff_ints_v1
  PUBLIC.

  TYPES ty_object_status TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_object_status,
      error       TYPE ty_object_status VALUE 'E',
      termination TYPE ty_object_status VALUE 'A',
      information TYPE ty_object_status VALUE 'I',
      warning     TYPE ty_object_status VALUE 'W',
      success     TYPE ty_object_status VALUE 'S',
    END OF co_object_status.

  TYPES ty_scenario_technology TYPE c LENGTH 20.
  CONSTANTS:
    BEGIN OF co_scenario_technology,
      side_by_side TYPE ty_scenario_technology VALUE 'SIDEBYSIDE',
      embedded   TYPE ty_scenario_technology VALUE 'EMBEDDED',
    END OF co_scenario_technology.

  TYPES ty_logical_object_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_logical_object_type,
      table_function TYPE ty_logical_object_type VALUE 'F',
      cds_view       TYPE ty_logical_object_type VALUE 'V',
      class          TYPE ty_logical_object_type VALUE 'C',
      dcl            TYPE ty_logical_object_type VALUE 'D',
      model          TYPE ty_logical_object_type VALUE 'M',
      avas           TYPE ty_logical_object_type VALUE 'A',
    END OF co_logical_object_type.

  TYPES:
    BEGIN OF ty_scenario_ddl_object,
      object_name         TYPE c LENGTH 40,
      object_type         TYPE c LENGTH 4,
      object_status       TYPE ty_object_status,
      logical_object_type TYPE ty_logical_object_type,
    END OF ty_scenario_ddl_object,

    BEGIN OF ty_general_information,
      scenario_type              TYPE c LENGTH 256,
      scenario_technology        TYPE ty_scenario_technology,
      is_extensible              TYPE abap_bool,
      is_multi_active_model      TYPE abap_bool,
      is_data_management_enabled TYPE abap_bool,
      scenario_technical_id      TYPE c LENGTH 64,
      state                      TYPE c LENGTH 10,
      islm_version               TYPE p LENGTH 4 DECIMALS 2,
    END OF ty_general_information,

    BEGIN OF ty_class_information,
      prediction_class         TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      prerequisite_check_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_class_information,

    BEGIN OF ty_turnkey_information,
      is_turnkey_auto_switch_on TYPE abap_bool,
      turnkey_type              TYPE c LENGTH 10,
      turnkey_class             TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_turnkey_information,

    BEGIN OF ty_connection_information,
      usage_type    TYPE c LENGTH 10,
      oauth_profile TYPE c LENGTH 30,
    END OF ty_connection_information,

    BEGIN OF ty_binding,
      binding_name     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      reference_object TYPE c LENGTH 36,
    END OF ty_binding,

    BEGIN OF ty_signature,
      signature_name        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      signature_type        TYPE c LENGTH 32,
      signature_description TYPE c LENGTH 100,
      field_name            TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_position        TYPE i,
      storage_type          TYPE c LENGTH 100,
      field_role            TYPE c LENGTH 30,
      data_management_type  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_signature,

    BEGIN OF ty_modelling_context,
      modelling_context_name        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      modelling_context_id          TYPE c LENGTH 36,
      modelling_context_description TYPE c LENGTH 100,
    END OF ty_modelling_context,

    BEGIN OF ty_parameter,
      parameter_name        TYPE c LENGTH 256,
      parameter_type        TYPE c LENGTH 32,
      parameter_description TYPE string,
      storage_type          TYPE c LENGTH 100,
      has_context           TYPE abap_bool,
      parameter_size        TYPE i,
      parameter_id          TYPE c LENGTH 36,
      parameter_context     TYPE c LENGTH 1000,
      parameter_value       TYPE string,
    END OF ty_parameter,

    BEGIN OF ty_additional_info,
      additional_info_key TYPE c LENGTH 50,
      value_id            TYPE i,
      value               TYPE c LENGTH 1024,
      position_id         TYPE i,
      key_text_label      TYPE c LENGTH 255,
      value_text_label    TYPE c LENGTH 255,
    END OF ty_additional_info,

    BEGIN OF ty_sbs_segment_field,
      field_name     TYPE c LENGTH 30,
      field_position TYPE i,
      is_key         TYPE abap_bool,
    END OF ty_sbs_segment_field,

    BEGIN OF ty_main,
      format_version         TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                 TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      general_information    TYPE ty_general_information,
      class_information      TYPE ty_class_information,
      turnkey_information    TYPE ty_turnkey_information,
      connection_information TYPE ty_connection_information,
      modelling_context      TYPE ty_modelling_context,
      scenario_ddl_objects   TYPE STANDARD TABLE OF ty_scenario_ddl_object WITH DEFAULT KEY,
      bindings               TYPE STANDARD TABLE OF ty_binding WITH DEFAULT KEY,
      signatures             TYPE STANDARD TABLE OF ty_signature WITH DEFAULT KEY,
      parameters             TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY,
      additional_info        TYPE STANDARD TABLE OF ty_additional_info WITH DEFAULT KEY,
      sbs_segment_fields     TYPE STANDARD TABLE OF ty_sbs_segment_field WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
