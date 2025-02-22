INTERFACE zif_abapgit_aff_uiad_v2
  PUBLIC.

  TYPES:
    BEGIN OF ty_header,
      description           TYPE c LENGTH 255,

      original_language     TYPE zif_abapgit_aff_types_v1=>ty_original_language,

      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.
  TYPES ty_app_type TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_general_information,

      app_type             TYPE ty_app_type,

      catalog_id           TYPE c LENGTH 40,

      fiori_id             TYPE c LENGTH 20,

      transaction          TYPE c LENGTH 20,

      information          TYPE c LENGTH 255,

      support_component    TYPE c LENGTH 24,

      suppress_tiles       TYPE abap_bool,

      target_mapping_title TYPE c LENGTH 255,

    END OF ty_general_information.
  TYPES:
    BEGIN OF ty_app_details_ui5,

      app_id   TYPE c LENGTH 70,

      icf_path TYPE string,

    END OF ty_app_details_ui5.
  TYPES ty_web_dynpro_integration_mode TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_app_details_web_dynpro,

      app_id             TYPE c LENGTH 30,

      config_id          TYPE c LENGTH 32,

      flavor_id          TYPE c LENGTH 32,

      integration_mode   TYPE ty_web_dynpro_integration_mode,

      compatibility_mode TYPE abap_bool,

    END OF ty_app_details_web_dynpro.
  TYPES:
    BEGIN OF ty_app_details_web_client,

      target_id TYPE c LENGTH 10,

    END OF ty_app_details_web_client.
  TYPES:
    BEGIN OF ty_url_template_parameter,

      name  TYPE string,

      value TYPE string,

    END OF ty_url_template_parameter.
  TYPES ty_url_template_parameters TYPE STANDARD TABLE OF ty_url_template_parameter WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_app_details_url_template,

      template_id TYPE c LENGTH 32,

      parameters  TYPE ty_url_template_parameters,

    END OF ty_app_details_url_template.
  TYPES ty_filter_type TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_parameter_item,

      name          TYPE string,

      rename_to     TYPE string,

      default_value TYPE string,

      filter_value  TYPE string,

      filter_type   TYPE ty_filter_type,

      required      TYPE abap_bool,

    END OF ty_parameter_item.
  TYPES ty_parameter_items           TYPE STANDARD TABLE OF ty_parameter_item WITH DEFAULT KEY.
  TYPES ty_additional_param_handling TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_navigation,

      target_mapping_id             TYPE c LENGTH 50,

      semantic_object               TYPE c LENGTH 30,

      action                        TYPE c LENGTH 60,

      target_url                    TYPE string,

      system_alias                  TYPE c LENGTH 32,

      desktop                       TYPE abap_bool,

      tablet                        TYPE abap_bool,

      phone                         TYPE abap_bool,

      parameters                    TYPE ty_parameter_items,

      additional_parameter_handling TYPE ty_additional_param_handling,

    END OF ty_navigation.
  TYPES ty_tile_type TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_dynamic_tile_details,

      service_base_url TYPE string,

      service_path     TYPE string,

      refresh_interval TYPE i,

      number_unit      TYPE string,

    END OF ty_dynamic_tile_details.
  TYPES:
    BEGIN OF ty_tile_navigation_parameter,

      name  TYPE string,

      value TYPE string,

    END OF ty_tile_navigation_parameter.
  TYPES ty_tile_navigation_parameters TYPE STANDARD TABLE OF ty_tile_navigation_parameter WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_standard_tile_details,

      reuse_text_from_app        TYPE abap_bool,

      title                      TYPE c LENGTH 255,

      subtitle                   TYPE c LENGTH 255,

      information                TYPE c LENGTH 255,

      keywords                   TYPE c LENGTH 255,

      icon                       TYPE string,

      dynamic                    TYPE ty_dynamic_tile_details,

      tile_navigation_parameters TYPE ty_tile_navigation_parameters,

    END OF ty_standard_tile_details.
  TYPES:
    BEGIN OF ty_chip_bag_property,

      bag_id       TYPE c LENGTH 100,

      name         TYPE c LENGTH 100,

      value        TYPE string,

      translatable TYPE abap_bool,

    END OF ty_chip_bag_property.
  TYPES ty_chip_bag_properties TYPE STANDARD TABLE OF ty_chip_bag_property WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_custom_tile_details,

      base_chip_id   TYPE c LENGTH 255,

      configuration  TYPE string,

      bag_properties TYPE ty_chip_bag_properties,

    END OF ty_custom_tile_details.
  TYPES:
    BEGIN OF ty_tile,

      id         TYPE c LENGTH 50,

      tile_type  TYPE ty_tile_type,

      is_default TYPE abap_bool,

      is_legacy  TYPE abap_bool,

      standard   TYPE ty_standard_tile_details,

      custom     TYPE ty_custom_tile_details,

    END OF ty_tile.
  TYPES ty_tiles             TYPE STANDARD TABLE OF ty_tile WITH DEFAULT KEY.
  TYPES ty_life_cycle_status TYPE c LENGTH 1.
  TYPES:
    BEGIN OF ty_life_cycle,

      status    TYPE ty_life_cycle_status,

      successor TYPE c LENGTH 32,

    END OF ty_life_cycle.
  TYPES:
    BEGIN OF ty_main,

      format_version           TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header                   TYPE ty_header,

      general_information      TYPE ty_general_information,

      ui5_app_details          TYPE ty_app_details_ui5,

      web_dynpro_app_details   TYPE ty_app_details_web_dynpro,

      web_client_app_details   TYPE ty_app_details_web_client,

      url_template_app_details TYPE ty_app_details_url_template,

      navigation               TYPE ty_navigation,

      tiles                    TYPE ty_tiles,

      life_cycle               TYPE ty_life_cycle,

    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_app_type,

      transaction  TYPE ty_app_type VALUE 'T',

      web_dynpro   TYPE ty_app_type VALUE 'W',

      web_client   TYPE ty_app_type VALUE 'C',

      ui5          TYPE ty_app_type VALUE 'U',

      legacy_ui5   TYPE ty_app_type VALUE 'S',

      url          TYPE ty_app_type VALUE 'R',

      tile_only    TYPE ty_app_type VALUE 'O',

      url_template TYPE ty_app_type VALUE 'G',

    END OF co_app_type.
  CONSTANTS:
    BEGIN OF co_web_dynpro_integration_mode,

      system_default TYPE ty_web_dynpro_integration_mode VALUE ' ',

      direct         TYPE ty_web_dynpro_integration_mode VALUE 'D',

      compatible     TYPE ty_web_dynpro_integration_mode VALUE 'C',

    END OF co_web_dynpro_integration_mode.
  CONSTANTS:
    BEGIN OF co_filter_type,

      plain TYPE ty_filter_type VALUE ' ',

      regex TYPE ty_filter_type VALUE 'R',

    END OF co_filter_type.
  CONSTANTS:
    BEGIN OF co_additional_param_handling,

      allowed     TYPE ty_additional_param_handling VALUE 'A',

      ignored     TYPE ty_additional_param_handling VALUE 'I',

      not_allowed TYPE ty_additional_param_handling VALUE 'N',

    END OF co_additional_param_handling.
  CONSTANTS:
    BEGIN OF co_tile_type,

      static  TYPE ty_tile_type VALUE 'S',

      dynamic TYPE ty_tile_type VALUE 'D',

      custom  TYPE ty_tile_type VALUE 'C',

    END OF co_tile_type.
  CONSTANTS:
    BEGIN OF co_life_cycle_status,

      active     TYPE ty_life_cycle_status VALUE ' ',

      deprecated TYPE ty_life_cycle_status VALUE 'D',

      obsolete   TYPE ty_life_cycle_status VALUE 'O',

    END OF co_life_cycle_status.

ENDINTERFACE.
