INTERFACE zif_abapgit_aff_srvc_v1
  PUBLIC.
  TYPES ty_cons_type TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_cons_type,
      odata       TYPE ty_cons_type VALUE '01',
      web_service TYPE ty_cons_type VALUE '02',
      rfc         TYPE ty_cons_type VALUE '03',
    END OF co_cons_type.

  TYPES:
    BEGIN OF ty_consumer_property,
      id    TYPE c LENGTH 40,
      value TYPE c LENGTH 40,
    END OF ty_consumer_property.

  TYPES ty_consumer_properties TYPE TABLE OF ty_consumer_property WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_consumer,
      type        TYPE ty_cons_type,
      object_type TYPE c LENGTH 4,
      object_name TYPE c LENGTH 40,
      properties  TYPE ty_consumer_properties,
    END OF ty_consumer.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      consumer       TYPE ty_consumer,

    END OF ty_main.

ENDINTERFACE.
