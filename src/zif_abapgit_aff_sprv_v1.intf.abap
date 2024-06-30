INTERFACE zif_abapgit_aff_sprv_v1
  PUBLIC.


  TYPES:
    BEGIN OF ty_servprovider,
      provider_name      TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      namespace          TYPE c LENGTH 255,
      prefix             TYPE c LENGTH 10,
      implementing_class TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
    END OF ty_servprovider.
  TYPES:
    BEGIN OF ty_main,
      format_version   TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header           TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      service_provider TYPE ty_servprovider,
    END OF ty_main.
ENDINTERFACE.
