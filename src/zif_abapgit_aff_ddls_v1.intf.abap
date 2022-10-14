INTERFACE zif_abapgit_aff_ddls_v1
  PUBLIC.

  TYPES ty_source_type TYPE c LENGTH 1.

  TYPES ty_source_origin TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_source_type,
      view               TYPE ty_source_type VALUE 'V',
      view_entity        TYPE ty_source_type VALUE 'W',
      view_extend        TYPE ty_source_type VALUE 'E',
      view_entity_extend TYPE ty_source_type VALUE 'X',
      table_function     TYPE ty_source_type VALUE 'F',
      table_entity       TYPE ty_source_type VALUE 'T',
      abstract_entity    TYPE ty_source_type VALUE 'A',
      custom_entity      TYPE ty_source_type VALUE 'Q',
      hierarchy          TYPE ty_source_type VALUE 'H',
      projection_view    TYPE ty_source_type VALUE 'P',
    END OF co_source_type,

    BEGIN OF co_source_origin,
      abap_development_tools         TYPE ty_source_origin VALUE '0',
      custom_cds_views               TYPE ty_source_origin VALUE '1',
      custom_analytical_queries      TYPE ty_source_origin VALUE '2',
      custom_business_object         TYPE ty_source_origin VALUE '3',
      custom_code_list               TYPE ty_source_origin VALUE '4',
      custom_cds_views_variant_confg TYPE ty_source_origin VALUE '5',
      custom_fields                  TYPE ty_source_origin VALUE '6',
      extensions_for_data_sources    TYPE ty_source_origin VALUE '7',
      custom_search_modeler          TYPE ty_source_origin VALUE '8',
      service_consumption_model      TYPE ty_source_origin VALUE '9',
    END OF co_source_origin.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      source_origin  TYPE ty_source_origin,
      source_type    TYPE ty_source_type,
      parent_name    TYPE c LENGTH 40,
    END OF ty_main.

ENDINTERFACE.
