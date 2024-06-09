INTERFACE zif_abapgit_aff_sfpf_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_general_information,
      data_provider      TYPE c LENGTH 40,
      font_embed         TYPE abap_bool,
      layout_mirroring   TYPE abap_bool,
      reduce_data_volume TYPE abap_bool,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
