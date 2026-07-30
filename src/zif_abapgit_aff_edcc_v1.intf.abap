INTERFACE zif_abapgit_aff_edcc_v1
  PUBLIC.


  TYPES ty_sequence_number   TYPE c LENGTH 3.
  TYPES ty_short_description TYPE c LENGTH 30.
  TYPES:
    BEGIN OF ty_message_type,
      name                        TYPE c LENGTH 20,
      tax_authority_document_type TYPE c LENGTH 20,
    END OF ty_message_type.
  TYPES ty_message_types TYPE SORTED TABLE OF ty_message_type WITH UNIQUE KEY name.
  TYPES:
    BEGIN OF ty_tax_authority_table,
      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_tax_authority_table.
  TYPES ty_tax_authority_tables TYPE SORTED TABLE OF ty_tax_authority_table WITH UNIQUE KEY name.
  TYPES ty_position_number      TYPE n LENGTH 2.
  TYPES ty_result_process       TYPE c LENGTH 10.
  TYPES ty_field_value          TYPE c LENGTH 40.
  TYPES ty_check_number         TYPE n LENGTH 5.
  TYPES ty_long_description     TYPE c LENGTH 120.
  TYPES:
    BEGIN OF ty_existence_check,
      check_id       TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_name     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_value    TYPE ty_field_value,
      result_process TYPE ty_result_process,
    END OF ty_existence_check.
  TYPES:
    BEGIN OF ty_status_check,
      check_id             TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      sequence_number      TYPE ty_sequence_number,
      source_field_name_1  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_field_value_1 TYPE ty_field_value,
      source_field_name_2  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_field_value_2 TYPE ty_field_value,
      result_process       TYPE ty_result_process,
    END OF ty_status_check.
  TYPES ty_status_checks        TYPE SORTED TABLE OF ty_status_check WITH UNIQUE KEY check_id sequence_number.
  TYPES ty_mismatch_field_group TYPE c LENGTH 20.
  TYPES ty_level                TYPE c LENGTH 1.
  TYPES ty_comparison_sequence  TYPE c LENGTH 5.
  TYPES ty_check_formula        TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_comparison_field,
      representation_type TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_name          TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      comparison_sequence TYPE ty_comparison_sequence,
    END OF ty_comparison_field.
  TYPES ty_comparison_fields TYPE SORTED TABLE OF ty_comparison_field WITH UNIQUE KEY representation_type.
  TYPES:
    BEGIN OF ty_comparison_field_group,
      name              TYPE ty_mismatch_field_group,
      description       TYPE ty_short_description,
      level             TYPE ty_level,
      check_formula     TYPE ty_check_formula,
      result_process    TYPE ty_result_process,
      comparison_fields TYPE ty_comparison_fields,
    END OF ty_comparison_field_group.
  TYPES ty_comparison_field_groups TYPE SORTED TABLE OF ty_comparison_field_group WITH UNIQUE KEY name.
  TYPES:
    BEGIN OF ty_content_check,
      check_id                TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_number            TYPE ty_check_number,
      data_source             TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      additional_description  TYPE zif_abapgit_aff_types_v1=>ty_description_60,
      comparison_field_groups TYPE ty_comparison_field_groups,
    END OF ty_content_check.
  TYPES ty_content_checks    TYPE SORTED TABLE OF ty_content_check WITH UNIQUE KEY check_id check_number.
  TYPES ty_control_parameter TYPE c LENGTH 2.
  TYPES:
    BEGIN OF ty_check_sequence,
      check_id          TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      control_parameter TYPE ty_control_parameter,
    END OF ty_check_sequence.
  TYPES ty_checks_sequence TYPE STANDARD TABLE OF ty_check_sequence WITH KEY check_id.
  TYPES:
    BEGIN OF ty_representation_type,
      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_representation_type.
  TYPES ty_representation_types TYPE SORTED TABLE OF ty_representation_type WITH UNIQUE KEY name.
  TYPES:
    BEGIN OF ty_checks,
      existence_check TYPE ty_existence_check,
      status_checks   TYPE ty_status_checks,
      content_checks  TYPE ty_content_checks,
      check_sequence  TYPE ty_checks_sequence,
    END OF ty_checks.
  TYPES:
    BEGIN OF ty_comparison_type,
      name                 TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description          TYPE ty_long_description,
      position_number      TYPE ty_position_number,
      implementing_class   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      data_source          TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      checks               TYPE ty_checks,
      representation_types TYPE ty_representation_types,
    END OF ty_comparison_type.
  TYPES ty_comparison_types TYPE SORTED TABLE OF ty_comparison_type WITH UNIQUE KEY name.
  TYPES ty_relevance        TYPE c LENGTH 1.
  TYPES ty_event_name       TYPE c LENGTH 25.
  TYPES:
    BEGIN OF ty_comparison_check,
      comparison_type TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_id        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_comparison_check.
  TYPES ty_comparisons_checks TYPE SORTED TABLE OF ty_comparison_check WITH UNIQUE KEY
            comparison_type check_id.
  TYPES:
    BEGIN OF ty_check_relevance,
      comparison_type TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      check_id        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      relevance       TYPE ty_relevance,
    END OF ty_check_relevance.
  TYPES ty_check_relevances TYPE SORTED TABLE OF ty_check_relevance WITH UNIQUE KEY
                                  comparison_type check_id.
  TYPES:
    BEGIN OF ty_event,
      name                        TYPE ty_event_name,
      comparison_types_and_checks TYPE ty_comparisons_checks,
      check_relevance             TYPE ty_check_relevances,
    END OF ty_event.
  TYPES ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY name.

  TYPES:
    BEGIN OF ty_edoc_type,
      name TYPE c LENGTH 10,
    END OF ty_edoc_type.
  TYPES ty_edoc_types  TYPE SORTED TABLE OF ty_edoc_type WITH UNIQUE KEY name.
  TYPES ty_resultgroup TYPE c LENGTH 20.
  TYPES:
    BEGIN OF ty_results_process,
      name TYPE ty_result_process,
    END OF ty_results_process.
  TYPES ty_result_processes TYPE SORTED TABLE OF ty_results_process WITH UNIQUE KEY name.
  TYPES:
    BEGIN OF ty_inconsistency_category,
      name                   TYPE ty_resultgroup,
      description            TYPE ty_long_description,
      country_view_extension TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      result_processes       TYPE ty_result_processes,
    END OF ty_inconsistency_category.
  TYPES ty_inconsistency_categories TYPE SORTED TABLE OF ty_inconsistency_category WITH UNIQUE KEY name.
  TYPES ty_field_type               TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_additional_selection_field,
      view_name  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field_type TYPE ty_field_type,
    END OF  ty_additional_selection_field.
  TYPES ty_additional_selection_fields TYPE SORTED TABLE OF ty_additional_selection_field WITH UNIQUE KEY
            view_name field_name.
  TYPES:
    BEGIN OF ty_comparison_types_and_events,
      comparison_types         TYPE ty_comparison_types,
      events                   TYPE ty_events,
      inconsistency_categories TYPE ty_inconsistency_categories,
    END OF ty_comparison_types_and_events.
  TYPES:
    BEGIN OF ty_attributes,
      country_code TYPE c LENGTH 2,
    END OF ty_attributes.
  TYPES:
    BEGIN OF ty_main,
      format_version              TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                      TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information         TYPE ty_attributes,
      representation_types        TYPE ty_representation_types,
      additional_selection_fields TYPE ty_additional_selection_fields,
      tax_authority_message_types TYPE ty_message_types,
      tax_authority_tables        TYPE ty_tax_authority_tables,
      edocument_types             TYPE ty_edoc_types,
      comparison_types_and_events TYPE ty_comparison_types_and_events,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_field_type,
      select_options            TYPE ty_field_type VALUE 'S',
      parameter_single_value    TYPE ty_field_type VALUE 'N',
      parameter_multiple_values TYPE ty_field_type VALUE 'P',
    END OF co_field_type.
  CONSTANTS:
    BEGIN OF co_check_formula,
      field                       TYPE ty_check_formula VALUE '1',
      field_with_abs_tolerance    TYPE ty_check_formula VALUE '2',
      field_without_abs_tolerance TYPE ty_check_formula VALUE '3',
    END OF co_check_formula.
  CONSTANTS:
    BEGIN OF co_field_group_level,
      header TYPE ty_level VALUE 'H',
      item   TYPE ty_level VALUE 'I',
    END OF co_field_group_level.

  CONSTANTS:
    BEGIN OF co_control_parameter,
      always_run_check              TYPE ty_control_parameter VALUE '00',
      run_check_if_no_inconsistency TYPE ty_control_parameter VALUE '01',
    END OF co_control_parameter.
  CONSTANTS:
    BEGIN OF co_relevance,
      relevant     TYPE ty_relevance VALUE 'R',
      not_relevant TYPE ty_relevance VALUE 'N',
      unchanged    TYPE ty_relevance VALUE 'U',
    END OF co_relevance.
ENDINTERFACE.
