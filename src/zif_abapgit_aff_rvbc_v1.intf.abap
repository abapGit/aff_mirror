INTERFACE zif_abapgit_aff_rvbc_v1
  PUBLIC.

  TYPES ty_app_id             TYPE c LENGTH 70.
  TYPES ty_ina1_service_name  TYPE c LENGTH 40.

  TYPES ty_extensibility_mode TYPE n LENGTH 2.
  CONSTANTS:
    BEGIN OF co_extensibility_mode,
      fully_supported              TYPE ty_extensibility_mode VALUE 0,
      supported_predefined_queries TYPE ty_extensibility_mode VALUE 1,
      not_supported                TYPE ty_extensibility_mode VALUE 2,
    END OF co_extensibility_mode.

  TYPES ty_source TYPE n LENGTH 1.
  CONSTANTS:
    BEGIN OF co_source,
      predefined TYPE ty_source VALUE 1,
      custom     TYPE ty_source VALUE 2,
    END OF co_source.

  TYPES ty_status TYPE n LENGTH 1.
  CONSTANTS:
    BEGIN OF co_status,
      draft TYPE ty_status VALUE 1,
      final TYPE ty_status VALUE 2,
    END OF co_status.

  TYPES:
    BEGIN OF ty_booklet_definition,
      source             TYPE ty_source,
      status             TYPE ty_status,
      application        TYPE ty_app_id,
      extensibility_mode TYPE ty_extensibility_mode,
    END OF ty_booklet_definition.

  TYPES:
    BEGIN OF ty_ina1_services,
      predefined TYPE ty_ina1_service_name,
      custom     TYPE ty_ina1_service_name,
    END OF ty_ina1_services.

  TYPES:
    BEGIN OF ty_main,
      format_version     TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header             TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      booklet_definition TYPE ty_booklet_definition,
      ina1_services      TYPE ty_ina1_services,
    END OF ty_main.

ENDINTERFACE.
