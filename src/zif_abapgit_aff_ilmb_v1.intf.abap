INTERFACE zif_abapgit_aff_ilmb_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_cond_field,
      condition_field   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      description    TYPE zif_abapgit_aff_types_v1=>ty_description_60,
      data_element   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_table   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_field   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      indirect_value TYPE abap_bool,
      no_intervals   TYPE abap_bool,
    END OF ty_cond_field,
    ty_cond_fields TYPE SORTED TABLE OF ty_cond_field WITH UNIQUE KEY condition_field source_table source_field.

  TYPES:
    BEGIN OF ty_destruction_object,
      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_destruction_object.

  TYPES:
    BEGIN OF ty_callback_class,
      name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_callback_class.

  TYPES:
    BEGIN OF ty_time_reference,
      time_reference TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_table   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      source_field   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      indirect_value TYPE abap_bool,
    END OF ty_time_reference,
    ty_time_references TYPE SORTED TABLE OF ty_time_reference WITH UNIQUE KEY time_reference source_table
                                                                               source_field.

  TYPES:
    BEGIN OF ty_main,
      format_version     TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header             TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      destruction_object TYPE ty_destruction_object,
      time_references    TYPE ty_time_references,
      condition_fields   TYPE ty_cond_fields,
      callback_class     TYPE ty_callback_class,
    END OF ty_main.

ENDINTERFACE.
