INTERFACE zif_abapgit_aff_eeec_v1
  PUBLIC.

  TYPES:
    ty_type TYPE string.

  TYPES:
    BEGIN OF ty_s_event_type,
      type  TYPE ty_type,
      entity_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_s_event_type,
    ty_t_event_type TYPE SORTED TABLE OF ty_s_event_type WITH UNIQUE KEY type.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header           TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      consumer_class   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      descriptor_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      event_types       TYPE ty_t_event_type,
    END OF ty_main.

ENDINTERFACE.
