INTERFACE zif_abapgit_aff_ntta_v1
  PUBLIC.

  TYPES:
    ty_notetype TYPE c LENGTH 20,

    BEGIN OF ty_general_information,
      object_node_type    TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      implementation_exit TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    BEGIN OF ty_notetype_structure,
      name TYPE ty_notetype,
    END OF ty_notetype_structure,

    ty_notetypes TYPE SORTED TABLE OF ty_notetype_structure WITH UNIQUE KEY name,

    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
      note_types          TYPE ty_notetypes,
    END OF ty_main.

ENDINTERFACE.
