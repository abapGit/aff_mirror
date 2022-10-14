INTERFACE zif_abapgit_aff_nrob_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_interval,
      number_length_domain TYPE c LENGTH 30,
      percent_warning      TYPE p LENGTH 3 DECIMALS 1,
      sub_type             TYPE c LENGTH 30,
      until_year           TYPE abap_bool,
      rolling              TYPE abap_bool,
      prefix               TYPE abap_bool,
    END OF ty_interval.


  TYPES ty_buffering TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_buffering,
      main_buffer TYPE ty_buffering VALUE 'X',
      parallel    TYPE ty_buffering VALUE 'S',
      none        TYPE ty_buffering VALUE ' ',
    END OF co_buffering.

  TYPES:
    BEGIN OF ty_configuration,
      transaction_id   TYPE c LENGTH 20,
      buffering        TYPE ty_buffering,
      buffered_numbers TYPE i,
    END OF ty_configuration.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      interval       TYPE ty_interval,
      configuration  TYPE ty_configuration,
    END OF ty_main.

ENDINTERFACE.
