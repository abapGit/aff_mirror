INTERFACE zif_abapgit_aff_cota_v1
  PUBLIC.

  TYPES ty_comm_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_comm_type,
      rfc  TYPE ty_comm_type VALUE 'R',
      http TYPE ty_comm_type VALUE 'H',
    END OF co_comm_type.

  TYPES:
    BEGIN OF ty_configuration,
      communication_type          TYPE ty_comm_type,
      communication_target_class     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      allow_multiple_destinations TYPE abap_bool,
      client_independent          TYPE abap_bool,
    END OF ty_configuration.

  TYPES ty_comp_mode TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_compress_mode,
      fast TYPE ty_comp_mode VALUE 'F',
      high TYPE ty_comp_mode VALUE 'H',
    END OF co_compress_mode.

  TYPES:
    BEGIN OF ty_rfc_settings,
      enforce_sap_gui_support        TYPE abap_bool,
      enforce_fast_serialization TYPE abap_bool,
      default_compression_mode   TYPE ty_comp_mode,
    END OF ty_rfc_settings.

  TYPES:
    BEGIN OF ty_http_settings,
      path_prefix TYPE zif_abapgit_aff_types_v1=>ty_description_100,
    END OF ty_http_settings.


  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      configuration  TYPE ty_configuration,
      http_settings  TYPE ty_http_settings,
      rfc_settings   TYPE ty_rfc_settings,
    END OF ty_main.

ENDINTERFACE.
