INTERFACE zif_abapgit_aff_dobj_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_structure_definition,
      parent_table    TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      dependent_table TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_structure_definition,
    ty_structure_definitions TYPE SORTED TABLE OF  ty_structure_definition WITH UNIQUE KEY parent_table dependent_table.


  TYPES:
    BEGIN OF ty_attributes,
      destruction_class     TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_attributes.
  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      attributes  TYPE ty_attributes,
      structure_definition TYPE ty_structure_definitions,
    END OF ty_main.

ENDINTERFACE.
