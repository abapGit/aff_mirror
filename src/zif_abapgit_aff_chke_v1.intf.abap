INTERFACE zif_abapgit_aff_chke_v1
  PUBLIC.

  TYPES ty_user_name     TYPE c LENGTH 12.
  TYPES ty_email_address TYPE c LENGTH 241.
  TYPES ty_state TYPE c LENGTH 4.
  CONSTANTS:
    BEGIN OF co_state,
      open     TYPE ty_state VALUE 'OPEN',
      approved TYPE ty_state VALUE 'OK',
      rejected TYPE ty_state VALUE 'REJ',
    END OF co_state.
  TYPES ty_notification_type TYPE c LENGTH 4.
  CONSTANTS:
    BEGIN OF co_notification_type,
      on_rejection              TYPE ty_notification_type VALUE 'REJ',
      on_approval_and_rejection TYPE ty_notification_type VALUE 'ALWS',
      no_email_notification     TYPE ty_notification_type VALUE 'NEVR',
    END OF co_notification_type.
  TYPES ty_object_scope TYPE c LENGTH 4.
  CONSTANTS:
    BEGIN OF co_object_scope,
      finding TYPE ty_object_scope VALUE 'FND',
    END OF co_object_scope.
  TYPES ty_check_scope TYPE c LENGTH 3.
  CONSTANTS:
    BEGIN OF co_check_scope,
      finding TYPE ty_check_scope VALUE 'FND',
    END OF co_check_scope.
  TYPES:
    BEGIN OF ty_header_without_description,
      original_language     TYPE zif_abapgit_aff_types_v1=>ty_original_language,
      abap_language_version TYPE zif_abapgit_aff_types_v1=>ty_abap_language_version,
    END OF ty_header_without_description.
  TYPES:
    BEGIN OF ty_process_info,
      state             TYPE ty_state,
      notification_type TYPE ty_notification_type,
      exemption_id      TYPE c LENGTH 32,
    END OF ty_process_info.
  TYPES:
    BEGIN OF ty_request_info,
      requester       TYPE ty_user_name,
      requester_email TYPE ty_email_address,
      reason          TYPE c LENGTH 4,
      justification   TYPE string,
    END OF ty_request_info.
  TYPES:
    BEGIN OF ty_assessment_info,
      approver       TYPE ty_user_name,
      approver_email TYPE ty_email_address,
      assessment     TYPE string,
    END OF ty_assessment_info.
  TYPES:
    BEGIN OF ty_object_validity,
      object_scope     TYPE ty_object_scope,
      object_name      TYPE zif_abapgit_aff_types_v1=>ty_object_name_40,
      object_type      TYPE c LENGTH 4,
      subobject_name   TYPE c LENGTH 61,
      subobject_type   TYPE c LENGTH 4,
      checksum_version TYPE i,
      checksum         TYPE i,
    END OF ty_object_validity.
  TYPES:
    BEGIN OF ty_check_validity,
      check_scope  TYPE ty_check_scope,
      check_class  TYPE zif_abapgit_aff_types_v1=>ty_object_name_30,
      message_code TYPE c LENGTH 25,
    END OF ty_check_validity.
  TYPES:
    BEGIN OF ty_constraints,
      expiration_date             TYPE d,
      affected_software_component TYPE c LENGTH 30,
      valid_release               TYPE c LENGTH 10,
      valid_support_package       TYPE c LENGTH 10,
    END OF ty_constraints.
  TYPES:
    BEGIN OF ty_main,
      format_version  TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header          TYPE ty_header_without_description,
      process_info    TYPE ty_process_info,
      request_info    TYPE ty_request_info,
      assessment_info TYPE ty_assessment_info,
      object_validity TYPE ty_object_validity,
      check_validity  TYPE ty_check_validity,
      constraints     TYPE ty_constraints,
    END OF ty_main.

ENDINTERFACE.
