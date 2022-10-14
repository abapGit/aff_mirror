INTERFACE zif_abapgit_aff_evtb_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_event,
      event_version             TYPE n LENGTH 4,

      event_minor_version       TYPE i,

      event_patch_version       TYPE i,

      entity_name               TYPE c LENGTH 30,

      entity_event_name         TYPE c LENGTH 30,
    END OF ty_event.

  TYPES:
    BEGIN OF ty_main,
      format_version     TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header             TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      producer_namespace TYPE c LENGTH 15,

      producer_legacy    TYPE abap_bool,

      producer           TYPE c LENGTH 36,

      producer_version   TYPE n LENGTH 4,

      bo_name            TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      bo_operation       TYPE c LENGTH 18,

      producer_type      TYPE c LENGTH 83,

      events             TYPE SORTED TABLE OF ty_event WITH NON-UNIQUE KEY event_version,
    END OF ty_main.

ENDINTERFACE.
