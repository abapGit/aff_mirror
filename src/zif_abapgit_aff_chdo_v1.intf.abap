INTERFACE zif_abapgit_aff_chdo_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_insert,
      log_values         TYPE abap_bool,
      log_initial_values TYPE abap_bool,
    END OF ty_insert.

  TYPES:
    BEGIN OF ty_delete,
      log_values         TYPE abap_bool,
      log_initial_values TYPE abap_bool,
    END OF ty_delete.

  TYPES:
    BEGIN OF ty_tablestruc,
      name                TYPE c LENGTH 30,
      reference_table     TYPE c LENGTH 30,
      multiple_changes    TYPE abap_bool,
      database_insertions TYPE ty_insert,
      database_deletions  TYPE ty_delete,
    END OF ty_tablestruc.

  TYPES ty_tables TYPE SORTED TABLE OF ty_tablestruc WITH UNIQUE KEY name.


  TYPES:
    BEGIN OF ty_errormess,
      id     TYPE c LENGTH 20,
      number TYPE n LENGTH 3,
    END OF ty_errormess.

  TYPES:
    ty_category TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_category,
      standard           TYPE ty_category VALUE space,
      behavior_definiton TYPE ty_category VALUE 'X',
    END OF co_category.


  TYPES:
    BEGIN OF ty_general_information,
      category         TYPE ty_category,
      generated_object TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information   TYPE ty_general_information,
      tables_and_structures TYPE ty_tables,
      error_message         TYPE ty_errormess,
    END OF ty_main.


ENDINTERFACE.
