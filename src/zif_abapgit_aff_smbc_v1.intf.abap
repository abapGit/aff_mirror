INTERFACE zif_abapgit_aff_smbc_v1
  PUBLIC.
  CONSTANTS:
    BEGIN OF co_list_variant_management,
      page TYPE string VALUE 'Page',
      none TYPE string VALUE 'None',
    END OF co_list_variant_management,
    BEGIN OF co_page_variant_management,
      control TYPE string VALUE 'Control',
      none TYPE string VALUE 'None',
    END OF co_page_variant_management,
    BEGIN OF co_selection_mode,
      auto   TYPE string VALUE 'Auto',
      multi  TYPE string VALUE 'Multi',
      single TYPE string VALUE 'Single',
      none   TYPE string VALUE 'None',
    END OF co_selection_mode,
    BEGIN OF co_table_type,
      responsive_table TYPE string VALUE 'ResponsiveTable',
      grid_table       TYPE string VALUE 'GridTable',
    END OF co_table_type,
    BEGIN OF co_section_layout,
      page TYPE string VALUE 'Page',
      tabs TYPE string VALUE 'Tabs',
    END OF co_section_layout,
    BEGIN OF co_creation_mode_name,
      new_page     TYPE string VALUE 'NewPage',
      inline       TYPE string VALUE 'Inline',
      creation_row TYPE string VALUE 'CreationRow',
    END OF co_creation_mode_name,
    BEGIN OF co_initial_load,
      enabled  TYPE string VALUE 'Enabled',
      disabled TYPE string VALUE 'Disabled',
      auto     TYPE string VALUE 'Auto',
    END OF co_initial_load,
    BEGIN OF co_row_count_mode,
      fixed TYPE string VALUE 'Fixed',
      auto TYPE string VALUE 'Auto',
    END OF co_row_count_mode.

  TYPES:
    BEGIN OF ty_personalization,
      hide_filter TYPE abap_bool,
      hide_sort   TYPE abap_bool,
      hide_column TYPE abap_bool,
    END OF ty_personalization,
    BEGIN OF ty_creation_mode,
      name          TYPE string,
      create_at_end TYPE abap_bool,
    END OF ty_creation_mode,
    ty_table_type TYPE string,
    BEGIN OF ty_list_report,
      initial_load TYPE string,
      variant_management TYPE string,
    END OF ty_list_report,
    BEGIN OF ty_object_page,
      entity_set              TYPE string,
      section_layout          TYPE string,
      variant_management TYPE string,
      editable_header_content TYPE abap_bool,
    END OF ty_object_page,
    BEGIN OF ty_table_setting,
      entity_set             TYPE string,
      table_type             TYPE ty_table_type,
      selection_mode         TYPE string,
      row_count_mode TYPE string,
      row_count TYPE i,
      creation_mode_name     TYPE ty_creation_mode-name,
      create_at_end          TYPE ty_creation_mode-create_at_end,
      hide_filter            TYPE ty_personalization-hide_filter,
      hide_sort              TYPE ty_personalization-hide_sort,
      hide_column            TYPE ty_personalization-hide_column,
      condensed_table_layout TYPE abap_bool,
      disable_paste          TYPE abap_bool,
      enable_full_screen     TYPE abap_bool,
      enable_mass_edit TYPE abap_bool,
    END OF ty_table_setting,
    ty_object_pages   TYPE SORTED TABLE OF ty_object_page WITH UNIQUE KEY entity_set,
    ty_table_settings TYPE SORTED TABLE OF ty_table_setting WITH UNIQUE KEY entity_set,
    BEGIN OF ty_settings,
      list_report    TYPE ty_list_report,
      object_pages   TYPE ty_object_pages,
      table_settings TYPE ty_table_settings,
    END OF ty_settings.
  TYPES:
    BEGIN OF ty_service_configuration,
      service_binding  TYPE c LENGTH 40,
      service_name     TYPE c LENGTH 40,
      service_version  TYPE n LENGTH 4,
      root_entity_set  TYPE c LENGTH 30,
      name             TYPE c LENGTH 50,
      configuration_group TYPE c LENGTH 30,
      skip_root_entity TYPE abap_bool,
    END OF ty_service_configuration.

  TYPES:
    BEGIN OF ty_header,
      description           TYPE c LENGTH 50,
      original_language     TYPE sy-langu,
      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE ty_header,
      service_configuration TYPE ty_service_configuration,
      app_configuration     TYPE ty_settings,
    END OF ty_main.

ENDINTERFACE.
