INTERFACE zif_abapgit_aff_ront_v1
  PUBLIC.

  CONSTANTS:
    BEGIN OF co_category,
      business_object      TYPE c LENGTH 2 VALUE `BO`,
      technical_object     TYPE c LENGTH 2 VALUE `TO`,
      analytical_object    TYPE c LENGTH 2 VALUE `AO`,
      configuration_object TYPE c LENGTH 2 VALUE `CO`,
    END OF co_category.

  TYPES:
    BEGIN OF ty_node_type,
      name TYPE c LENGTH 40,

      description   TYPE zif_abapgit_aff_types_v1=>ty_description_60,
    END OF ty_node_type.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      type_category  TYPE c LENGTH 2,

      root_node_type TYPE ty_node_type,

      node_types     TYPE SORTED TABLE OF ty_node_type WITH NON-UNIQUE KEY name,

    END OF ty_main.
ENDINTERFACE.
