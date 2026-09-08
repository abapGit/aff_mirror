INTERFACE zif_abapgit_aff_xslt_v1 PUBLIC.

  TYPES ty_transformation_type TYPE c LENGTH 20.

  CONSTANTS:
    BEGIN OF co_transformation_type,
      xslt_program          TYPE ty_transformation_type VALUE 'XSLTProgram',
      simple_transformation TYPE ty_transformation_type VALUE 'SimpleTransformation',
    END OF co_transformation_type.

  TYPES:
    BEGIN OF ty_general_information,
      transformation_type TYPE ty_transformation_type,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_src,
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
