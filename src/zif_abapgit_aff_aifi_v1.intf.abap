INTERFACE zif_abapgit_aff_aifi_v1
  PUBLIC.

  TYPES ty_selection_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_selection_type,
      single   TYPE ty_selection_type VALUE ' ',
      multiple TYPE ty_selection_type VALUE 'M',
      document TYPE ty_selection_type VALUE 'D',
    END OF co_selection_type.

  TYPES ty_structure_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_structure_type,
      source_structure      TYPE ty_structure_type VALUE ' ',
      destination_structure TYPE ty_structure_type VALUE 'S',
    END OF co_structure_type.

  TYPES ty_expiration_behavior_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_expiration_behavior_type,
      delete  TYPE ty_expiration_behavior_type VALUE 'D',
      archive TYPE ty_expiration_behavior_type VALUE 'A',
    END OF co_expiration_behavior_type.

  TYPES ty_direction_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_direction_type,
      inbound  TYPE ty_direction_type VALUE 'I',
      outbound TYPE ty_direction_type VALUE 'O',
      both     TYPE ty_direction_type VALUE ' ',
      internal TYPE ty_direction_type VALUE 'S',
    END OF co_direction_type.

  TYPES:
    BEGIN OF ty_soap_settings,
      " SOAP / web service class is stored in /AIF/T_FINF-PROXYCLASSNAMECL type /aif/proxy_outbound
      soap_class                    TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " SOAP / web service method is stored in /AIF/T_FINF-PRX_METHOD type /aif/proxy_method
      soap_method                   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " SOAP / web service record type is stored in /AIF/T_FINF-RECTYPERAW type /aif/rectyperaw
      soap_record_type              TYPE c LENGTH 45,
      " /AIF/PROXY_XML_TRANSFORMATION
      uses_proxy_xml_transformation TYPE abap_bool,
      " /AIF/PRX_XXML
      uses_extended_xml_handling    TYPE abap_bool,
    END OF ty_soap_settings.

  TYPES:
    BEGIN OF ty_event_settings,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_repository_id)
      repository_id        TYPE c LENGTH 10,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_id)
      registration_id      TYPE c LENGTH 36,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_version)
      registration_version TYPE n LENGTH 4,
      " EEE - Enterprise Event Engine (type  /iwxbe/descr_topic)
      topic                TYPE c LENGTH 255,
    END OF ty_event_settings.

  TYPES:
    BEGIN OF ty_bgpf_settings,
      " bgPF (type /aif/bgp_opid_e)
      operation_id         TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " bgPF (type /aif/bgp_variant_id_e)
      operation_variant_id TYPE n LENGTH 10,
      " bgPF (type /aif/bgp_variant_id_e)
      operation_variant    TYPE string,
    END OF ty_bgpf_settings.

  TYPES:
    BEGIN OF ty_general_information,
      integration_type      TYPE c LENGTH 40,
      scenario              TYPE c LENGTH 40,
      soap_settings         TYPE ty_soap_settings,
      event_settings        TYPE ty_event_settings,
      bgpf_settings         TYPE ty_bgpf_settings,
      " (type /aif/ns_obj_name)
      namespace             TYPE c LENGTH 15,
      " (type /aif/ifname)
      interface_name        TYPE c LENGTH 10,
      " (type /aif/ifversion)
      interface_version     TYPE c LENGTH 5,
      " (type /aif/if_ddic_struct_raw)
      data_structure        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/if_ddic_struct)
      mapped_data_structure TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/msg_tbl)
      index_table           TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/ifdisplay)
      display_name          TYPE c LENGTH 120,
      " (relevant types /AIF/MSG_LIFETIME && /AIF/DATA_OLDER_THAN_E)
      retention_period      TYPE c LENGTH 3,
      expiration_behavior   TYPE ty_expiration_behavior_type,
      " (type /aif/system_field)
      sending_system        TYPE string,
      " (type /aif/ifdirection)
      direction             TYPE ty_direction_type,
      " /AIF/PRE_PROCESSING
      uses_preprocessing    TYPE abap_bool,
      uses_postprocesssing  TYPE abap_bool,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_recipient,
      " (type /aif/recipient_object_name)
      recipient TYPE c LENGTH 40,
    END OF ty_recipient.

  TYPES ty_recipients TYPE STANDARD TABLE OF ty_recipient WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_key_field_qualifier,
      " /AIF/ENABLE_QUALIFIER
      uses_qualifier       TYPE abap_bool,
      " (type /aif/qualifier_fld_name_kfld)
      qualifier_field_name TYPE c LENGTH 120,
      " (type /aif/qualifier_operator)
      qualifier_operator   TYPE zif_abapgit_aff_types_v1=>ty_option,
      " (type /aif/qualifier_value_kfld)
      qualifier_value      TYPE c LENGTH 45,
    END OF ty_key_field_qualifier.

  TYPES:
    BEGIN OF ty_key_field_selection,
      " (type /aif/multi_sel_type)
      selection_type              TYPE ty_selection_type,
      " (type /aif/msg_tbl)
      message_index_table         TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/field_number_parent)
      parent_field_sequence       TYPE n LENGTH 3,
      " (type /aif/icon_l4)
      icon                        TYPE c LENGTH 4,
      " (type /aif/tooltip)
      icon_tooltip                TYPE c LENGTH 40,
      " (type /aif/alertfieldname)
      alert_field_name            TYPE c LENGTH 45,
      " (type /aif/alrt_catfn)
      category_field_name         TYPE c LENGTH 32,
      " /AIF/IS_HIDDEN, swap to positive stature
      is_tree_node_visible        TYPE abap_bool,
      " (type /aif/alertrelevant)
      is_alert_recipient_relevant TYPE abap_bool,
    END OF ty_key_field_selection.

  TYPES:
    BEGIN OF ty_fiori_features,
      " (type /aif/semantic_object)
      semantic_object             TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/semantic_action)
      semantic_action             TYPE zif_abapgit_aff_types_v1=>ty_description_60,
      " /AIF/NOT_SHOW_FIELD
      is_shown_in_message_monitor TYPE abap_bool,
      " /AIF/IS_DEFAULT_FIELD
      is_shown_by_default         TYPE abap_bool,
    END OF ty_fiori_features.

  TYPES:
    " Related key fields used by key field rules
    BEGIN OF ty_rule_key_field,
      " (type /aif/key_fieldname_enh)
      name                 TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/field_number_enh)
      field_sequnce_number TYPE c LENGTH 3,
    END OF ty_rule_key_field.

  TYPES ty_rule_key_fields TYPE STANDARD TABLE OF ty_rule_key_field WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_key_field_rule,
      rule_key_fields TYPE ty_rule_key_fields,
      rule_class      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      rule_method     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_key_field_rule.

  TYPES:
    BEGIN OF ty_key_field,
      " (type /aif/key_fieldname, field of index table)
      name                TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type rollname)
      data_element        TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      " (type /aif/stexti)
      select_option_name  TYPE c LENGTH 8,
      " (type /aif/lfieldname_kflds, field of sap/raw structure)
      field_name          TYPE c LENGTH 120,
      " (type /aif/raw_or_sap_kflds)
      structure_type      TYPE ty_structure_type,
      " /AIF/FLD_IS_SELECT_OPT
      is_select_option    TYPE abap_bool,
      " /AIF/IS_COL
      is_column_display   TYPE abap_bool,
      key_field_qualifier TYPE ty_key_field_qualifier,
      key_field_selection TYPE ty_key_field_selection,
      key_field_rule      TYPE ty_key_field_rule,
      fiori_features      TYPE ty_fiori_features,
    END OF ty_key_field.

  TYPES ty_key_fields TYPE STANDARD TABLE OF ty_key_field WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_error_handling_config,
      " (type /aif/countnr)
      sequence      TYPE n LENGTH 3,
      " (type /aif/field_path)
      component     TYPE string,
      is_changeable TYPE abap_bool,
      is_hidden     TYPE abap_bool,
      " (type /aif/use_ddic)
      uses_ddic     TYPE abap_bool,
      " (type /aif/err_lb_description)
      description   TYPE c LENGTH 128,
      " (type  /aif/err_lb_short)
      short_text    TYPE c LENGTH 10,
      " (type /aif/err_lb_medium)
      medium_text   TYPE c LENGTH 20,
      " (type /aif/err_lb_long)
      long_text     TYPE c LENGTH 40,
    END OF ty_error_handling_config.

  TYPES ty_error_handling_configs TYPE STANDARD TABLE OF ty_error_handling_config WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_engines,
      " (type /aif/appl_engine_id)
      " use type c instead of n, so value '000' will be displayed
      application_engine TYPE c LENGTH 3,
      " (type /aif/persistency_engine_id)
      persistency_engine TYPE c LENGTH 3,
      " (type /aif/selection_engine_id)
      selection_engine   TYPE c LENGTH 3,
      " (type /aif/logging_engine_id)
      logging_engine     TYPE c LENGTH 3,
    END OF ty_engines.

  TYPES:
    BEGIN OF ty_main,
      format_version         TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                 TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information    TYPE ty_general_information,
      recipient_assignment   TYPE ty_recipients,
      error_handling_configs TYPE ty_error_handling_configs,
      engines                TYPE ty_engines,
      key_fields             TYPE ty_key_fields,
    END OF ty_main.

ENDINTERFACE.
