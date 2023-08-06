INTERFACE zif_abapgit_aff_susi_v1
  PUBLIC.

  TYPES:
    ty_maintenance_mode   TYPE c LENGTH 1,
    ty_maintenance_status TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_maintenance_mode,
      manual                  TYPE ty_maintenance_mode VALUE space,
      automatic               TYPE ty_maintenance_mode VALUE 'A',
      automatic_basis_objects TYPE ty_maintenance_mode VALUE 'B',
      no_default_values       TYPE ty_maintenance_mode VALUE 'I',
      deprecated              TYPE ty_maintenance_mode VALUE 'D',
      obsolete                TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode,

    BEGIN OF co_maintenance_status,
      no_default             TYPE ty_maintenance_status VALUE 'X',
      default_with_values    TYPE ty_maintenance_status VALUE 'Y',
      default_without_values TYPE ty_maintenance_status VALUE 'V',
      inactive_values        TYPE ty_maintenance_status VALUE 'I',
    END OF co_maintenance_status.

  TYPES:
    ty_appl_name   TYPE c LENGTH 132,
    ty_type        TYPE c LENGTH 80.

  TYPES:
    BEGIN OF ty_general_information,
      application_name TYPE ty_appl_name,
      application_type TYPE ty_type,
      maintenance_mode TYPE ty_maintenance_mode,
      description      TYPE string,
    END OF ty_general_information.

  TYPES:
    ty_val TYPE c LENGTH 40,
    ty_field TYPE c LENGTH 10.

  TYPES:
    BEGIN OF ty_authorization_field,
      field TYPE ty_field,
      low    TYPE ty_val,
      high   TYPE ty_val,
    END OF ty_authorization_field.

  TYPES:
    ty_authorization_fields  TYPE STANDARD TABLE OF ty_authorization_field  WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_authorization_object,
      object             TYPE c LENGTH 10,
      maintenance_status TYPE ty_maintenance_status,
      description        TYPE string,
      fields             TYPE ty_authorization_fields,
    END OF ty_authorization_object.

  TYPES:
    ty_authorization_objects TYPE STANDARD TABLE OF ty_authorization_object WITH DEFAULT KEY.

  TYPES:
    BEGIN OF  ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information   TYPE ty_general_information,
      authorization_objects TYPE ty_authorization_objects,
    END OF ty_main.

ENDINTERFACE.
