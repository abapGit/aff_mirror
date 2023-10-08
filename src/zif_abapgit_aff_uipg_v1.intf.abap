INTERFACE zif_abapgit_aff_uipg_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_general_information,

      title       TYPE zif_abapgit_aff_types_v1=>ty_description_100,

      merge_id    TYPE c LENGTH 35,

    END OF ty_general_information.


  TYPES ty_catalog_type        TYPE c LENGTH 3.


  TYPES ty_tile_display_format TYPE c LENGTH 2.


  CONSTANTS:
    BEGIN OF co_tile_display_format,

      standard  TYPE ty_tile_display_format VALUE 'TI',

      wide      TYPE ty_tile_display_format VALUE 'TW',

      flat      TYPE ty_tile_display_format VALUE 'FT',

      flat_wide TYPE ty_tile_display_format VALUE 'FW',

      link      TYPE ty_tile_display_format VALUE 'LK',

    END OF co_tile_display_format.


  TYPES:
    BEGIN OF ty_catalog_item_key,

      catalog_id   TYPE c LENGTH 35,

      catalog_type TYPE ty_catalog_type,

      id           TYPE c LENGTH 50,

    END OF   ty_catalog_item_key.


  TYPES:
    BEGIN OF ty_tile_assignment,

      tile_key            TYPE ty_catalog_item_key,

      tile_display_format TYPE ty_tile_display_format,

      target_mapping_key  TYPE ty_catalog_item_key,

    END OF ty_tile_assignment.


  TYPES ty_item_type TYPE c LENGTH 2.


  CONSTANTS:
    BEGIN OF co_item_type,

      tile_assignment TYPE ty_item_type VALUE 'TI',

    END OF co_item_type.


  TYPES:
    BEGIN OF ty_item,

      id              TYPE c LENGTH 35,

      type            TYPE ty_item_type,

      tile_assignment TYPE ty_tile_assignment,

    END OF ty_item,

    ty_items TYPE STANDARD TABLE OF ty_item WITH DEFAULT KEY.


  TYPES:
    BEGIN OF ty_section,

      id    TYPE c LENGTH 35,

      title TYPE c LENGTH 100,

      items TYPE ty_items,

    END OF ty_section,

    ty_sections TYPE STANDARD TABLE OF ty_section WITH DEFAULT KEY.


  TYPES:
    BEGIN OF ty_main,

      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header              TYPE zif_abapgit_aff_types_v1=>ty_header_100_cloud,

      general_information TYPE ty_general_information,

      sections            TYPE ty_sections,

    END OF ty_main.

ENDINTERFACE.
