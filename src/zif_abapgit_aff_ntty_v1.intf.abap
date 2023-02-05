INTERFACE zif_abapgit_aff_ntty_v1
  PUBLIC.


  TYPES:
    ty_profile TYPE c LENGTH 20,

    ty_max_length TYPE i,

    BEGIN OF ty_general_information,
      language_dependent TYPE abap_bool,
      multiple_notes            TYPE abap_bool,
      hide_title          TYPE abap_bool,
    END OF ty_general_information,

    BEGIN OF ty_content_settings,
      maximum_length TYPE ty_max_length,
      formatting_profile    TYPE ty_profile,
    END OF ty_content_settings,

    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
      content_settings    TYPE ty_content_settings,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_profile,
      text      TYPE ty_profile VALUE 'TEXT',
      simple_formatting TYPE ty_profile VALUE 'RTE_BASIC',
    END OF co_profile.

ENDINTERFACE.
