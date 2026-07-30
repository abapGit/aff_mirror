INTERFACE zif_abapgit_aff_evto_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_general_information,
      sap_object_type TYPE c LENGTH 30,

      major_version   TYPE i,

      minor_version   TYPE i,

      patch_version   TYPE i,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
