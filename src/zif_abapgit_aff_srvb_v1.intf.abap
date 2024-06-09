INTERFACE zif_abapgit_aff_srvb_v1
  PUBLIC.
  TYPES ty_bind_type_category TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_bind_type_category,
      ui      TYPE ty_bind_type_category VALUE 0,
      web_api TYPE ty_bind_type_category VALUE 1,
    END OF co_bind_type_category.
  TYPES:
    BEGIN OF ty_service_content,
      service_version       TYPE c LENGTH 24,
      service_build_version TYPE n LENGTH 10,
      service_definition    TYPE c LENGTH 30,
    END OF ty_service_content.
  TYPES: ty_service_contents TYPE TABLE OF ty_service_content WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_service,
      name    TYPE c LENGTH 40,
     versions TYPE ty_service_contents,
    END OF ty_service.
  TYPES: ty_services TYPE TABLE OF  ty_service WITH DEFAULT KEY.
  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      binding_type          TYPE c LENGTH 30,
      binding_type_category TYPE ty_bind_type_category,
      services              TYPE ty_services,
    END OF ty_main.

ENDINTERFACE.
