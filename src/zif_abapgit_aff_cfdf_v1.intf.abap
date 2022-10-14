INTERFACE zif_abapgit_aff_cfdf_v1
  PUBLIC.

  TYPES: ty_field_name              TYPE c LENGTH 30.
  TYPES: ty_component_identifier    TYPE c LENGTH 5.
  TYPES: ty_business_context        TYPE c LENGTH 30.
  TYPES: ty_code_value              TYPE c LENGTH 30.
  TYPES: ty_data_subject_id_type    TYPE c LENGTH 10.
  TYPES: ty_type                    TYPE c LENGTH 10.
  TYPES: ty_message_direction       TYPE c LENGTH 3.
  TYPES: ty_field_control_property  TYPE c LENGTH 1.
  TYPES: ty_aggregation             TYPE c LENGTH 5.

  TYPES:
    BEGIN OF ty_gs_ui_text,
      language      TYPE sy-langu,

      field_label   TYPE c LENGTH 40,

      field_tooltip TYPE c LENGTH 60,
    END OF ty_gs_ui_text.
  TYPES: ty_gt_ui_text TYPE STANDARD TABLE OF ty_gs_ui_text WITH KEY language.

  TYPES:
    BEGIN OF ty_gs_extended_bus_context,
      business_context     TYPE ty_business_context,

      deviating_field_name TYPE ty_field_name,
    END OF ty_gs_extended_bus_context.
  TYPES: ty_gt_extended_bus_context TYPE STANDARD TABLE OF ty_gs_extended_bus_context WITH KEY business_context.

  TYPES:
    BEGIN OF ty_gs_extended_cds_view,
      cds_view_name                 TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      business_context              TYPE ty_business_context,

      is_search_relevant            TYPE abap_bool,

      badi_impl_for_visibility_ctrl TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      field_control_property        TYPE ty_field_control_property,
    END OF ty_gs_extended_cds_view.
  TYPES: ty_gt_extended_cds_view TYPE STANDARD TABLE OF ty_gs_extended_cds_view WITH KEY business_context cds_view_name.

  TYPES:
    BEGIN OF ty_gs_extended_odata_service,
      odata_service_key  TYPE c LENGTH 81,

      business_context   TYPE ty_business_context,

      is_search_relevant TYPE abap_bool,
    END OF ty_gs_extended_odata_service.
  TYPES: ty_gt_extended_odata_service TYPE STANDARD TABLE OF ty_gs_extended_odata_service
                                           WITH KEY business_context odata_service_key.

  TYPES:
    BEGIN OF ty_gs_extended_bus_scenario,
      business_scenario TYPE c LENGTH 30,

      data_transfer     TYPE c LENGTH 30,
    END OF ty_gs_extended_bus_scenario.
  TYPES: ty_gt_extended_bus_scenario TYPE STANDARD TABLE OF ty_gs_extended_bus_scenario WITH KEY business_scenario.

  TYPES:
    BEGIN OF ty_gs_extended_dynpro_context,
      dynpro_context   TYPE c LENGTH 30,

      business_context TYPE ty_business_context,
    END OF ty_gs_extended_dynpro_context.
  TYPES ty_gt_extended_dynpro_context TYPE STANDARD TABLE OF ty_gs_extended_dynpro_context
                                      WITH KEY dynpro_context business_context.

  TYPES:
    BEGIN OF ty_gs_extended_soap_service,
      service_interface    TYPE c LENGTH 30,

      operation            TYPE c LENGTH 30,

      message_direction    TYPE ty_message_direction,

      business_context     TYPE ty_business_context,

      component_identifier TYPE ty_component_identifier,

      external_namespace   TYPE c LENGTH 255,

      external_field_name  TYPE c LENGTH 120,
    END OF ty_gs_extended_soap_service.
  TYPES: ty_gt_extended_soap_service TYPE STANDARD TABLE OF ty_gs_extended_soap_service
                          WITH KEY business_context service_interface operation message_direction component_identifier.

  TYPES:
    BEGIN OF ty_gs_code_list_value_descr,
      language    TYPE sy-langu,

      code        TYPE ty_code_value,

      description TYPE c LENGTH 60,
    END OF ty_gs_code_list_value_descr.
  TYPES: ty_gt_code_list_value_descr TYPE STANDARD TABLE OF ty_gs_code_list_value_descr WITH KEY language code.

  TYPES:
    BEGIN OF ty_gs_code_list_value,
      code        TYPE ty_code_value,

      is_disabled TYPE abap_bool,
    END OF ty_gs_code_list_value.
  TYPES: ty_gt_code_list_value TYPE STANDARD TABLE OF ty_gs_code_list_value WITH KEY code.

  TYPES:
    BEGIN OF ty_gs_value_help_key_mapping,
      component_identifier      TYPE ty_component_identifier,

      value_help_field_name     TYPE ty_field_name,

      dimension_view_field_name TYPE ty_field_name,
    END OF ty_gs_value_help_key_mapping.
  TYPES ty_gt_value_help_key_mapping TYPE STANDARD TABLE OF ty_gs_value_help_key_mapping WITH KEY component_identifier.

  TYPES:
    BEGIN OF ty_gs_value_help_binding,
      cds_view_name                TYPE  zif_abapgit_aff_types_v1=>ty_object_name_30,

      extended_cds_view_field_name TYPE ty_field_name,

      value_help_field_name        TYPE  ty_field_name,
    END OF ty_gs_value_help_binding.
  TYPES ty_gt_value_help_binding TYPE STANDARD TABLE OF ty_gs_value_help_binding
                                 WITH KEY cds_view_name value_help_field_name.

  TYPES:
    BEGIN OF ty_gs_dpp_properties,
      data_subject_id_type       TYPE ty_data_subject_id_type,

      badi_impl_for_data_subject TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_gs_dpp_properties.

  TYPES:
    BEGIN OF ty_gs_characteristic_reference,
      characteristic_name TYPE c LENGTH 30,

      class_type          TYPE c LENGTH 3,

      object_type         TYPE c LENGTH 30,
    END OF ty_gs_characteristic_reference.

  TYPES:
    BEGIN OF ty_main,
      format_version              TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header                      TYPE zif_abapgit_aff_types_v1=>ty_header_60_no_abap_lv,

      external_name               TYPE ty_field_name,

      type                        TYPE ty_type,

      BEGIN OF type_details,
        length                     TYPE i,

        scale                      TYPE i,

        aggregation                TYPE ty_aggregation,

        code_list_uppercase_only   TYPE abap_bool,

        associated_business_object TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

        value_help_view            TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

        dimension_view             TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      END OF type_details,

      data_protection_and_privacy TYPE ty_gs_dpp_properties,

      characteristic_reference    TYPE ty_gs_characteristic_reference,

      ui_texts                    TYPE ty_gt_ui_text,

      code_list_values            TYPE ty_gt_code_list_value,

      code_list_descriptions      TYPE ty_gt_code_list_value_descr,

      extended_business_contexts  TYPE ty_gt_extended_bus_context,

      extended_cds_views          TYPE ty_gt_extended_cds_view,

      extended_odata_services     TYPE ty_gt_extended_odata_service,

      extended_business_scenarios TYPE ty_gt_extended_bus_scenario,

      extended_dynpro_contexts    TYPE ty_gt_extended_dynpro_context,

      extended_soap_services      TYPE ty_gt_extended_soap_service,

      value_help_key_mappings     TYPE ty_gt_value_help_key_mapping,

      value_help_bindings         TYPE ty_gt_value_help_binding,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_type,
      amount_with_currency       TYPE ty_type VALUE 'AMOUNT',
      boolean                    TYPE ty_type VALUE 'BOOLEAN',
      date                       TYPE ty_type VALUE 'DATE',
      email                      TYPE ty_type VALUE 'EMAIL',
      list                       TYPE ty_type VALUE 'LIST',
      number                     TYPE ty_type VALUE 'NUMBER',
      quantity                   TYPE ty_type VALUE 'QUANTITY',
      text                       TYPE ty_type VALUE 'TEXT',
      time                       TYPE ty_type VALUE 'TIME',
      url                        TYPE ty_type VALUE 'URL',
      phone                      TYPE ty_type VALUE 'PHONE',
      amount_without_currency    TYPE ty_type VALUE 'AMNT_ONLY',
      currency_code              TYPE ty_type VALUE 'CURRENCY',
      quantity_only              TYPE ty_type VALUE 'QUAN_ONLY',
      unit_code                  TYPE ty_type VALUE 'UNIT',
      language_code              TYPE ty_type VALUE 'LANGUAGE',
      numerical_text             TYPE ty_type VALUE 'NUMC_TEXT',
      posting_period             TYPE ty_type VALUE 'PST_PERIOD',
      raw                        TYPE ty_type VALUE 'RAW',
      association_to_standard_bo TYPE ty_type VALUE 'ASC_TO_STD',
      timestamp                  TYPE ty_type VALUE 'TIMESTAMP',
      list_based_on_cds_view     TYPE ty_type VALUE 'LIST_CVIEW',
      characteristics_list       TYPE ty_type VALUE 'CHRCS_LIST',
      numeric_interval           TYPE ty_type VALUE 'NUMBER_ITV',
      amount_interval            TYPE ty_type VALUE 'AMOUNT_ITV',
      date_interval              TYPE ty_type VALUE 'DATE_ITV',
      time_interval              TYPE ty_type VALUE 'TIME_ITV',
      association_to_custom_bo   TYPE ty_type VALUE 'ASC_TO_CBO',
    END OF co_type.

  CONSTANTS:
    BEGIN OF co_data_subject_id_type,
      not_applicable           TYPE ty_data_subject_id_type VALUE '',
      central_business_partner TYPE ty_data_subject_id_type VALUE 'BP',
      customer                 TYPE ty_data_subject_id_type VALUE 'CUSTOMER',
      supplier                 TYPE ty_data_subject_id_type VALUE 'SUPPLIER',
      contact_person           TYPE ty_data_subject_id_type VALUE 'CONTACT',
      workforce_person         TYPE ty_data_subject_id_type VALUE 'WFP',
    END OF co_data_subject_id_type.

  CONSTANTS:
    BEGIN OF co_soap_message_direction,
      request  TYPE ty_message_direction VALUE 'REQ',
      response TYPE ty_message_direction VALUE 'RES',
    END OF co_soap_message_direction.

  CONSTANTS:
    BEGIN OF co_aggregation,
      none TYPE ty_aggregation VALUE 'NONE',
      min  TYPE ty_aggregation VALUE 'MIN',
      max  TYPE ty_aggregation VALUE 'MAX',
      sum  TYPE ty_aggregation VALUE 'SUM',
    END OF co_aggregation.

  CONSTANTS:
    BEGIN OF co_field_control_property,
      optional  TYPE ty_field_control_property VALUE '',
      read_only TYPE ty_field_control_property VALUE 'R',
      mandatory TYPE ty_field_control_property VALUE 'M',
    END OF co_field_control_property.

ENDINTERFACE.
