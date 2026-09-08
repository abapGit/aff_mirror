INTERFACE zif_abapgit_aff_devc_v1 PUBLIC.

  TYPES ty_package_type TYPE c LENGTH 11.

  CONSTANTS:
    BEGIN OF co_package_type,
      development TYPE ty_package_type VALUE 'development' ##NO_TEXT,
      main        TYPE ty_package_type VALUE 'main' ##NO_TEXT,
      structure   TYPE ty_package_type VALUE 'structure' ##NO_TEXT,
    END OF co_package_type.

  TYPES ty_severity TYPE c LENGTH 11.

  CONSTANTS:
    BEGIN OF co_severity,
      none        TYPE ty_severity VALUE 'none' ##NO_TEXT,
      information TYPE ty_severity VALUE 'information' ##NO_TEXT,
      warning     TYPE ty_severity VALUE 'warning' ##NO_TEXT,
      error       TYPE ty_severity VALUE 'error' ##NO_TEXT,
      obsolete    TYPE ty_severity VALUE 'obsolete' ##NO_TEXT,
    END OF co_severity.

  TYPES:
    BEGIN OF ty_use_access,
      package_interface TYPE c LENGTH 30,
      severity          TYPE ty_severity,
    END OF ty_use_access.

  TYPES:
    BEGIN OF ty_general_information,
      type                          TYPE ty_package_type,
      super_package                 TYPE c LENGTH 30,
      switch                        TYPE c LENGTH 30,
      application_component         TYPE c LENGTH 24,
      software_component            TYPE c LENGTH 30,
      transport_layer               TYPE c LENGTH 4,
      supports_record_changes       TYPE abap_bool,
      is_adding_objects_not_allowed TYPE abap_bool,
      is_encapsulated               TYPE abap_bool,
      default_abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_no_abap_lv,
      general_information TYPE ty_general_information,
      use_accesses        TYPE STANDARD TABLE OF ty_use_access WITH DEFAULT KEY,
    END OF ty_main.

ENDINTERFACE.
