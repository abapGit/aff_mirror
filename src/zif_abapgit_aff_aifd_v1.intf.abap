INTERFACE zif_abapgit_aff_aifd_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_aif_interface,
      interface_object_name TYPE c LENGTH 40,
    END OF ty_aif_interface,

    ty_aif_interfaces TYPE STANDARD TABLE OF ty_aif_interface WITH DEFAULT KEY,

    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      aif_interfaces TYPE ty_aif_interfaces,
    END OF ty_main.
ENDINTERFACE.
