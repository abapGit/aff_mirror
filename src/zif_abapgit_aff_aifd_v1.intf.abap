INTERFACE zif_abapgit_aff_aifd_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_application_interface,
      application_interface TYPE c LENGTH 40,
    END OF ty_application_interface,

    ty_application_interfaces TYPE STANDARD TABLE OF ty_application_interface WITH DEFAULT KEY,

    BEGIN OF ty_main,
      format_version         TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                 TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      application_interfaces TYPE ty_application_interfaces,
    END OF ty_main.
ENDINTERFACE.
