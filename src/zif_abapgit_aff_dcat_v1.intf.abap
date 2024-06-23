INTERFACE zif_abapgit_aff_dcat_v1
  PUBLIC.

  CONSTANTS:
    BEGIN OF co_categ_senst_lvl,
      sensitive_personal_data TYPE c LENGTH 1 VALUE 'S',
      personal_data           TYPE c LENGTH 1 VALUE '',
    END OF co_categ_senst_lvl.

  TYPES:
    BEGIN OF ty_attributes,
      sensitivity_level TYPE c LENGTH 1,
    END OF ty_attributes.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      attributes     TYPE ty_attributes,
    END OF ty_main.

ENDINTERFACE.
