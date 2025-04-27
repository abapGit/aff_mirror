INTERFACE zif_abapgit_aff_intm_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_general_information,
      model_name           TYPE c LENGTH 30,
      model_type           TYPE c LENGTH 256,
      intelligent_scenario TYPE c LENGTH 20,
      modelling_context_id TYPE c LENGTH 36,
      adapter_id           TYPE c LENGTH 32,
      native_model_type    TYPE c LENGTH 256,
      model_specification  TYPE string,
      model_definition     TYPE string,
      state                TYPE c LENGTH 10,
      signature            TYPE string,
      bindings             TYPE string,
      is_enhancement       TYPE abap_bool,
      executable_id        TYPE c LENGTH 64,
      llm_name             TYPE string,
      llm_version          TYPE c LENGTH 30,
    END OF ty_general_information,

    BEGIN OF ty_segment_field,
      field_name     TYPE c LENGTH 30,
      field_position TYPE i,
      is_key         TYPE abap_bool,
    END OF ty_segment_field,

    BEGIN OF ty_prompt_template,
      prompt_template_name        TYPE c LENGTH 30,
      prompt_template_description TYPE string,
      prompt                      TYPE string,
      is_visible                  TYPE abap_bool,
    END OF ty_prompt_template,

    BEGIN OF ty_main,
      format_version         TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                 TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      general_information    TYPE ty_general_information,
      model_segment_fields   TYPE STANDARD TABLE OF ty_segment_field WITH DEFAULT KEY,
      model_prompt_templates TYPE STANDARD TABLE OF ty_prompt_template WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
