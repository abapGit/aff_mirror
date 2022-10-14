INTERFACE zif_abapgit_aff_aplo_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_subobject,
      name        TYPE c LENGTH 20,
      description TYPE c LENGTH 60,
    END OF ty_subobject.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      subobjects    TYPE SORTED TABLE OF ty_subobject WITH NON-UNIQUE KEY name,
    END OF ty_main.
ENDINTERFACE.
