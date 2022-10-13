INTERFACE zif_abapgit_aff_doma_v1 PUBLIC.

  TYPES ty_data_type            TYPE c LENGTH 4.

  TYPES ty_length               TYPE i.

  TYPES ty_decimals             TYPE i.

  TYPES ty_output_length        TYPE i.

  TYPES ty_conv_routine         TYPE c LENGTH 5.

  TYPES ty_value_table          TYPE c LENGTH 30.

  TYPES:
    BEGIN OF ty_single_value,
      fixed_value TYPE c LENGTH 10,
      description TYPE zif_abapgit_aff_types_v1=>ty_description_60,
    END OF ty_single_value,

    ty_single_values TYPE STANDARD TABLE OF ty_single_value WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_intervals_value,
      low_limit   TYPE c LENGTH 10,
      high_limit  TYPE c LENGTH 10,
      description TYPE zif_abapgit_aff_types_v1=>ty_description_60,
    END OF ty_intervals_value,

    ty_intervals_values TYPE STANDARD TABLE OF ty_intervals_value WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_main,
      format_version        TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                TYPE zif_abapgit_aff_types_v1=>ty_header_60,

      data_type             TYPE ty_data_type,

      length                TYPE ty_length,

      decimals              TYPE ty_decimals,

      negative_values       TYPE abap_bool,

      case_sensitive        TYPE abap_bool,

      output_length         TYPE ty_output_length,

      conversion_routine    TYPE ty_conv_routine,

      value_table           TYPE ty_value_table,

      fixed_values          TYPE ty_single_values,

      fixed_value_intervals TYPE ty_intervals_values,
    END OF ty_main.

ENDINTERFACE.
