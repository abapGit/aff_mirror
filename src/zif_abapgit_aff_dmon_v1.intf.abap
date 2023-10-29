INTERFACE zif_abapgit_aff_dmon_v1
  PUBLIC.

  TYPES:
    ty_caller_object_type TYPE c LENGTH 4.

  CONSTANTS:
    BEGIN OF co_caller_object_type,
      clas TYPE ty_caller_object_type VALUE 'CLAS',
      fugr TYPE ty_caller_object_type VALUE 'FUGR',
      prog TYPE ty_caller_object_type VALUE 'PROG',
    END OF co_caller_object_type.

  TYPES:
    BEGIN OF ty_caller_object,
      type TYPE ty_caller_object_type,
      name TYPE c LENGTH 40,
    END OF ty_caller_object,

    ty_daemon_type TYPE c LENGTH 1.

  TYPES:
    ty_start_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_start_type,
      automatically_started       TYPE ty_start_type VALUE 'A',
      explicitly_started_sameuser TYPE ty_start_type VALUE 'H',
      explicitly_started_diffuser TYPE ty_start_type VALUE 'D',
    END OF co_start_type.

  CONSTANTS:
    BEGIN OF co_daemon_type,
      application TYPE ty_daemon_type VALUE 'A',
      system      TYPE ty_daemon_type VALUE 'S',
    END OF co_daemon_type.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      class_name     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      caller_object  TYPE ty_caller_object,
      daemon_type    TYPE ty_daemon_type,
      start_type     TYPE ty_start_type,

    END OF ty_main.

ENDINTERFACE.
