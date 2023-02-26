INTERFACE zif_abapgit_aff_func_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_parameter,
      name        TYPE c LENGTH 30,
      description TYPE c LENGTH 79,
    END OF ty_parameter.


  TYPES ty_parameters TYPE SORTED TABLE OF ty_parameter WITH UNIQUE KEY name.


  TYPES ty_processing_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_processing_type,
      normal TYPE ty_processing_type VALUE 'N',
      rfc    TYPE ty_processing_type VALUE 'R',
      update TYPE ty_processing_type VALUE 'U',
    END OF co_processing_type.


  TYPES ty_rfc_scope TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_rfc_scope,
      from_same_client_and_user TYPE ty_rfc_scope VALUE 'I',
      from_same_system          TYPE ty_rfc_scope VALUE 'C',
      from_any_system           TYPE ty_rfc_scope VALUE 'E',
      not_classified            TYPE ty_rfc_scope VALUE ' ',
    END OF co_rfc_scope.

  TYPES ty_rfc_version TYPE c LENGTH 10.

  CONSTANTS:
    BEGIN OF co_rfc_version,
      fast_serialization_required TYPE ty_rfc_version VALUE '1',
      any                         TYPE ty_rfc_version VALUE ' ',
    END OF co_rfc_version.


  TYPES:
    BEGIN OF ty_rfc_properties,
      basxml_enabled TYPE abap_bool,
      rfc_scope       TYPE ty_rfc_scope,
      rfc_version        TYPE ty_rfc_version,
      abap_from_java TYPE abap_bool,
      java_from_abap TYPE abap_bool,
      java_remote    TYPE abap_bool,
    END OF ty_rfc_properties.

  TYPES ty_update_task_kind TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_update_task_kind,
      start_immediately            TYPE ty_update_task_kind VALUE '1',
      start_delayed                TYPE ty_update_task_kind VALUE '2',
      start_immediately_no_restart TYPE ty_update_task_kind VALUE '3',
      collective_run               TYPE ty_update_task_kind VALUE '5',
      unsupported_kind             TYPE ty_update_task_kind VALUE '6',
    END OF co_update_task_kind.

  TYPES ty_release_state TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_release_state,
      not_released          TYPE ty_release_state VALUE 'N',
      released              TYPE ty_release_state VALUE 'E',
      released_sap_internal TYPE ty_release_state VALUE 'I',
      obsolete              TYPE ty_release_state VALUE 'O',
      release_planned       TYPE ty_release_state VALUE 'M',
    END OF co_release_state.

  TYPES:
    BEGIN OF ty_update_properties,
      update_task_kind TYPE ty_update_task_kind,
    END OF ty_update_properties.


  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_only_description,
      processing_type      TYPE ty_processing_type,
      rfc_properties       TYPE ty_rfc_properties,
      update_properties    TYPE ty_update_properties,
      release_state        TYPE ty_release_state,
      release_date         TYPE sy-datum,
      global               TYPE abap_bool,
      exception_classes    TYPE abap_bool,
      application          TYPE c LENGTH 1,
      client               TYPE sy-mandt,
      active_function_exit TYPE abap_bool,
      include_number       TYPE n LENGTH 2,
      not_executable       TYPE abap_bool,
      edit_locked          TYPE abap_bool,
      parameters           TYPE ty_parameters,
      exceptions           TYPE ty_parameters,
    END OF ty_main.

ENDINTERFACE.
