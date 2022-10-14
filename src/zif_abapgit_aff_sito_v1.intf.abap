INTERFACE zif_abapgit_aff_sito_v1
  PUBLIC.

  TYPES ty_sit2_do_scope TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_scope,
      sap      TYPE ty_sit2_do_scope VALUE '01',
      customer TYPE ty_sit2_do_scope VALUE '02',
    END OF co_sit2_do_scope.

  TYPES ty_sit2_do_obj_struc_type TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_obj_struc_type,
      cds       TYPE ty_sit2_do_obj_struc_type VALUE '01',
      in_memory TYPE ty_sit2_do_obj_struc_type VALUE '02',
    END OF co_sit2_do_obj_struc_type.

  TYPES ty_swfeclstyp TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_swfeclstyp,
      business_class       TYPE ty_swfeclstyp VALUE 'BC',
      bor_object_type      TYPE ty_swfeclstyp VALUE 'BO',
      abap_class           TYPE ty_swfeclstyp VALUE 'CL',
      business_object_type TYPE ty_swfeclstyp VALUE 'EO',
      xml_object_type      TYPE ty_swfeclstyp VALUE 'XC',
    END OF co_swfeclstyp.

  TYPES ty_sit2_do_action_type TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_action_type,
      navigation_action TYPE ty_sit2_do_action_type VALUE '01',
      callback_action   TYPE ty_sit2_do_action_type VALUE '02',
    END OF co_sit2_do_action_type.

  TYPES ty_sit2_do_vh_srv_protocol_ver TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_vh_srv_protocol_ver,
      v2 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '01',
      v4 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '02',
    END OF co_sit2_do_vh_srv_protocol_ver.

  TYPES ty_sit2_do_vh_srv_path_type TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_vh_srv_path_type,
      standard TYPE ty_sit2_do_vh_srv_path_type VALUE '01',
      custom   TYPE ty_sit2_do_vh_srv_path_type VALUE '02',
    END OF co_sit2_do_vh_srv_path_type.

  TYPES ty_sit2_do_vh_app_type TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_vh_app_type,
      all_apps TYPE ty_sit2_do_vh_app_type VALUE '01',
    END OF co_sit2_do_vh_app_type.

  TYPES ty_sit2_do_vh_type TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_sit2_do_vh_type,
      service TYPE ty_sit2_do_vh_type VALUE '01',
    END OF co_sit2_do_vh_type.

  TYPES:
    BEGIN OF ty_sit2_obj_struc_t,
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_struc_t,

    BEGIN OF ty_sit2_obj_str_sk,
      field       TYPE c LENGTH 30,
      field_order TYPE n LENGTH 2,
    END OF ty_sit2_obj_str_sk,

    ty_sit2_obj_str_sk_list TYPE SORTED TABLE OF ty_sit2_obj_str_sk WITH UNIQUE KEY field_order,

    BEGIN OF ty_sit2_os_vh_map,
      field_name TYPE c LENGTH 30,
      app_type   TYPE ty_sit2_do_vh_app_type,
      type       TYPE ty_sit2_do_vh_type,
      scope      TYPE ty_sit2_do_scope,
    END OF ty_sit2_os_vh_map,

    ty_sit2_os_vh_map_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map WITH DEFAULT KEY,

    BEGIN OF ty_sit2_os_vh_map_s,
      id         TYPE c LENGTH 32,
      field_name TYPE c LENGTH 30,
      type       TYPE ty_sit2_do_vh_app_type,
      entity_set TYPE c LENGTH 40,
      property   TYPE c LENGTH 40,
    END OF ty_sit2_os_vh_map_s,

    ty_sit2_os_vh_map_s_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map_s WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_event_t,
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_event_t,

    BEGIN OF ty_sit2_obj_act_t,
      name        TYPE c LENGTH 40,
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_act_t,

    BEGIN OF ty_sit2_obj_act_nav,
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_nav,

    BEGIN OF ty_sit2_obj_act_cb,
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_cb,

    BEGIN OF ty_sit2_obj_par,
      name TYPE c LENGTH 30,
    END OF ty_sit2_obj_par,

    ty_sit2_obj_par_list TYPE STANDARD TABLE OF ty_sit2_obj_par WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_vh_s_p,
      entity_set TYPE c LENGTH 40,
      property   TYPE c LENGTH 40,
    END OF ty_sit2_obj_vh_s_p,

    ty_sit2_obj_vh_s_p_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s_p WITH DEFAULT KEY,

    BEGIN OF ty_sit2_object_t,
      name        TYPE c LENGTH 40,
      description TYPE c LENGTH 255,
    END OF ty_sit2_object_t,

    BEGIN OF ty_sit2_obj_struc,
      id                   TYPE c LENGTH 32,
      name                 TYPE c LENGTH 30,
      type                 TYPE ty_sit2_do_obj_struc_type,
      reusable             TYPE abap_bool,
      scope                TYPE ty_sit2_do_scope,
      sap_object_node_type TYPE c LENGTH 30,
      text                 TYPE ty_sit2_obj_struc_t,
      semantic_keys        TYPE ty_sit2_obj_str_sk_list,
      value_help_mappings  TYPE ty_sit2_os_vh_map_list,
      services             TYPE ty_sit2_os_vh_map_s_list,
    END OF ty_sit2_obj_struc,

    ty_sit2_obj_struc_list TYPE STANDARD TABLE OF ty_sit2_obj_struc WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_events,
      id                     TYPE c LENGTH 32,
      object                 TYPE c LENGTH 32,
      type                   TYPE c LENGTH 32,
      reusable               TYPE abap_bool,
      scope                  TYPE ty_sit2_do_scope,
      category               TYPE ty_swfeclstyp,
      parameter_structure_id TYPE c LENGTH 32,
      text                   TYPE ty_sit2_obj_event_t,
    END OF ty_sit2_obj_events,

    ty_sit2_obj_events_list TYPE STANDARD TABLE OF ty_sit2_obj_events WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_act,
      id          TYPE c LENGTH 32,
      type        TYPE ty_sit2_do_action_type,
      reusable    TYPE abap_bool,
      scope       TYPE ty_sit2_do_scope,
      text        TYPE ty_sit2_obj_act_t,
      navigation TYPE ty_sit2_obj_act_nav,
      callback   TYPE ty_sit2_obj_act_cb,
    END OF ty_sit2_obj_act,

    ty_sit2_obj_act_list TYPE STANDARD TABLE OF ty_sit2_obj_act WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_nav,
      id                     TYPE c LENGTH 32,
      reusable               TYPE abap_bool,
      scope                  TYPE ty_sit2_do_scope,
      semantic_object        TYPE c LENGTH 50,
      semantic_object_action TYPE c LENGTH 50,
      parameters             TYPE ty_sit2_obj_par_list,
    END OF ty_sit2_obj_nav,

    ty_sit2_obj_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_nav WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_cb,
      id         TYPE c LENGTH 32,
      reusable   TYPE abap_bool,
      scope      TYPE ty_sit2_do_scope,
      class_name TYPE c LENGTH 30,
      parameters TYPE ty_sit2_obj_par_list,
    END OF ty_sit2_obj_cb,

    ty_sit2_obj_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_cb WITH DEFAULT KEY,

    BEGIN OF ty_sit2_obj_vh_s,
      id                           TYPE c LENGTH 32,
      reusable                     TYPE abap_bool,
      scope                        TYPE ty_sit2_do_scope,
      protocol_version             TYPE ty_sit2_do_vh_srv_protocol_ver,
      path_type                    TYPE ty_sit2_do_vh_srv_path_type,
      custom_path                  TYPE c LENGTH 255,
      binding                      TYPE c LENGTH 40,
      definition                   TYPE c LENGTH 30,
      version                      TYPE n LENGTH 4,
      value_help_service_providers TYPE ty_sit2_obj_vh_s_p_list,
    END OF ty_sit2_obj_vh_s,

    ty_sit2_obj_vh_s_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s WITH DEFAULT KEY,

    BEGIN OF ty_sit2_object,
      reusable            TYPE abap_bool,
      scope               TYPE ty_sit2_do_scope,
      sap_object_type     TYPE c LENGTH 30,
      extensible          TYPE abap_bool,
      text                TYPE ty_sit2_object_t,
      structures          TYPE ty_sit2_obj_struc_list,
      events              TYPE ty_sit2_obj_events_list,
      end_user_actions    TYPE ty_sit2_obj_act_list,
      navigations         TYPE ty_sit2_obj_nav_list,
      callbacks           TYPE ty_sit2_obj_cb_list,
      value_help_services TYPE ty_sit2_obj_vh_s_list,
    END OF ty_sit2_object,



    BEGIN OF ty_main,
      format_version   TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header           TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      situation_object TYPE ty_sit2_object,
    END OF ty_main.

ENDINTERFACE.
