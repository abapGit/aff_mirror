INTERFACE zif_abapgit_aff_bdef_v1 PUBLIC.

  TYPES:
    BEGIN OF ty_extended_behavior_def,
      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_extended_behavior_def.

  TYPES:
    BEGIN OF ty_main,
      format_version              TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                      TYPE zif_abapgit_aff_types_v1=>ty_header_60_src,
      extended_behavior_defintion TYPE ty_extended_behavior_def,
    END OF ty_main.

ENDINTERFACE.
