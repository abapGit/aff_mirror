INTERFACE zif_abapgit_aff_uist_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_general_information,
      title         TYPE zif_abapgit_aff_types_v1=>ty_description_100,
      sort_priority TYPE p LENGTH 5 DECIMALS 5,
      merge_id      TYPE c LENGTH 35,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_page,
      name TYPE c LENGTH 35,
    END OF ty_page,

    ty_pages TYPE STANDARD TABLE OF ty_page WITH KEY name.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,

      header              TYPE zif_abapgit_aff_types_v1=>ty_header_100_cloud,

      general_information TYPE ty_general_information,

      pages               TYPE ty_pages,
    END OF ty_main.
ENDINTERFACE.
