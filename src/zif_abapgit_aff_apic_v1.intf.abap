INTERFACE zif_abapgit_aff_apic_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">API Catalog</p>
    "! API catalog
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
    END OF ty_main.
ENDINTERFACE.
