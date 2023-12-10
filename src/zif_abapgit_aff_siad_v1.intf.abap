INTERFACE zif_abapgit_aff_siad_v1
  PUBLIC.

  TYPES:

    BEGIN OF ty_general_information,

      business_role_template   TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,

      launchpad_space_template TYPE c LENGTH 35,

    END OF ty_general_information,

    BEGIN OF ty_main,

      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,

      general_information TYPE ty_general_information,

    END OF ty_main.

ENDINTERFACE.
