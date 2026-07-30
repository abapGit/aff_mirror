INTERFACE zif_abapgit_aff_ront_v1
  PUBLIC.

  CONSTANTS:
    BEGIN OF co_category,
      business_object      TYPE c LENGTH 2 VALUE `BO`,
      technical_object     TYPE c LENGTH 2 VALUE `TO`,
      analytical_object    TYPE c LENGTH 2 VALUE `AO`,
      configuration_object TYPE c LENGTH 2 VALUE `CO`,
      dependent_object     TYPE c LENGTH 2 VALUE `DO`,
      hierarchy_object     TYPE c LENGTH 2 VALUE `HO`,
    END OF co_category.

  TYPES:
    BEGIN OF ty_main,
      format_version                TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header                        TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      type_category                 TYPE c LENGTH 2,

      name                          TYPE c LENGTH 30,

      object_type_code              TYPE c LENGTH 5,

      interface_behavior_definition TYPE c LENGTH 30,

      odm_entity_name               TYPE c LENGTH 255,

    END OF ty_main.

ENDINTERFACE.
