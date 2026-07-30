INTERFACE zif_abapgit_aff_swcr_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_permission,
      software_component TYPE c LENGTH 30,
    END OF ty_permission.

  TYPES ty_permissions TYPE STANDARD TABLE OF ty_permission WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_dependency,
      software_component TYPE c LENGTH 30,
    END OF ty_dependency.

  TYPES ty_dependencies TYPE STANDARD TABLE OF ty_dependency WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_main,
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      permissions    TYPE ty_permissions,
      dependencies   TYPE ty_dependencies,
    END OF ty_main.

ENDINTERFACE.
