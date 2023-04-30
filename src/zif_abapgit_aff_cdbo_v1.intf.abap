INTERFACE zif_abapgit_aff_cdbo_v1
  PUBLIC.
  TYPES ty_object_type TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_object_type,
      tabl    TYPE ty_object_type VALUE '01',
      ddls TYPE ty_object_type VALUE '02',
    END OF co_object_type.

  TYPES ty_field_nature TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_field_nature,
      general TYPE ty_field_nature VALUE 'GE',
      sensitive    TYPE ty_field_nature VALUE 'SP',
      non_business_information TYPE ty_field_nature VALUE 'NB',
    END OF co_field_nature.

  TYPES:
    BEGIN OF ty_field,
      name TYPE c LENGTH 30,
      nature TYPE ty_field_nature,
    END OF ty_field.

  TYPES:
    ty_fields TYPE STANDARD TABLE OF ty_field WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_general_information,
      object_type   TYPE ty_object_type,
      object_name  TYPE c LENGTH 40,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      general_information TYPE ty_general_information,
      fields     TYPE ty_fields,
    END OF ty_main.

ENDINTERFACE.
