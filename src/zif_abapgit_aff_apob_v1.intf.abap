INTERFACE zif_abapgit_aff_apob_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_attributes,
      ao_key_structure TYPE c LENGTH 30,
      sap_object       TYPE c LENGTH 30,
      data_category    TYPE c LENGTH 30,
      ilm_object       TYPE c LENGTH 30,
    END OF ty_attributes.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      attributes     TYPE ty_attributes,
    END OF ty_main.

ENDINTERFACE.
