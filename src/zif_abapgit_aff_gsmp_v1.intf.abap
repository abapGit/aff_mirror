INTERFACE zif_abapgit_aff_gsmp_v1
  PUBLIC.

  TYPES:

    ty_provider_type  TYPE c LENGTH 4,

    ty_execution_mode TYPE c LENGTH 1,


    ty_priority   TYPE i,

    ty_instantiation TYPE c LENGTH 1,

    BEGIN OF ty_provider_implementation,

      type TYPE ty_provider_type,

      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

    END OF ty_provider_implementation,

    BEGIN OF ty_provider_execution,

      mode TYPE ty_execution_mode,

      priority   TYPE ty_priority,

      instantiation TYPE ty_instantiation,

      scope_dependent       TYPE abap_bool,

    END OF ty_provider_execution,

    BEGIN OF ty_model,

      data     TYPE string,

    END OF ty_model.

  CONSTANTS:

    BEGIN OF co_provider_type,

      class    TYPE ty_provider_type VALUE 'CLAS',

    END OF co_provider_type,

    BEGIN OF co_execution_mode,

      system      TYPE ty_execution_mode VALUE 'S',

      instance    TYPE ty_execution_mode VALUE 'I',

      application TYPE ty_execution_mode VALUE 'A',

      job        TYPE ty_execution_mode VALUE 'J',

      none        TYPE ty_execution_mode VALUE 'N',

    END OF co_execution_mode,

    BEGIN OF co_priority,

      availability TYPE ty_priority VALUE 1,

      high         TYPE ty_priority VALUE 200,

      normal       TYPE ty_priority VALUE 300,

      low          TYPE ty_priority VALUE 400,

    END OF co_priority,

    BEGIN OF co_instantiation,

      reuse       TYPE ty_instantiation VALUE 'R',

      create_new  TYPE ty_instantiation VALUE 'C',

    END OF co_instantiation.

  TYPES:

    BEGIN OF ty_main,

      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      implementation TYPE ty_provider_implementation,

      execution TYPE ty_provider_execution,

      model     TYPE ty_model,

    END OF ty_main.

ENDINTERFACE.
