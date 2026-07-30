INTERFACE zif_abapgit_aff_edoi_v1 PUBLIC.

  TYPES ty_direction TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_interface_direction,
      outbound TYPE ty_direction VALUE 'O',
      inbound  TYPE ty_direction VALUE 'I',
    END OF co_interface_direction.

  TYPES:
    BEGIN OF ty_general_information,
      direction TYPE ty_direction,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_communication_attributes,
      process_type               TYPE c LENGTH 50,
      process_version            TYPE c LENGTH 20,
      process_subtype            TYPE c LENGTH 50,
      drc_action                 TYPE c LENGTH 30,
      response_interface         TYPE c LENGTH 30,
      response_interface_version TYPE i,
    END OF ty_communication_attributes.

  TYPES:
    BEGIN OF ty_version_details,
      version                  TYPE i,
      description              TYPE c LENGTH 30,
      active_from              TYPE sy-datum,
      communication_attributes TYPE ty_communication_attributes,
    END OF ty_version_details.
  TYPES ty_versions TYPE SORTED TABLE OF ty_version_details WITH UNIQUE KEY version.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_100_cloud,
      general_information TYPE ty_general_information,
      versions            TYPE ty_versions,

    END OF ty_main.

ENDINTERFACE.
