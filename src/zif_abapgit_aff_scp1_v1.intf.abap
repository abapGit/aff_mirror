INTERFACE zif_abapgit_aff_scp1_v1
  PUBLIC.

  TYPES ty_type TYPE c LENGTH 3.


  CONSTANTS:
    BEGIN OF co_type,
      simple       TYPE ty_type VALUE 'TMV',
      hierarchical TYPE ty_type VALUE 'TMP',
    END OF co_type.

  TYPES ty_release TYPE c LENGTH 10.

  CONSTANTS:
    BEGIN OF co_validity,
      all_releases TYPE ty_release VALUE '*',
    END OF co_validity.

  TYPES:
    BEGIN OF ty_attributes,
      type               TYPE ty_type,
      software_component TYPE c LENGTH 30,
      minimum_release    TYPE ty_release,
      maximum_release    TYPE ty_release,
    END OF ty_attributes.

  TYPES ty_object_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_object_type,
      view_cluster                  TYPE ty_object_type VALUE 'C',
      logical_transport_object      TYPE ty_object_type VALUE 'L',
      table_with_text_table         TYPE ty_object_type VALUE 'S',
      individual_transaction_object TYPE ty_object_type VALUE 'T',
      view                          TYPE ty_object_type VALUE 'V',
    END OF co_object_type.

  TYPES ty_operation_at_activation TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_operation_at_activation,
      modify TYPE ty_operation_at_activation VALUE '',
      delete TYPE ty_operation_at_activation VALUE 'L',
    END OF co_operation_at_activation.

  TYPES ty_field_attribute_value TYPE c LENGTH 3.

  CONSTANTS:
    BEGIN OF co_field_attribute,
      fixed_key_field TYPE ty_field_attribute_value VALUE 'FKY',
      key_field       TYPE ty_field_attribute_value VALUE 'KEY',
      default_value   TYPE ty_field_attribute_value VALUE 'USE',
      fixed_value     TYPE ty_field_attribute_value VALUE 'FIX',
      variable        TYPE ty_field_attribute_value VALUE 'VAR',
    END OF co_field_attribute.

  TYPES:
    BEGIN OF ty_data,
      field_name  TYPE c LENGTH 30,
      field_value TYPE string,
    END OF ty_data.

  TYPES ty_row_data TYPE SORTED TABLE OF ty_data WITH UNIQUE KEY field_name.

  TYPES ty_language TYPE sy-langu.

  TYPES:
    BEGIN OF ty_translation,
      language    TYPE ty_language,
      field_name  TYPE c LENGTH 30,
      field_value TYPE string,
    END OF ty_translation.

  TYPES ty_translations TYPE SORTED TABLE OF ty_translation WITH UNIQUE KEY language field_name.

  TYPES:
    BEGIN OF ty_record,
      key_value               TYPE string,
      incomplete              TYPE abap_bool,
      operation_at_activation TYPE ty_operation_at_activation,
      data                    TYPE ty_row_data,
      translations            TYPE ty_translations,
    END OF ty_record.

  TYPES ty_records TYPE SORTED TABLE OF ty_record WITH UNIQUE KEY key_value.

  TYPES:
    BEGIN OF ty_field_attribute,
      field_name            TYPE c LENGTH 30,
      field_attribute_value TYPE ty_field_attribute_value,
    END OF ty_field_attribute.

  TYPES ty_field_attributes TYPE SORTED TABLE OF ty_field_attribute WITH UNIQUE KEY field_name.

  TYPES:
    BEGIN OF ty_entity,
      name             TYPE c LENGTH 30,
      field_attributes TYPE ty_field_attributes,
      data_records     TYPE ty_records,
    END OF ty_entity.

  TYPES ty_entities TYPE SORTED TABLE OF ty_entity WITH UNIQUE KEY name.

  TYPES:
    BEGIN OF ty_customizing_object,
      object_name  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      object_type  TYPE ty_object_type,
      img_activity TYPE c LENGTH 20,
      entities     TYPE ty_entities,
    END OF ty_customizing_object.

  TYPES ty_customizing_objects TYPE SORTED TABLE OF ty_customizing_object
                               WITH UNIQUE KEY object_name object_type img_activity.

  TYPES:
    BEGIN OF ty_sub_bcset,
      name TYPE c LENGTH 32,
    END OF ty_sub_bcset.

  TYPES ty_sub_bcsets TYPE SORTED TABLE OF ty_sub_bcset WITH UNIQUE KEY name.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      attributes          TYPE ty_attributes,
      sub_bc_sets         TYPE ty_sub_bcsets,
      customizing_objects TYPE ty_customizing_objects,
    END OF ty_main.

ENDINTERFACE.
