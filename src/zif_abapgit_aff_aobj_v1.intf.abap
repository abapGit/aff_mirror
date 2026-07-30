INTERFACE zif_abapgit_aff_aobj_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_attributes,
      write_class   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      delete_class  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      reload_class  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      storage_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_attributes.

  TYPES:
    BEGIN OF ty_table_to_be_archived,
      name TYPE c LENGTH 30,
    END OF ty_table_to_be_archived.

  TYPES ty_tables_to_be_archived TYPE SORTED TABLE OF ty_table_to_be_archived WITH UNIQUE KEY name.

  TYPES:
    BEGIN OF ty_archiving_class,
      name TYPE c LENGTH 10,
    END OF ty_archiving_class.
  TYPES: ty_archiving_classes TYPE SORTED TABLE OF ty_archiving_class WITH UNIQUE KEY name.
  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      attributes            TYPE ty_attributes,
      tables_to_be_archived TYPE ty_tables_to_be_archived,
      archiving_classes     TYPE ty_archiving_classes,
    END OF ty_main.

ENDINTERFACE.
