INTERFACE zif_abapgit_aff_svim_v1
  PUBLIC.

  TYPES ty_screen_layout TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_screen_layout,
      overview            TYPE ty_screen_layout VALUE '1',
      overview_and_detail TYPE ty_screen_layout VALUE '2',
    END OF co_screen_layout.

  TYPES ty_transport_recording TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_transport_recording,
      standard   TYPE ty_transport_recording VALUE ' ',
      none       TYPE ty_transport_recording VALUE 'X',
      via_events TYPE ty_transport_recording VALUE 'U',
    END OF co_transport_recording.

  TYPES ty_event_code TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_event_code,
      before_save                   TYPE ty_event_code VALUE '01',
      after_save                    TYPE ty_event_code VALUE '02',
      before_delete                 TYPE ty_event_code VALUE '03',
      after_delete                  TYPE ty_event_code VALUE '04',
      on_create                     TYPE ty_event_code VALUE '05',
      after_get_original_complete   TYPE ty_event_code VALUE '06',
      before_content_correction     TYPE ty_event_code VALUE '07',
      after_content_correction      TYPE ty_event_code VALUE '08',
      after_get_original_entry      TYPE ty_event_code VALUE '09',
      after_create_transport_header TYPE ty_event_code VALUE '10',
      after_change_transport_key    TYPE ty_event_code VALUE '11',
      after_change_transport_keys   TYPE ty_event_code VALUE '12',
      on_exit                       TYPE ty_event_code VALUE '13',
      after_lock_unlock             TYPE ty_event_code VALUE '14',
      before_restore_deleted        TYPE ty_event_code VALUE '15',
      after_restore_deleted         TYPE ty_event_code VALUE '16',
      after_change_check            TYPE ty_event_code VALUE '18',
      after_init_globals            TYPE ty_event_code VALUE '19',
      after_date_subscreen          TYPE ty_event_code VALUE '20',
      fill_hidden_fields            TYPE ty_event_code VALUE '21',
      on_open_long_text_other_lang  TYPE ty_event_code VALUE '22',
      before_address_screen         TYPE ty_event_code VALUE '23',
      after_restrict_entry          TYPE ty_event_code VALUE '24',
      authorization_check           TYPE ty_event_code VALUE '25',
      before_list                   TYPE ty_event_code VALUE '26',
      after_guid_creation           TYPE ty_event_code VALUE '27',
      after_date_input              TYPE ty_event_code VALUE '28',
      replace_std_read_routine      TYPE ty_event_code VALUE 'AA',
      replace_std_db_change_routine TYPE ty_event_code VALUE 'AB',
      replace_std_get_original      TYPE ty_event_code VALUE 'AC',
      replace_std_ro_field_routine  TYPE ty_event_code VALUE 'AD',
      replace_std_positioning       TYPE ty_event_code VALUE 'AE',
      replace_read_texts_other_lang TYPE ty_event_code VALUE 'AF',
      replace_get_orig_texts        TYPE ty_event_code VALUE 'AG',
      replace_db_change_texts       TYPE ty_event_code VALUE 'AH',
      gui_menu_program              TYPE ty_event_code VALUE 'ST',
    END OF co_event_code.

  TYPES:
    BEGIN OF ty_general_information,
      function_group         TYPE c LENGTH 26,
      screen_layout          TYPE ty_screen_layout,
      overview_screen_number TYPE n LENGTH 4,
      detail_screen_number   TYPE n LENGTH 4,
      transport_recording    TYPE ty_transport_recording,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_event,
      event      TYPE ty_event_code,
      subroutine TYPE c LENGTH 30,
    END OF ty_event.

  TYPES ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY event.

  TYPES:
    BEGIN OF ty_main,
      format_version      TYPE zif_abapgit_aff_types_v1=>ty_format_version,
      header              TYPE zif_abapgit_aff_types_v1=>ty_header_60_cloud,
      general_information TYPE ty_general_information,
      events              TYPE ty_events,
    END OF ty_main.

ENDINTERFACE.
