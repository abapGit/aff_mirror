INTERFACE zif_abapgit_aff_dsfi_v1
  PUBLIC.


  TYPES: ty_engine TYPE zif_abapgit_aff_types_v1=>ty_object_name_30.

  CONSTANTS:
    BEGIN OF co_engine,
      analytical_engine TYPE ty_engine VALUE 'ANA',
    END OF co_engine.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_src,
      scalar_function_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      engine               TYPE ty_engine,
    END OF ty_main.

ENDINTERFACE.
