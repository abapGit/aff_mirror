INTERFACE zif_abapgit_aff_suco_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_leading_application,
      program_id   TYPE c LENGTH 4,
      object_type  TYPE c LENGTH 4,
      object_name  TYPE c LENGTH 40,
      service_type TYPE c LENGTH 16,
      service_name TYPE string,
    END OF ty_leading_application.

  TYPES:
    BEGIN OF  ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_80_cloud,
      leading_application TYPE ty_leading_application,
    END OF ty_main.
ENDINTERFACE.
