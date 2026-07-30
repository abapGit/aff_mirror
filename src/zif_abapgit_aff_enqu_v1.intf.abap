INTERFACE zif_abapgit_aff_enqu_v1
  PUBLIC.

  TYPES ty_lock_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_lock_modes,
      exclusive                    TYPE ty_lock_mode VALUE 'E',
      shared                       TYPE ty_lock_mode VALUE 'S',
      exclusive_not_cumulative     TYPE ty_lock_mode VALUE 'X',
      set_optimistic               TYPE ty_lock_mode VALUE 'O',
      promote_optimistic           TYPE ty_lock_mode VALUE 'R',
      conflict_check_extended_excl TYPE ty_lock_mode VALUE 'U',
      conflict_check_exclusive     TYPE ty_lock_mode VALUE 'V',
      conflict_check_shared        TYPE ty_lock_mode VALUE 'W',
      promotion_check_optimized    TYPE ty_lock_mode VALUE 'C',
      reserved_1                   TYPE ty_lock_mode VALUE 'T',
      reserved_2                   TYPE ty_lock_mode VALUE '+',
      initial                      TYPE ty_lock_mode VALUE '',
    END OF co_lock_modes.

  TYPES:
    BEGIN OF ty_lock_table,
      name      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      lock_mode TYPE ty_lock_mode,
    END OF ty_lock_table.

  TYPES ty_lock_tables TYPE STANDARD TABLE OF ty_lock_table WITH DEFAULT KEY.

  TYPES ty_field_name  TYPE c LENGTH 30.
  TYPES:
    BEGIN OF ty_lock_parameter,
      name   TYPE ty_field_name,
      table  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      field  TYPE ty_field_name,
      active TYPE abap_bool,
    END OF ty_lock_parameter,

    ty_lock_parameters TYPE STANDARD TABLE OF ty_lock_parameter WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_lock_modules,
      allow_rfc TYPE abap_bool,
    END OF ty_lock_modules.

  TYPES:
    BEGIN OF ty_main,
      format_version   TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header           TYPE zif_abapgit_aff_types_v1=>ty_header_60,
      primary_table    TYPE ty_lock_table,
      secondary_tables TYPE ty_lock_tables,
      lock_parameters  TYPE ty_lock_parameters,
      lock_modules     TYPE ty_lock_modules,
    END OF ty_main.

ENDINTERFACE.
