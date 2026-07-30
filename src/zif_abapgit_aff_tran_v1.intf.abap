INTERFACE zif_abapgit_aff_tran_v1
  PUBLIC.


  TYPES ty_transaction_code TYPE c LENGTH 20.

  TYPES ty_transaction_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_transaction_type,
      dialog_transaction    TYPE ty_transaction_type VALUE 'D',
      oo_transaction        TYPE ty_transaction_type VALUE 'O',
      parameter_transaction TYPE ty_transaction_type VALUE 'P',
      report_transaction    TYPE ty_transaction_type VALUE 'R',
      variant_transaction   TYPE ty_transaction_type VALUE 'V',
    END OF co_transaction_type.

  TYPES ty_program_name  TYPE zif_abapgit_aff_types_v1=>ty_object_name_40.
  TYPES ty_program_dynnr TYPE n LENGTH 4.

  TYPES ty_lock_status   TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_lock_status,
      locked     TYPE ty_lock_status VALUE 'X',
      not_locked TYPE ty_lock_status VALUE ' ',
    END OF co_lock_status.

  TYPES ty_skip_initial_screen_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_skip_initial_screen_mode,
      skip TYPE ty_skip_initial_screen_mode VALUE 'Y',
      show TYPE ty_skip_initial_screen_mode VALUE 'N',
    END OF co_skip_initial_screen_mode.

  TYPES ty_stv_maintenance_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_stv_maintenance_mode,
      allowed     TYPE ty_stv_maintenance_mode VALUE 'A',
      not_allowed TYPE ty_stv_maintenance_mode VALUE 'N',
    END OF co_stv_maintenance_mode.

  TYPES ty_update_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_update_mode,
      not_set      TYPE ty_update_mode VALUE '',
      asynchronous TYPE ty_update_mode VALUE 'U',
      synchronous  TYPE ty_update_mode VALUE 'S',
      local        TYPE ty_update_mode VALUE 'L',
    END OF co_update_mode.

  TYPES:
    BEGIN OF ty_dialog_transaction,
      program_name         TYPE ty_program_name,
      program_dynnr        TYPE ty_program_dynnr,
      stv_maintenance_mode TYPE ty_stv_maintenance_mode,
    END OF ty_dialog_transaction.

  TYPES ty_report_name         TYPE zif_abapgit_aff_types_v1=>ty_object_name_40.
  TYPES ty_report_dynnr        TYPE n LENGTH 4.

  TYPES ty_report_variant_name TYPE c LENGTH 14.
  TYPES:
    BEGIN OF ty_report_transaction,
      report_name         TYPE ty_report_name,
      report_dynnr        TYPE ty_report_dynnr,
      report_variant_name TYPE ty_report_variant_name,
    END OF ty_report_transaction.

  TYPES ty_class_program_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_40.
  TYPES ty_class_name         TYPE zif_abapgit_aff_types_v1=>ty_object_name_30.
  TYPES ty_method_name        TYPE c LENGTH 61.
  TYPES:
    BEGIN OF ty_oo_transaction,
      local_in_program_indi     TYPE abap_bool,
      class_program_name        TYPE ty_class_program_name,
      class_name                TYPE ty_class_name,
      method_name               TYPE ty_method_name,
      oo_transaction_model_indi TYPE abap_bool,
      update_mode               TYPE ty_update_mode,
    END OF ty_oo_transaction.

  TYPES ty_parameter_name  TYPE c LENGTH 132.
  TYPES ty_parameter_value TYPE c LENGTH 50.
  TYPES:
    BEGIN OF ty_par_pv,
      parameter_name  TYPE ty_parameter_name,
      parameter_value TYPE ty_parameter_value,
    END OF ty_par_pv.
  TYPES ty_par_pv_t                    TYPE STANDARD TABLE OF ty_par_pv WITH DEFAULT KEY.

  TYPES ty_par_parent_transaction_code TYPE ty_transaction_code.
  TYPES:
    BEGIN OF ty_parameter_transaction,
      par_parent_transaction_code TYPE ty_par_parent_transaction_code,
      skip_initial_screen_mode    TYPE ty_skip_initial_screen_mode,
      parameter_values            TYPE ty_par_pv_t,
    END OF ty_parameter_transaction.

  TYPES ty_var_parent_transaction_code TYPE ty_transaction_code.
  TYPES ty_transaction_ci_variant_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30.
  TYPES ty_transaction_variant_name    TYPE zif_abapgit_aff_types_v1=>ty_object_name_30.
  TYPES:
    BEGIN OF ty_variant_transaction,
      var_parent_transaction_code TYPE ty_var_parent_transaction_code,
      transaction_variant_ci_indi TYPE abap_bool,
      transaction_ci_variant_name TYPE ty_transaction_ci_variant_name,
      transaction_variant_name    TYPE ty_transaction_variant_name,
    END OF ty_variant_transaction.

  TYPES:
    BEGIN OF ty_general_information,
      transaction_type      TYPE ty_transaction_type,
      lock_status           TYPE ty_lock_status,
      dialog_transaction    TYPE ty_dialog_transaction,
      parameter_transaction TYPE ty_parameter_transaction,
      report_transaction    TYPE ty_report_transaction,
      oo_transaction        TYPE ty_oo_transaction,
      variant_transaction   TYPE ty_variant_transaction,
    END OF ty_general_information.

  TYPES ty_maintenance_mode   TYPE c LENGTH 1.

  TYPES ty_maintenance_status TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_maintenance_mode,
      manual                  TYPE ty_maintenance_mode VALUE space,
      automatic               TYPE ty_maintenance_mode VALUE 'A',
      automatic_basis_objects TYPE ty_maintenance_mode VALUE 'B',
      no_default_values       TYPE ty_maintenance_mode VALUE 'I',
      deprecated              TYPE ty_maintenance_mode VALUE 'D',
      obsolete                TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode.

  TYPES ty_default_values_required TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_default_values_required,
      yes TYPE ty_default_values_required VALUE '1',
      no  TYPE ty_default_values_required VALUE '0',
    END OF co_default_values_required.

  CONSTANTS:
    BEGIN OF co_maintenance_status,
      undefined              TYPE ty_maintenance_status VALUE ' ',
      no_default             TYPE ty_maintenance_status VALUE 'X',
      default_with_values    TYPE ty_maintenance_status VALUE 'Y',
      default_without_values TYPE ty_maintenance_status VALUE 'V',
      inactive_values        TYPE ty_maintenance_status VALUE 'I',
    END OF co_maintenance_status.

  TYPES ty_inheritance_mode TYPE c LENGTH 10.
  CONSTANTS:
    BEGIN OF co_inheritance_mode,
      active   TYPE ty_inheritance_mode VALUE 'ACTIVE',
      inactive TYPE ty_inheritance_mode VALUE 'INACTIVE',
    END OF co_inheritance_mode.

  TYPES ty_auth_field TYPE c LENGTH 10.
  TYPES ty_auth_value TYPE zif_abapgit_aff_types_v1=>ty_object_name_40.

  TYPES:
    BEGIN OF ty_sao_afv,
      auth_field_name  TYPE ty_auth_field,
      auth_field_value TYPE ty_auth_value,
    END OF ty_sao_afv.

  TYPES ty_sao_afv_t        TYPE STANDARD TABLE OF ty_sao_afv WITH DEFAULT KEY.

  TYPES ty_auth_object_name TYPE c LENGTH 10.

  TYPES ty_sao_name         TYPE ty_auth_object_name.

  TYPES:
    BEGIN OF ty_sao,
      auth_object_name         TYPE ty_sao_name,
      auth_object_field_values TYPE ty_sao_afv_t,
    END OF ty_sao.

  TYPES:
    BEGIN OF ty_ad_afv,
      auth_field_name       TYPE ty_auth_field,
      auth_field_low_value  TYPE ty_auth_value,
      auth_field_high_value TYPE ty_auth_value,
    END OF ty_ad_afv.
  TYPES ty_ad_afv_t TYPE STANDARD TABLE OF ty_ad_afv WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_ad_ao,
      auth_object_name         TYPE ty_auth_object_name,
      maintenance_status       TYPE ty_maintenance_status,
      documentation            TYPE string,
      auth_object_field_values TYPE ty_ad_afv_t,
    END OF ty_ad_ao.

  TYPES ty_ad_ao_t TYPE STANDARD TABLE OF ty_ad_ao WITH KEY auth_object_name.

  TYPES:
    BEGIN OF ty_ad,
      maintenance_mode        TYPE ty_maintenance_mode,
      default_values_required TYPE ty_default_values_required,
      inheritance_mode        TYPE ty_inheritance_mode,
      documentation           TYPE string,
      auth_objects            TYPE ty_ad_ao_t,
    END OF ty_ad.

  TYPES:
    BEGIN OF ty_authorizations,
      start_authorization_object TYPE ty_sao,
      authorization_defaults     TYPE ty_ad,
    END OF ty_authorizations.

  TYPES:
    BEGIN OF ty_transaction_service,
      application_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      application_type TYPE c LENGTH 2,
      program_id       TYPE c LENGTH 4,
      object_type      TYPE c LENGTH 4,
      object_name      TYPE zif_abapgit_aff_types_v1=>ty_object_name_40,
      service_type     TYPE c LENGTH 16,
      service          TYPE string,
    END OF ty_transaction_service.
  TYPES ty_transaction_service_t TYPE STANDARD TABLE OF ty_transaction_service WITH DEFAULT KEY.

  TYPES ty_transaction_rel_type TYPE c LENGTH 10.
  CONSTANTS:
    BEGIN OF co_transaction_rel_type,
      include_role  TYPE ty_transaction_rel_type VALUE 'INCL_ROLE',
      requires_role TYPE ty_transaction_rel_type VALUE 'REQU_ROLE',
    END OF co_transaction_rel_type.

  TYPES:
    BEGIN OF ty_transaction_relationship,
      relationship_type TYPE ty_transaction_rel_type,
      related_tcode     TYPE ty_transaction_code,
    END OF ty_transaction_relationship.
  TYPES ty_transaction_relationship_t TYPE STANDARD TABLE OF ty_transaction_relationship WITH DEFAULT KEY.


  TYPES ty_transaction_srv_rel_type TYPE c LENGTH 10.
  CONSTANTS:
    BEGIN OF co_transaction_srv_rel_type,
      include_role  TYPE ty_transaction_srv_rel_type VALUE 'INCL_ROLE',
      requires_role TYPE ty_transaction_srv_rel_type VALUE 'REQU_ROLE',
    END OF co_transaction_srv_rel_type.

  TYPES:
    BEGIN OF ty_service_relationship,
      relationship_type        TYPE ty_transaction_srv_rel_type,
      related_application_type TYPE c LENGTH 2,
      related_application_name TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      program_id               TYPE c LENGTH 4,
      object_type              TYPE c LENGTH 4,
      object_name              TYPE zif_abapgit_aff_types_v1=>ty_object_name_40,
      service_type             TYPE c LENGTH 16,
      service                  TYPE string,
    END OF ty_service_relationship.
  TYPES ty_service_relationship_t TYPE STANDARD TABLE OF ty_service_relationship WITH DEFAULT KEY.

  TYPES ty_ui_classification TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_ui_classification,
      professional_user_transaction TYPE ty_ui_classification VALUE 'P',
      easy_web_transaction          TYPE ty_ui_classification VALUE 'E',
    END OF co_ui_classification.

  TYPES ty_ua_inheritance_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_ua_inheritance_mode,
      active   TYPE ty_ua_inheritance_mode VALUE 'A',
      inactive TYPE ty_ua_inheritance_mode VALUE 'I',
    END OF co_ua_inheritance_mode.

  TYPES ty_ua_pervasive_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_ua_pervasive_mode,
      disabled TYPE ty_ua_pervasive_mode VALUE 'D',
      enabled  TYPE ty_ua_pervasive_mode VALUE 'E',
    END OF co_ua_pervasive_mode.

  TYPES ty_ua_support_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_ua_support_mode,
      supported     TYPE ty_ua_support_mode VALUE 'X',
      not_supported TYPE ty_ua_support_mode VALUE ' ',
    END OF co_ua_support_mode.

  TYPES ty_ua_platin_mode TYPE ty_ua_support_mode.
  TYPES ty_ua_webgui_mode TYPE ty_ua_support_mode.
  TYPES ty_ua_win32_mode  TYPE ty_ua_support_mode.

  TYPES:
    BEGIN OF ty_ui_attributes,
      inheritance_mode  TYPE ty_ua_inheritance_mode,
      ui_classification TYPE ty_ui_classification,
      iac_service_name  TYPE c LENGTH 14,
      pervasive_mode    TYPE ty_ua_pervasive_mode,
      webgui_mode       TYPE ty_ua_webgui_mode,
      platin_mode       TYPE ty_ua_platin_mode,
      win32_mode        TYPE ty_ua_win32_mode,
    END OF ty_ui_attributes.

  TYPES:
    BEGIN OF ty_user_interface,
      ui_attributes TYPE ty_ui_attributes,
    END OF ty_user_interface.

  TYPES:
    BEGIN OF ty_main,
      format_version            TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header                    TYPE zif_abapgit_aff_types_v1=>ty_header_80,
      general_information       TYPE ty_general_information,
      transaction_services      TYPE ty_transaction_service_t,
      transaction_relationships TYPE ty_transaction_relationship_t,
      service_relationships     TYPE ty_service_relationship_t,
      user_interface            TYPE ty_user_interface,
      authorizations            TYPE ty_authorizations,
    END OF ty_main.

ENDINTERFACE.
