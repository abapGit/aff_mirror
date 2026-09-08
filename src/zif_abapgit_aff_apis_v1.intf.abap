INTERFACE zif_abapgit_aff_apis_v1
  PUBLIC.

  TYPES ty_directory_object_type  TYPE c LENGTH 4.

  TYPES ty_directory_object_name  TYPE c LENGTH 40.

  TYPES ty_releasable_object_type TYPE c LENGTH 20.

  TYPES ty_releasable_object_name TYPE c LENGTH 120.

  TYPES ty_release_contract       TYPE c LENGTH 2.

  TYPES ty_release_state          TYPE c LENGTH 30.

  TYPES ty_feature_toggle_id      TYPE c LENGTH 40.

  TYPES ty_decommissioning_date   TYPE c LENGTH 7.

  TYPES ty_successor_concept_name TYPE c LENGTH 50.

  TYPES ty_local_comment          TYPE string.

  CONSTANTS:
    BEGIN OF co_release_contract,
      c0 TYPE ty_release_contract VALUE 'C0',
      c1 TYPE ty_release_contract VALUE 'C1',
      c2 TYPE ty_release_contract VALUE 'C2',
      c3 TYPE ty_release_contract VALUE 'C3',
      c4 TYPE ty_release_contract VALUE 'C4',
    END OF co_release_contract.

  CONSTANTS:
    BEGIN OF co_release_state,
      released                     TYPE ty_release_state VALUE 'RELEASED',
      deprecated                   TYPE ty_release_state VALUE 'DEPRECATED',
      decommissioned               TYPE ty_release_state VALUE 'DECOMMISSIONED',
      released_with_feature_toggle TYPE ty_release_state VALUE 'RELEASED_WITH_FEATURE_TOGGLE',
      not_to_be_released           TYPE ty_release_state VALUE 'NOT_TO_BE_RELEASED',
      not_to_be_released_stable    TYPE ty_release_state VALUE 'NOT_TO_BE_RELEASED_STABLE',
    END OF co_release_state.

  TYPES:
    BEGIN OF ty_visibility,
      use_in_cloud_development TYPE abap_bool,
      use_in_key_user_apps     TYPE abap_bool,
    END OF ty_visibility.

  TYPES:
    BEGIN OF ty_directory_object_key,
      type TYPE ty_directory_object_type,
      name TYPE ty_directory_object_name,
    END OF ty_directory_object_key.

  TYPES:
    BEGIN OF ty_releasable_object_key,
      type TYPE ty_releasable_object_type,
      name TYPE ty_releasable_object_name,
    END OF ty_releasable_object_key.

  TYPES:
    BEGIN OF ty_successor_api,
      directory_object_type  TYPE ty_directory_object_type,
      directory_object_name  TYPE ty_directory_object_name,
      releasable_object_type TYPE ty_releasable_object_type,
      releasable_object_name TYPE ty_releasable_object_name,
    END OF ty_successor_api.

  TYPES ty_successor_apis TYPE SORTED TABLE OF ty_successor_api WITH UNIQUE KEY directory_object_type
    directory_object_name releasable_object_type releasable_object_name.

  TYPES:
    BEGIN OF ty_successor_information,
      successor_concept_name TYPE ty_successor_concept_name,
      successor_apis         TYPE ty_successor_apis,
    END OF ty_successor_information.

  TYPES:
    BEGIN OF ty_api_release_state,
      release_contract             TYPE ty_release_contract,
      release_state                TYPE ty_release_state,
      local_comment                TYPE ty_local_comment,
      visibility                   TYPE ty_visibility,
      feature_toggle_id            TYPE ty_feature_toggle_id,
      planned_decommissioning_date TYPE ty_decommissioning_date,
      successor_information        TYPE ty_successor_information,
    END OF ty_api_release_state.

  TYPES ty_api_release_states TYPE SORTED TABLE OF ty_api_release_state WITH UNIQUE KEY release_contract.

  TYPES:
    BEGIN OF ty_api,
      releasable_object_key TYPE ty_releasable_object_key,
      api_release_states    TYPE ty_api_release_states,
    END OF ty_api.

  TYPES ty_apis TYPE SORTED TABLE OF ty_api WITH UNIQUE KEY releasable_object_key.

  TYPES:
    BEGIN OF ty_main,
      format_version       TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header               TYPE zif_abapgit_aff_types_v1=>ty_header_60_no_abap_lv,
      directory_object_key TYPE ty_directory_object_key,
      apis                 TYPE ty_apis,
    END OF ty_main.

ENDINTERFACE.
