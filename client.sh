#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Generator version: 7.10.0-SNAPSHOT
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for Kandji API.
#
# LICENSE:
# 
#
# CONTACT:
# 
#
# MORE INFORMATION:
# 
#

# For improved pattern matching in case statements
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodetection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::sso"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::name"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::description"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.code"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.is_active"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsGet:::id"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsGet:::id__in"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsGet:::name"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::name"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::enrollment_code.is_active"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::enrollment_code.code"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::source.type"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::source.id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsPost:::type"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsTemplatesGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1BlueprintsTemplatesGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionErasePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionErasePost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionLockPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionLockPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActivityGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActivityGet:::limit"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActivityGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdAppsGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdCommandsGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdCommandsGet:::limit"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdCommandsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdDelete:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdDetailsGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdDetailsLostmodeDelete:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdDetailsLostmodeGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdLibraryItemsGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdDelete:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdDelete:::note_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdGet:::note_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdParametersGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdStatusGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesGet:::limit"]=1
operation_parameters_minimum_occurrences["apiV1DevicesGet:::asset_tag"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::blueprint_id"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::device_id"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::device_name"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::filevault_enabled"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::mac_address"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::model"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::ordering"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::os_version"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::platform"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::serial_number"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::tag_name"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::tag_name_in"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::tag_id"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::tag_id_in"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::user"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::user_email"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::user_id"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::user_name"]=0
operation_parameters_minimum_occurrences["apiV1DevicesGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::page"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::phone"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::email"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::file"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::blueprint_id"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::user_id"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::dep_account"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::device_family"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::model"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::os"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::profile_status"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::serial_number"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::page"]=0
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdePost:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdePost:::phone"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdePost:::email"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdePost:::file"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsGet:::page"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::name"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::active"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::name"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::file_key"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::install_type"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::install_enforcement"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::show_in_self_service"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::self_service_category_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsPost:::self_service_recommended"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsUploadPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesGet:::page"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_mac"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_iphone"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_ipad"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_tv"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::name"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::file"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::active"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_mac"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_iphone"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_ipad"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_tv"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsGet:::page"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::activity_type"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_id"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_email"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::computer_id"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismActivationLockGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismApplicationFirewallGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismAppsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismCertificatesGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismCountGet:::category"]=1
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismDesktopAndScreensaverGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismDeviceInformationGet:::body"]=0
operation_parameters_minimum_occurrences["apiV1PrismExportExportIdGet:::export_id"]=1
operation_parameters_minimum_occurrences["apiV1PrismExportPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismFilevaultGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismInstalledProfilesGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismKernelExtensionsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismLocalUsersGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismStartupSettingsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismSystemExtensionsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::device_families"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::filter"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1PrismTransparencyDatabaseGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1TagsGet:::search"]=1
operation_parameters_minimum_occurrences["apiV1TagsPost:::body"]=0
operation_parameters_minimum_occurrences["apiV1TagsTagIdDelete:::tag_id"]=1
operation_parameters_minimum_occurrences["apiV1TagsTagIdPatch:::tag_id"]=1
operation_parameters_minimum_occurrences["apiV1TagsTagIdPatch:::body"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::classification"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::date_range"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::device_id"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::status"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::sort_by"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::term"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::limit"]=0
operation_parameters_minimum_occurrences["apiV1ThreatDetailsGet:::offset"]=0
operation_parameters_minimum_occurrences["apiV1UsersGet:::email"]=0
operation_parameters_minimum_occurrences["apiV1UsersGet:::id"]=0
operation_parameters_minimum_occurrences["apiV1UsersGet:::integration_id"]=0
operation_parameters_minimum_occurrences["apiV1UsersGet:::archived"]=0
operation_parameters_minimum_occurrences["apiV1UsersUserIdGet:::user_id"]=1
operation_parameters_minimum_occurrences["rootPost:::key"]=1
operation_parameters_minimum_occurrences["rootPost:::x-amz-algorithm"]=1
operation_parameters_minimum_occurrences["rootPost:::x-amz-credential"]=1
operation_parameters_minimum_occurrences["rootPost:::x-amz-date"]=1
operation_parameters_minimum_occurrences["rootPost:::x-amz-security-token"]=1
operation_parameters_minimum_occurrences["rootPost:::policy"]=1
operation_parameters_minimum_occurrences["rootPost:::x-amz-signature"]=1
operation_parameters_minimum_occurrences["rootPost:::file"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::sso"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::name"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::description"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.code"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.is_active"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsGet:::id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsGet:::id__in"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsGet:::name"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::name"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::enrollment_code.is_active"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::enrollment_code.code"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::source.type"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::source.id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsPost:::type"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsTemplatesGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsTemplatesGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionErasePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionErasePost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionLockPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionLockPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActivityGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActivityGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActivityGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdAppsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdCommandsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdCommandsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdCommandsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdDelete:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdDetailsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdDetailsLostmodeDelete:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdDetailsLostmodeGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdLibraryItemsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdDelete:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdDelete:::note_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdGet:::note_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdParametersGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdStatusGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::asset_tag"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::device_name"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::filevault_enabled"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::mac_address"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::model"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::ordering"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::os_version"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::platform"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::serial_number"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::tag_name"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::tag_name_in"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::tag_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::tag_id_in"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::user"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::user_email"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::user_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::user_name"]=0
operation_parameters_maximum_occurrences["apiV1DevicesGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::page"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::phone"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::email"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::file"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::user_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::dep_account"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::device_family"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::model"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::os"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::profile_status"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::serial_number"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesGet:::page"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdePost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdePost:::phone"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdePost:::email"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdePost:::file"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsGet:::page"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::name"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::active"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::name"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::file_key"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::install_type"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::install_enforcement"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::show_in_self_service"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::self_service_category_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsPost:::self_service_recommended"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsUploadPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesGet:::page"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_mac"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_iphone"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_ipad"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_tv"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::name"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::file"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::active"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_mac"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_iphone"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_ipad"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesPost:::runs_on_tv"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsGet:::page"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::activity_type"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_email"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::computer_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismActivationLockGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismApplicationFirewallGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismAppsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismCertificatesGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismCountGet:::category"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismDesktopAndScreensaverGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismDeviceInformationGet:::body"]=0
operation_parameters_maximum_occurrences["apiV1PrismExportExportIdGet:::export_id"]=0
operation_parameters_maximum_occurrences["apiV1PrismExportPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismFilevaultGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismGatekeeperAndXprotectGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismInstalledProfilesGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismKernelExtensionsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismLaunchAgentsAndDaemonsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismLocalUsersGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismStartupSettingsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismSystemExtensionsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::device_families"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::filter"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1PrismTransparencyDatabaseGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1TagsGet:::search"]=0
operation_parameters_maximum_occurrences["apiV1TagsPost:::body"]=0
operation_parameters_maximum_occurrences["apiV1TagsTagIdDelete:::tag_id"]=0
operation_parameters_maximum_occurrences["apiV1TagsTagIdPatch:::tag_id"]=0
operation_parameters_maximum_occurrences["apiV1TagsTagIdPatch:::body"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::classification"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::date_range"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::status"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::sort_by"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::term"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::limit"]=0
operation_parameters_maximum_occurrences["apiV1ThreatDetailsGet:::offset"]=0
operation_parameters_maximum_occurrences["apiV1UsersGet:::email"]=0
operation_parameters_maximum_occurrences["apiV1UsersGet:::id"]=0
operation_parameters_maximum_occurrences["apiV1UsersGet:::integration_id"]=0
operation_parameters_maximum_occurrences["apiV1UsersGet:::archived"]=0
operation_parameters_maximum_occurrences["apiV1UsersUserIdGet:::user_id"]=0
operation_parameters_maximum_occurrences["rootPost:::key"]=0
operation_parameters_maximum_occurrences["rootPost:::x-amz-algorithm"]=0
operation_parameters_maximum_occurrences["rootPost:::x-amz-credential"]=0
operation_parameters_maximum_occurrences["rootPost:::x-amz-date"]=0
operation_parameters_maximum_occurrences["rootPost:::x-amz-security-token"]=0
operation_parameters_maximum_occurrences["rootPost:::policy"]=0
operation_parameters_maximum_occurrences["rootPost:::x-amz-signature"]=0
operation_parameters_maximum_occurrences["rootPost:::file"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::body"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::sso"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::name"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::description"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.code"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::enrollment_code.is_active"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::body"]=""
operation_parameters_collection_type["apiV1BlueprintsGet:::id"]=""
operation_parameters_collection_type["apiV1BlueprintsGet:::id__in"]=""
operation_parameters_collection_type["apiV1BlueprintsGet:::name"]=""
operation_parameters_collection_type["apiV1BlueprintsGet:::limit"]=""
operation_parameters_collection_type["apiV1BlueprintsGet:::offset"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::name"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::enrollment_code.is_active"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::enrollment_code.code"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::source.type"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::source.id"]=""
operation_parameters_collection_type["apiV1BlueprintsPost:::type"]=""
operation_parameters_collection_type["apiV1BlueprintsTemplatesGet:::limit"]=""
operation_parameters_collection_type["apiV1BlueprintsTemplatesGet:::offset"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionDeleteuserPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionEnablelostmodePost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionErasePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionErasePost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionLockPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionLockPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRemotedesktopPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRestartPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionSetnamePost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUnlockaccountPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActivityGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActivityGet:::limit"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActivityGet:::offset"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdAppsGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdCommandsGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdCommandsGet:::limit"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdCommandsGet:::offset"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdDelete:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdDetailsGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdDetailsLostmodeDelete:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdDetailsLostmodeGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdLibraryItemsGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdDelete:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdDelete:::note_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdGet:::note_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesPost:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdParametersGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdPatch:::body"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdStatusGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesGet:::limit"]=""
operation_parameters_collection_type["apiV1DevicesGet:::asset_tag"]=""
operation_parameters_collection_type["apiV1DevicesGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1DevicesGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesGet:::device_name"]=""
operation_parameters_collection_type["apiV1DevicesGet:::filevault_enabled"]=""
operation_parameters_collection_type["apiV1DevicesGet:::mac_address"]=""
operation_parameters_collection_type["apiV1DevicesGet:::model"]=""
operation_parameters_collection_type["apiV1DevicesGet:::ordering"]=""
operation_parameters_collection_type["apiV1DevicesGet:::os_version"]=""
operation_parameters_collection_type["apiV1DevicesGet:::platform"]=""
operation_parameters_collection_type["apiV1DevicesGet:::serial_number"]=""
operation_parameters_collection_type["apiV1DevicesGet:::tag_name"]=""
operation_parameters_collection_type["apiV1DevicesGet:::tag_name_in"]=""
operation_parameters_collection_type["apiV1DevicesGet:::tag_id"]=""
operation_parameters_collection_type["apiV1DevicesGet:::tag_id_in"]=""
operation_parameters_collection_type["apiV1DevicesGet:::user"]=""
operation_parameters_collection_type["apiV1DevicesGet:::user_email"]=""
operation_parameters_collection_type["apiV1DevicesGet:::user_id"]=""
operation_parameters_collection_type["apiV1DevicesGet:::user_name"]=""
operation_parameters_collection_type["apiV1DevicesGet:::offset"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::page"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::body"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::phone"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::email"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::file"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::body"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::user_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::dep_account"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::device_family"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::model"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::os"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::profile_status"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::serial_number"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesGet:::page"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdePost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdePost:::phone"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdePost:::email"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdePost:::file"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsGet:::page"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdPatch:::name"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdPatch:::active"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::name"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::file_key"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::install_type"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::install_enforcement"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::show_in_self_service"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::self_service_category_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsPost:::self_service_recommended"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsUploadPost:::body"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesGet:::page"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_mac"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_iphone"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_ipad"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::runs_on_tv"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::name"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::file"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::active"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::runs_on_mac"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::runs_on_iphone"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::runs_on_ipad"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesPost:::runs_on_tv"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsGet:::page"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdPatch:::body"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsPost:::body"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::activity_type"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::user_email"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::limit"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::offset"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::computer_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::limit"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismActivationLockGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismApplicationFirewallGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismAppsGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismCertificatesGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismCountGet:::category"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismDesktopAndScreensaverGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismDeviceInformationGet:::body"]=""
operation_parameters_collection_type["apiV1PrismExportExportIdGet:::export_id"]=""
operation_parameters_collection_type["apiV1PrismExportPost:::body"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismFilevaultGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismGatekeeperAndXprotectGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismInstalledProfilesGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismKernelExtensionsGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismLaunchAgentsAndDaemonsGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismLocalUsersGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismStartupSettingsGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismSystemExtensionsGet:::offset"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::blueprint_ids"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::device_families"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::filter"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::sort_by"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::limit"]=""
operation_parameters_collection_type["apiV1PrismTransparencyDatabaseGet:::offset"]=""
operation_parameters_collection_type["apiV1TagsGet:::search"]=""
operation_parameters_collection_type["apiV1TagsPost:::body"]=""
operation_parameters_collection_type["apiV1TagsTagIdDelete:::tag_id"]=""
operation_parameters_collection_type["apiV1TagsTagIdPatch:::tag_id"]=""
operation_parameters_collection_type["apiV1TagsTagIdPatch:::body"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::classification"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::date_range"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::device_id"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::status"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::sort_by"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::term"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::limit"]=""
operation_parameters_collection_type["apiV1ThreatDetailsGet:::offset"]=""
operation_parameters_collection_type["apiV1UsersGet:::email"]=""
operation_parameters_collection_type["apiV1UsersGet:::id"]=""
operation_parameters_collection_type["apiV1UsersGet:::integration_id"]=""
operation_parameters_collection_type["apiV1UsersGet:::archived"]=""
operation_parameters_collection_type["apiV1UsersUserIdGet:::user_id"]=""
operation_parameters_collection_type["rootPost:::key"]=""
operation_parameters_collection_type["rootPost:::x-amz-algorithm"]=""
operation_parameters_collection_type["rootPost:::x-amz-credential"]=""
operation_parameters_collection_type["rootPost:::x-amz-date"]=""
operation_parameters_collection_type["rootPost:::x-amz-security-token"]=""
operation_parameters_collection_type["rootPost:::policy"]=""
operation_parameters_collection_type["rootPost:::x-amz-signature"]=""
operation_parameters_collection_type["rootPost:::file"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""


##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
    done
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    if [[ $RAW_BODY == "1" ]]; then
        echo "-d '${body_parameters["RAW_BODY"]}'"
    else
        local body_json="-d '{"
        local count=0
        for key in "${!body_parameters[@]}"; do
            if [[ $((count++)) -gt 0 ]]; then
                body_json+=", "
            fi
            body_json+="\"${key}\": ${body_parameters[${key}]}"
        done
        body_json+="}'"

        if [[ "${#body_parameters[@]}" -eq 0 ]]; then
            echo ""
        else
            echo "${body_json}"
        fi
    fi
}

##############################################################################
#
# Converts an associative array into form urlencoded string
#
##############################################################################
body_parameters_to_form_urlencoded() {
    local body_form_urlencoded="-d '"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_form_urlencoded+="&"
        fi
        body_form_urlencoded+="${key}=${body_parameters[${key}]}"
    done
    body_form_urlencoded+="'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_form_urlencoded}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    for qparam in "${query_params[@]}"; do
        if [[ "${operation_parameters[$qparam]}" == "" ]]; then
            continue
        fi

        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")



        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'multi' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            if [[ -n "${query_request_part}" ]]; then
                query_request_part+="&"
            fi
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}Kandji API command line client (API version 1.0.0)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Authentication methods${OFF}"
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[default]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}apiV1BlueprintsBlueprintIdAssignLibraryItemPost${OFF};Assign Library Item (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdDelete${OFF};Delete Blueprint (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdGet${OFF};Get Blueprint (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdListLibraryItemsGet${OFF};List Library Items (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet${OFF};Get Manual Enrollment Profile (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdPatch${OFF};Update Blueprint (AUTH)
  ${CYAN}apiV1BlueprintsBlueprintIdRemoveLibraryItemPost${OFF};Remove Library Item (AUTH)
  ${CYAN}apiV1BlueprintsGet${OFF};List Blueprints (AUTH)
  ${CYAN}apiV1BlueprintsPost${OFF};Create Blueprint (AUTH)
  ${CYAN}apiV1BlueprintsTemplatesGet${OFF};Get Blueprint Templates (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionBlankpushPost${OFF};Send Blankpush (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionClearpasscodePost${OFF};Clear Passcode (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionDeleteuserPost${OFF};Delete User (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionDisablelostmodePost${OFF};Disable Lost Mode (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionEnablelostmodePost${OFF};Enable Lost Mode (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionErasePost${OFF};Erase Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionLockPost${OFF};Lock Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionPlaylostmodesoundPost${OFF};Play Lost Mode Sound (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionReinstallagentPost${OFF};Reinstall Agent (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionRemotedesktopPost${OFF};Remote Desktop (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionRenewmdmprofilePost${OFF};Renew MDM Profile (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionRestartPost${OFF};Restart Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionSetnamePost${OFF};Set Name (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionShutdownPost${OFF};Shutdown (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionUnlockaccountPost${OFF};Unlock Account (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionUpdateinventoryPost${OFF};Update Inventory (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActionUpdatelocationPost${OFF};Update Location (AUTH)
  ${CYAN}apiV1DevicesDeviceIdActivityGet${OFF};Get Device Activity (AUTH)
  ${CYAN}apiV1DevicesDeviceIdAppsGet${OFF};Get Device Apps (AUTH)
  ${CYAN}apiV1DevicesDeviceIdCommandsGet${OFF};Get Device Commands (AUTH)
  ${CYAN}apiV1DevicesDeviceIdDelete${OFF};Delete Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdDetailsGet${OFF};Get Device Details (AUTH)
  ${CYAN}apiV1DevicesDeviceIdDetailsLostmodeDelete${OFF};Cancel Lost Mode (AUTH)
  ${CYAN}apiV1DevicesDeviceIdDetailsLostmodeGet${OFF};Get Device Lost Mode details (AUTH)
  ${CYAN}apiV1DevicesDeviceIdGet${OFF};Get Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdLibraryItemsGet${OFF};Get Device Library Items (AUTH)
  ${CYAN}apiV1DevicesDeviceIdNotesGet${OFF};Get Device Notes (AUTH)
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdDelete${OFF};Delete Device Note (AUTH)
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdGet${OFF};Retrieve Device Note (AUTH)
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdPatch${OFF};Update Device Note (AUTH)
  ${CYAN}apiV1DevicesDeviceIdNotesPost${OFF};Create Device Note (AUTH)
  ${CYAN}apiV1DevicesDeviceIdParametersGet${OFF};Get Device Parameters (AUTH)
  ${CYAN}apiV1DevicesDeviceIdPatch${OFF};Update Device (AUTH)
  ${CYAN}apiV1DevicesDeviceIdSecretsBypasscodeGet${OFF};Get Activation Lock Bypass Code (AUTH)
  ${CYAN}apiV1DevicesDeviceIdSecretsFilevaultkeyGet${OFF};Get FileVault Recovery Key (AUTH)
  ${CYAN}apiV1DevicesDeviceIdSecretsRecoverypasswordGet${OFF};Get Recovery Lock Password (AUTH)
  ${CYAN}apiV1DevicesDeviceIdSecretsUnlockpinGet${OFF};Get Unlock Pin (AUTH)
  ${CYAN}apiV1DevicesDeviceIdStatusGet${OFF};Get Device Status (AUTH)
  ${CYAN}apiV1DevicesGet${OFF};List Devices (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdDelete${OFF};Delete ADE integration (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet${OFF};List devices associated to ADE token (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdGet${OFF};Get ADE integration (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdPatch${OFF};Update ADE integration (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdRenewPost${OFF};Renew ADE integration (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeDevicesDeviceIdGet${OFF};Get ADE device (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeDevicesDeviceIdPatch${OFF};Update ADE device (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeDevicesGet${OFF};List ADE devices (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdeGet${OFF};List ADE integrations (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdePost${OFF};Create ADE integration (AUTH)
  ${CYAN}apiV1IntegrationsAppleAdePublicKeyGet${OFF};Download ADE public key (AUTH)
  ${CYAN}apiV1LibraryCustomAppsGet${OFF};List Custom Apps (AUTH)
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdDelete${OFF};Delete Custom App (AUTH)
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdGet${OFF};Get Custom App (AUTH)
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdPatch${OFF};Update Custom App (AUTH)
  ${CYAN}apiV1LibraryCustomAppsPost${OFF};Create Custom App (AUTH)
  ${CYAN}apiV1LibraryCustomAppsUploadPost${OFF};Upload Custom App (AUTH)
  ${CYAN}apiV1LibraryCustomProfilesGet${OFF};List Custom Profiles (AUTH)
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdDelete${OFF};Delete Custom Profile (AUTH)
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdGet${OFF};Get Custom Profile (AUTH)
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdPatch${OFF};Update Custom Profile (AUTH)
  ${CYAN}apiV1LibraryCustomProfilesPost${OFF};Create Custom Profile (AUTH)
  ${CYAN}apiV1LibraryCustomScriptsGet${OFF};List Custom Scripts (AUTH)
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdDelete${OFF};Delete Custom Script (AUTH)
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdGet${OFF};Get Custom Script (AUTH)
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdPatch${OFF};Update Custom Script (AUTH)
  ${CYAN}apiV1LibraryCustomScriptsPost${OFF};Create Custom Script (AUTH)
  ${CYAN}apiV1LibraryLibraryItemsLibraryItemIdActivityGet${OFF};Get Library Item Activity (AUTH)
  ${CYAN}apiV1LibraryLibraryItemsLibraryItemIdStatusGet${OFF};Get Library Item Statuses (AUTH)
  ${CYAN}apiV1PrismActivationLockGet${OFF};Activation lock (AUTH)
  ${CYAN}apiV1PrismApplicationFirewallGet${OFF};Application firewall (AUTH)
  ${CYAN}apiV1PrismAppsGet${OFF};Applications (AUTH)
  ${CYAN}apiV1PrismCertificatesGet${OFF};Certificates (AUTH)
  ${CYAN}apiV1PrismCountGet${OFF};Count (AUTH)
  ${CYAN}apiV1PrismDesktopAndScreensaverGet${OFF};Desktop and Screensaver (AUTH)
  ${CYAN}apiV1PrismDeviceInformationGet${OFF};Device information (AUTH)
  ${CYAN}apiV1PrismExportExportIdGet${OFF};Get category export (AUTH)
  ${CYAN}apiV1PrismExportPost${OFF};Request category export (AUTH)
  ${CYAN}apiV1PrismFilevaultGet${OFF};FileVault (AUTH)
  ${CYAN}apiV1PrismGatekeeperAndXprotectGet${OFF};Gatekeeper and XProtect (AUTH)
  ${CYAN}apiV1PrismInstalledProfilesGet${OFF};Installed profiles (AUTH)
  ${CYAN}apiV1PrismKernelExtensionsGet${OFF};Kernel Extensions (AUTH)
  ${CYAN}apiV1PrismLaunchAgentsAndDaemonsGet${OFF};Launch Agents and Daemons (AUTH)
  ${CYAN}apiV1PrismLocalUsersGet${OFF};Local users (AUTH)
  ${CYAN}apiV1PrismStartupSettingsGet${OFF};Startup settings (AUTH)
  ${CYAN}apiV1PrismSystemExtensionsGet${OFF};System Extensions (AUTH)
  ${CYAN}apiV1PrismTransparencyDatabaseGet${OFF};Transparency database (AUTH)
  ${CYAN}apiV1SelfServiceCategoriesGet${OFF};List Self Service Categories (AUTH)
  ${CYAN}apiV1SettingsLicensingGet${OFF};Licensing (AUTH)
  ${CYAN}apiV1TagsGet${OFF};Get Tags (AUTH)
  ${CYAN}apiV1TagsPost${OFF};Create Tag (AUTH)
  ${CYAN}apiV1TagsTagIdDelete${OFF};Delete Tag (AUTH)
  ${CYAN}apiV1TagsTagIdPatch${OFF};Update Tag (AUTH)
  ${CYAN}apiV1ThreatDetailsGet${OFF};Get Threat Details (AUTH)
  ${CYAN}apiV1UsersGet${OFF};List Users (AUTH)
  ${CYAN}apiV1UsersUserIdGet${OFF};Get User (AUTH)
  ${CYAN}rootPost${OFF};Upload to S3 (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://&lt;post_url&gt;')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodetected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}Kandji API command line client (API version 1.0.0)${OFF}"
    echo ""
    echo -e "License: "
    echo -e "Contact: "
    echo ""
read -r -d '' appdescription <<EOF

<html><head></head><body><h1 id=\"welcome-to-the-kandji-api-documentation\">Welcome to the Kandji API Documentation</h1>
<p>You can find your API URL in Settings &gt; Access. The API URL will follow the below formats.</p>
<ul>
<li><p>US - <code>https://SubDomain.api.kandji.io</code></p>
</li>
<li><p>EU - <code>https://SubDomain.api.eu.kandji.io</code></p>
</li>
</ul>
<p>For information on how to obtain an API token, please refer to the following support article.</p>
<p><a href=\"https://support.kandji.io/api\">https://support.kandji.io/api</a></p>
<h4 id=\"rate-limit\">Rate Limit</h4>
<p>The Kandji API currently has an API rate limit of 10,000 requests per hour per customer.</p>
<h4 id=\"request-methods\">Request Methods</h4>
<p>HTTP request methods supported by the Kandji API.</p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th>Method</th>
<th>Definition</th>
</tr>
</thead>
<tbody>
<tr>
<td>GET</td>
<td>The <code>GET</code> method requests a representation of the specified resource.</td>
</tr>
<tr>
<td>POST</td>
<td>The <code>POST</code> method submits an entity to the specified resource.</td>
</tr>
<tr>
<td>PATCH</td>
<td>The <code>PATCH</code> method applies partial modifications to a resource.</td>
</tr>
<tr>
<td>DELETE</td>
<td>The <code>DELETE</code> method deletes the specified resource.</td>
</tr>
</tbody>
</table>
</div><h4 id=\"response-codes\">Response codes</h4>
<p>Not all response codes apply to every endpoint.</p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th>Code</th>
<th>Response</th>
</tr>
</thead>
<tbody>
<tr>
<td>200</td>
<td>OK</td>
</tr>
<tr>
<td>201</td>
<td>Created</td>
</tr>
<tr>
<td>204</td>
<td>No content</td>
</tr>
<tr>
<td></td>
<td>Typical response when sending the DELETE method.</td>
</tr>
<tr>
<td>400</td>
<td>Bad Request</td>
</tr>
<tr>
<td></td>
<td>\"Command already running\" - The command may already be running in a <em>Pending</em> state waiting on the device.</td>
</tr>
<tr>
<td></td>
<td>\"Command is not allowed for current device\" - The command may not be compatible with the target device.</td>
</tr>
<tr>
<td></td>
<td>\"JSON parse error - Expecting ',' delimiter: line 3 column 2 (char 65)\"</td>
</tr>
<tr>
<td>401</td>
<td>Unauthorized</td>
</tr>
<tr>
<td></td>
<td>This error can occur if the token is incorrect, was revoked, or the token has expired.</td>
</tr>
<tr>
<td>403</td>
<td>Forbidden</td>
</tr>
<tr>
<td></td>
<td>The request was understood but cannot be authorized.</td>
</tr>
<tr>
<td>404</td>
<td>Not found</td>
</tr>
<tr>
<td></td>
<td>Unable to locate the resource in the Kandji tenant.</td>
</tr>
<tr>
<td>415</td>
<td>Unsupported Media Type</td>
</tr>
<tr>
<td></td>
<td>The request contains a media type which the server or resource does not support.</td>
</tr>
<tr>
<td>500</td>
<td>Internal server error</td>
</tr>
<tr>
<td>503</td>
<td>Service unavailable</td>
</tr>
<tr>
<td></td>
<td>This error can occur if a file upload is still being processed via the custom apps API.</td>
</tr>
</tbody>
</table>
</div><h4 id=\"data-structure\">Data structure</h4>
<p>The API returns all structured responses in JSON schema format.</p>
<h4 id=\"examples\">Examples</h4>
<p>Code examples using the API can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools\">GitHub</a>.</p>
</body></html>
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}Kandji API command line client (API version 1.0.0)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdAssignLibraryItemPost operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdAssignLibraryItemPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdAssignLibraryItemPost - Assign Library Item${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows assigning a library item to a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=\"request-body\">Request Body</h3>
<ul>
<li><p><code>library_item_id</code> (string, required)</p>
</li>
<li><p><code>assignment_node_id</code> (string, required for maps)</p>
<ul>
<li>Note: To find the assignment_node_id, view the map in a browser. Then, on your keyboard, press and hold the Option ⌥ key. Each node ID remains fixed for the lifespan of the node on the map.</li>
</ul>
</li>
</ul>
<h3 id=\"error-responses\">Error responses</h3>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Code</strong></th>
<th><strong>Body</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>400 - Bad Request</td>
<td>Bad Request</td>
</tr>
<tr>
<td></td>
<td>\"Library Item already exists on Blueprint\"</td>
</tr>
<tr>
<td></td>
<td>\"Library Item already exists in Assignment Node\"</td>
</tr>
<tr>
<td></td>
<td>\"assignment_node_id cannot be provided for Classic Blueprint\"</td>
</tr>
<tr>
<td></td>
<td>\"Must provide assignment_node_id for Assignment Map Blueprint\"</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdDelete operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdDelete - Delete Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=\"warning\"><strong>WARNING!</strong></h1>
<p>This is a HIGHLY destructive action.</p>
<p>Deleting a Blueprint will un-manage ALL devices assigned to the Blueprint.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdGet - Get Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns information about a specific blueprint based on blueprint ID.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdListLibraryItemsGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdListLibraryItemsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdListLibraryItemsGet - List Library Items${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This API endpoint retrieves a list of library items associated with a specific blueprint. (classic and maps). Requires that the blueprint ID is passed as a path parameter in the URL.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=\"response-fields\">Response fields</h3>
<ul>
<li><p><code>count</code> (int): The total count of library items.</p>
</li>
<li><p><code>next</code> (str): The URL for the next page of results, if available. If not available will value will be <code>null</code>.</p>
</li>
<li><p><code>previous</code> (str): The URL for the previous page of results, if available. If not available will value will be <code>null</code>.</p>
</li>
<li><p><code>results</code> (object): An array containing objects with the following fields:</p>
<ul>
<li><p><code>id</code> (str): The ID of the library item.</p>
</li>
<li><p><code>name</code> (str): The name of the library item.</p>
</li>
</ul>
</li>
</ul>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet - Get Manual Enrollment Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the manual enrollment profile (.mobileconfig file) for a specified Blueprint.</p>
<p>This request will return the enrollment profile even if \"Require Authentication\" is configured for the Blueprint in Manual Enrollment.</p>
<p>The enrollment profile will be returned in raw form with response headers:</p>
<ul>
<li><p><code>Content-Type</code> = <code>application/x-apple-aspen-config</code></p>
</li>
<li><p><code>Content-Disposition</code> = <code>attachment;filename=kandji-enroll.mobileconfig</code></p>
</li>
</ul>
<p>An optional query parameter <code>sso=true</code> can be used to return a URL for SSO authentication instead. If this query parameter is used for a Blueprint that does not require authentication, then the enrollment profile will be returned.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sso${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Use the <code>sso</code> query parameter, set to <code>true</code>, to return a URL instead of the manual enrollment profile. This parameter should only be used for blueprints in which \"Require Authentication\" is configured for Manual Enrollment. The returned URL must be used to authenticate via SSO to receive an enrollment profile. </p>${YELLOW} Specify as: sso=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Disposition${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Language${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdPatch operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdPatch - Update Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This requests allows updating of the name, icon, icon color, description, enrollment code, and active status on an existing blueprint.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdRemoveLibraryItemPost operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdRemoveLibraryItemPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdRemoveLibraryItemPost - Remove Library Item${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows removing a library item from a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=\"request-body\">Request Body</h3>
<ul>
<li><p><code>library_item_id</code> (string, required)</p>
</li>
<li><p><code>assignment_node_id</code> (string, required for maps)</p>
</li>
</ul>
<h3 id=\"error-responses\">Error responses</h3>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Code</strong></th>
<th><strong>Body</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>400 - Bad Request</td>
<td>Bad Request</td>
</tr>
<tr>
<td></td>
<td>\"assignment_node_id cannot be provided for Classic Blueprint\"</td>
</tr>
<tr>
<td></td>
<td>\"Must provide assignment_node_id for Assignment Map Blueprint\"</td>
</tr>
<tr>
<td></td>
<td>\"Library Item does not exist on Blueprint\"</td>
</tr>
<tr>
<td></td>
<td>\"Library Item does not exist in Assignment Node\"</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsGet operation
#
##############################################################################
print_apiV1BlueprintsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsGet - List Blueprints${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of a blueprint records in the Kandji tenant. Optional query parameters can be specified to filter the results.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Look up a specific Blueprint by its ID</p>${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id__in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify a list of Blueprint IDs to limit the results to.  Multiple values may be separated by commas. There is a double underscore (<code>__</code>) between id and in</p>${YELLOW} Specify as: id__in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return Blueprint names \"containing\" the specified search string.</p>${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Number of results to return per page.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>The initial index from which to return the results.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsPost operation
#
##############################################################################
print_apiV1BlueprintsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsPost - Create Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request creates a new empty Blueprint or a new Blueprint from a template. The keys <code>name</code> and <code>enrollment_code</code> <code>is_active</code> are required, and the blueprint name key must be unique from the existing blueprint names in the Kandji tenant.</p>
<p>optionally, <code>type: map</code> can be used when creating a new Assignment Map blueprint.</p>
<p>Note: If cloning an existing blueprint,'type' value and the type of sourced ('source.id') blueprint must match and 'source.type' value must be set to 'blueprint'.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1BlueprintsTemplatesGet operation
#
##############################################################################
print_apiV1BlueprintsTemplatesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsTemplatesGet - Get Blueprint Templates${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Number of results to return per page.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>The initial index from which to return the results.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionBlankpushPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionBlankpushPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionBlankpushPost - Send Blankpush${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to initiate a blank push.</p>
<p><a href=\"https://support.kandji.io/what-is-a-blank-push\">Using the Blank Push command</a></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionClearpasscodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionClearpasscodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionClearpasscodePost - Clear Passcode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to clear a device passcode. Available for iPhone and iPad.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionDeleteuserPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionDeleteuserPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionDeleteuserPost - Delete User${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to delete a local user account on macOS and Shared iPad (Device Supervision via Automated Device Enrollment is required).</p>
<p><strong>Request Body Parameters</strong>: application/json</p>
<hr />
<p><code>DeleteAllUsers</code> - <code>boolean</code></p>
<p><code>ForceDeletion</code> - <code>boolean</code></p>
<p><code>UserName</code> - <code>string</code></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionDisablelostmodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionDisablelostmodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionDisablelostmodePost - Disable Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This command will send a request to turn off lost mode on iOS and iPadOS.</p>
<p>If the command is already pending, the message \"<em>Disable lost mode is already pending for this device.</em>\" will be in the response.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionEnablelostmodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionEnablelostmodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionEnablelostmodePost - Enable Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely turn on lost mode on iOS and iPadOS.</p>
<p>Optionally, a JSON payload can be sent in the request to set a lock message, phone number, and footnote on the target device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionErasePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionErasePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionErasePost - Erase Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to erase the device.</p>
<p>iOS 4.0+, iPadOS 4.0+, macOS 10.7+, tvOS 10.2+</p>
<p><strong>Request Body Parameters: application/json</strong></p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th>Key</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>PIN</code></td>
<td><code>string</code></td>
<td>The six-character PIN for Find My. This value is available in macOS 10.8 and later.</td>
</tr>
<tr>
<td><code>PreserveDataPlan</code></td>
<td><code>boolean</code></td>
<td>If true, preserve the data plan on an iPhone or iPad with eSIM functionality, if one exists. This value is available in iOS 11 and later.  <br />  <br />Default: true</td>
</tr>
<tr>
<td><code>DisallowProximitySetup</code></td>
<td><code>boolean</code></td>
<td>If true, disable Proximity Setup on the next reboot and skip the pane in Setup Assistant. This value is available in iOS 11 and later. Prior to iOS 14, don’t use this option with any other option.  <br />  <br />Default: false</td>
</tr>
<tr>
<td><code>ReturnToService</code></td>
<td><code>object</code></td>
<td>(iOS 17 and later and iPadOS 17 and later and with Shared iPad ) When sending the erase device command to mobile devices, use this key to enable Return to Service. Include an optional Wi-Fi payload ProfileId to allow the device to connect to a Wi-Fi network automatically after being erased. If a Wi-Fi ProfileId is not provided and the mobile device is not tethered to a Mac to share the network connection, the end-user will be required to select a Wi-Fi network to complete the setup.  <br />  <br />If sent to any macOS computer or to mobile devices on iOS 16 or iPadOS 16 and below, the RTS keys will be ignored, and only the erase device command will be issued to the device.</td>
</tr>
<tr>
<td>- <code>Enabled</code></td>
<td><code>boolean</code></td>
<td>(Required) If true, the device tries to re-enroll itself automatically after erasure. The user needs to deactivate all activation locks for this feature to work correctly.</td>
</tr>
<tr>
<td>- <code>ProfileId</code></td>
<td><code>string</code></td>
<td>Profile ID value associated with a Wi-Fi profile payload. This is required when the device doesn’t have ethernet access.</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionLockPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionLockPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionLockPost - Lock Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely lock a device.</p>
<p>For macOS clients, an unlock PIN will be created, and returned in the response.</p>
<blockquote>
<p><strong>Caution !!!</strong><br /><em>For a Mac with Apple silicon running a version of macOS before 11.5 will deactivate the Mac. To reactivate, the Mac requires a network connection and authentication by a Secure Token enabled local administrator.</em></p>
</blockquote>
<p>Optionally, a JSON payload can be sent in the request to set a lock message and phone number on the target device.</p>
<p><strong>Note:</strong> For macOS, although the lock message is displayed on all types of Mac computers, the phone number is displayed only on a Mac with Apple silicon.</p>
<h4 id=\"response-properties\">Response properties</h4>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th>Property</th>
<th>Description</th>
<th>Type</th>
</tr>
</thead>
<tbody>
<tr>
<td>PIN</td>
<td>Six digit pin code used to unlock a Mac.</td>
<td>String</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionPlaylostmodesoundPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionPlaylostmodesoundPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionPlaylostmodesoundPost - Play Lost Mode Sound${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This command will tell the target iOS or iPadOS device to play the lost mode sound.</p>
<p><strong>Note</strong>: The Lost Mode sound will play for 2 minutes, even if the device is in silent mode. Anyone finding the device can silence the sound by pressing any of its side buttons.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionReinstallagentPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionReinstallagentPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionReinstallagentPost - Reinstall Agent${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command reinstall the Kandji Agent. Available for macOS devices.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRemotedesktopPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRemotedesktopPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRemotedesktopPost - Remote Desktop${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to control the Remote Management status on a Mac. This MDM command turns on (or turns off) Remote Management with <em>Observe</em> and <em>Control</em> permissions given to all users*.*</p>
<p><strong>Request Body Parameters</strong>: application/json</p>
<hr />
<p><code>EnableRemoteDesktop</code> - <code>boolean</code></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRenewmdmprofilePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRenewmdmprofilePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRenewmdmprofilePost - Renew MDM Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to re-install the existing root MDM profile for a given device ID. This command will not impact any existing configurations, apps, or profiles.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRestartPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRestartPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRestartPost - Restart Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely restart a device.</p>
<ul>
<li><p><code>RebuildKernelCache</code> - If <code>true</code>, the system rebuilds the kernel cache during a device restart. If <code>BootstrapTokenAllowedForAuthentication</code> is <code>true</code> inSecurityInfoResponse.SecurityInfo, the device requests the bootstrap token from MDM before executing this command. This value is available in macOS 11 and later. Default: false</p>
</li>
<li><p><code>NotifyUser</code> - If <code>true</code>, notifies the user to restart the device at their convenience. Forced restart if the device is at <code>loginwindow</code> with no logged-in users. The user can dismiss the notification and ignore the request. No further notifications display unless you resend the command. This value is available in macOS 11.3 and later. Default: false</p>
</li>
</ul>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionSetnamePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionSetnamePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionSetnamePost - Set Name${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to set the device name.</p>
<p><strong>Request Body Parameters</strong>: application/json</p>
<hr />
<p><code>DeviceName</code> - <code>string</code></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionShutdownPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionShutdownPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionShutdownPost - Shutdown${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to shutdown a device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUnlockaccountPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUnlockaccountPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUnlockaccountPost - Unlock Account${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to unlock a user account that locked by the system because of too many failed password attempts. Available for macOS.</p>
<p><strong>Request Body Parameters</strong>: application/json</p>
<hr />
<p><code>UserName</code> - <code>string</code></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUpdateinventoryPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUpdateinventoryPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUpdateinventoryPost - Update Inventory${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to start a check-in for a device, initiating the daily MDM commands and MDM logic.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUpdatelocationPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUpdatelocationPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUpdatelocationPost - Update Location${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to update the location data on iOS and iPadOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActivityGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdActivityGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActivityGet - Get Device Activity${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device activity for a specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdAppsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdAppsGet - Get Device Apps${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of all installed apps for a specified Device ID.</p>
<p>For iPhone and iPad, the preinstalled Apple apps are not reported.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Count${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Pages${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Link${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdCommandsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdCommandsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdCommandsGet - Get Device Commands${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends a request to get information about the commands sent to a given device ID.</p>
<h3 id=\"mdm-status-codes\">MDM Status Codes</h3>
<ul>
<li>1 : Command is Pending</li>
<li>2 : Command is running</li>
<li>3 : Command completed</li>
<li>4 : Command failed</li>
<li>5 : Command received \"Not Now\" response</li>
</ul>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDelete - Delete Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to delete a device. This will remove the device record from Kandji and send a Remove Management command. For macOS devices, it will also send an uninstall command to the Kandji Agent at the next agent checkin.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsGet - Get Device Details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device details for a specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsLostmodeDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsLostmodeDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsLostmodeDelete - Cancel Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint can be used to send a cancelation request if Lost Mode is in an error state for a given iOS or iPadOS device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsLostmodeGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsLostmodeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsLostmodeGet - Get Device Lost Mode details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device lost mode details for a specified Device ID.</p>
<p><strong>Note</strong>: Lost Mode is is only available for iOS and iPadOS. For more information, please see this <a href=\"https://support.kandji.io/a/solutions/articles/72000573873\">Kandji support artilcle</a>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdGet - Get Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the high-level information for a specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdLibraryItemsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdLibraryItemsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdLibraryItemsGet - Get Device Library Items${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request gets all library items and their statuses for a specified Device ID</p>
<h4 id=\"possible-library-item-status-values\">Possible library item status values</h4>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Value</strong></th>
<th><strong>Type</strong></th>
<th><strong>Additional Info</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>AVAILABLE</td>
<td>string</td>
<td>Library item available in Self Service</td>
</tr>
<tr>
<td>CACHED</td>
<td>string</td>
<td>Library item downloaded for install but not yet installed</td>
</tr>
<tr>
<td>CHANGE_PENDING</td>
<td>string</td>
<td>Recovery Password library item has changes that have not yet been applied</td>
</tr>
<tr>
<td>DOWNLOADING</td>
<td>string</td>
<td>Library item downloading</td>
</tr>
<tr>
<td>ERROR</td>
<td>string</td>
<td>Audit failure</td>
</tr>
<tr>
<td>EXCLUDED</td>
<td>string</td>
<td>Not in scope for assignment rule</td>
</tr>
<tr>
<td>INCOMPATIBLE</td>
<td>string</td>
<td>Not compatible with device or OS version</td>
</tr>
<tr>
<td>INSTALLING</td>
<td>string</td>
<td>Library item installing</td>
</tr>
<tr>
<td>PASS</td>
<td>string</td>
<td>Device meets requirements</td>
</tr>
<tr>
<td>PENDING</td>
<td>string</td>
<td>Waiting on device, not yet installed (All library items except for config profiles)</td>
</tr>
<tr>
<td>failed</td>
<td>string</td>
<td>Configuration profile failed to install</td>
</tr>
<tr>
<td>pending</td>
<td>string</td>
<td>Waiting on device, Configuration profile not yet installed</td>
</tr>
<tr>
<td>success</td>
<td>string</td>
<td>Configuration profile installed</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesGet - Get Device Notes${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request gets all notes for the specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Count${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Pages${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Link${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdDelete - Delete Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request deletes a specified note (Note ID) for the specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdGet - Retrieve Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request retrieves a specified note (Note ID) for the specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdPatch operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdPatch - Update Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request patches a specified note (Note ID) for the specified Device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}Authorization${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: Authorization:value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}Content-Type${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: Content-Type:value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesPost - Create Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request creates a note for the specified device ID.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdParametersGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdParametersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdParametersGet - Get Device Parameters${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the parameters and their statuses for a specified Device ID</p>
<p>This endpoint is only applicable to macOS clients.</p>
<p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=\"https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations\">https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>
<p><strong>Possible parameter status values</strong></p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Value</strong></th>
<th><strong>Type</strong></th>
<th><strong>Additional Info</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>ERROR</td>
<td>string</td>
<td>Audit failure</td>
</tr>
<tr>
<td>INCOMPATIBLE</td>
<td>string</td>
<td>Not compatible with device or OS version</td>
</tr>
<tr>
<td>PASS</td>
<td>string</td>
<td>Device meets requirements</td>
</tr>
<tr>
<td>PENDING</td>
<td>string</td>
<td>Waiting on device. Not yet run.</td>
</tr>
<tr>
<td>REMEDIATED</td>
<td>string</td>
<td>Parameter remediated</td>
</tr>
<tr>
<td>WARNING</td>
<td>string</td>
<td>Muted alert</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdPatch operation
#
##############################################################################
print_apiV1DevicesDeviceIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdPatch - Update Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update device information, such as the assigned blueprint, user, Asset Tag, and Tags. It is not required to use all attributes in a given request. For example if you only want to update the assigned blueprint, you only need to pass the <code>blueprint_id</code> in the request payload.</p>
<p><strong>NOTE</strong>: With the introduction of a UUID value for user ID in the <a href=\"https://api-docs.kandji.io/#b107eb0a-b586-414f-bc4c-3d2b304cfd5f\">Users API</a>, the Device PATCH endpoint will support both the depricated user ID integer value and the new user ID UUID value when updating the user assignment for a device. The ability to update user assignment via the integer ID value will be removed starting January 2025.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>
<h3 id=\"additional-information\">Additional information</h3>
<p>User ID can be found using the <code>list users</code> API</p>
<p>A Blueprint ID can be found using the <code>list blueprints</code> API or in the URL path while on a Blueprint overview page.</p>
<p>For example, for this URL <a href=\"https://subdomain.kandji.io/blueprints/6391086e-85a1-4820-813c-f9c75025fff4\">https://subdomain.kandji.io/blueprints/6391086e-85a1-4820-813c-f9c75025fff4</a></p>
<p>The Blueprint ID would be <code>6391086e-85a1-4820-813c-f9c75025fff4</code></p>
<p>An example script that leverages this API can be found in the <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools/update-device-record\">Kandji Support GitHub</a></p>
<h4 id=\"clearing-the-device-asset-tag\">Clearing the device asset tag</h4>
<p>To clear a device asset tag, set the <code>asset_tag</code> value to <code>null</code> in the JSON payload.</p>
<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{
    \"asset_tag\": null
}

</code></pre>
<h4 id=\"clearing-the-assigned-user-attribute\">Clearing the assigned user attribute</h4>
<p>To clear the assigned user for a given device, set the <code>user</code> value to <code>null</code> in the JSON payload.</p>
<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{
    \"user\": null
}

</code></pre>
<h4 id=\"clearing-all-tags\">Clearing all tags</h4>
<p>To clear the assigned tags for a given device, set the <code>tags</code> value to an empty list <code>[]</code> in the JSON payload.</p>
<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{
    \"tags\": []
}

</code></pre>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsBypasscodeGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsBypasscodeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsBypasscodeGet - Get Activation Lock Bypass Code${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the Activation Lock Bypass code.</p>
<p>user_based_albc is the user-based Activation Lock bypass code for when Activation Lock is enabled using an personal Apple ID and Find My.</p>
<p>device_based_albc is the device-based Activation Lock bypass code for when Activation Lock is enabled by the MDM server.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsFilevaultkeyGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsFilevaultkeyGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsFilevaultkeyGet - Get FileVault Recovery Key${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the FileVault Recovery key for a macOS device.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsRecoverypasswordGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsRecoverypasswordGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsRecoverypasswordGet - Get Recovery Lock Password${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the Recovery Lock password for a Mac with an Apple Silicon processor and the legacy EFI firmware password for a Mac with an Intel processor.</p>
<p>For more details on setting and managing Recovery passwords, see this <a href=\"https://support.kandji.io/support/solutions/articles/72000560472-configure-the-recovery-password-library-item\">Kandji support article</a>.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsUnlockpinGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsUnlockpinGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsUnlockpinGet - Get Unlock Pin${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the device unlock pin for a macOS device.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdStatusGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdStatusGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdStatusGet - Get Device Status${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the full status (parameters and library items) for a specified Device ID.</p>
<p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=\"https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations\">https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>
<h4 id=\"possible-status-values\">Possible status values</h4>
<p><strong>Library items</strong></p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Value</strong></th>
<th><strong>Type</strong></th>
<th><strong>Additional Info</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>AVAILABLE</td>
<td>string</td>
<td>Library item available in Self Service</td>
</tr>
<tr>
<td>ERROR</td>
<td>string</td>
<td>Audit failure</td>
</tr>
<tr>
<td>EXCLUDED</td>
<td>string</td>
<td>Not in scope for assignment rule</td>
</tr>
<tr>
<td>INCOMPATIBLE</td>
<td>string</td>
<td>Not compatible with device or OS version</td>
</tr>
<tr>
<td>PASS</td>
<td>string</td>
<td>Device meets requirements</td>
</tr>
<tr>
<td>PENDING</td>
<td>string</td>
<td>Waiting on device, not yet installed (All library items except for config profiles)</td>
</tr>
<tr>
<td>failed</td>
<td>string</td>
<td>Configuration profile failed to install</td>
</tr>
<tr>
<td>pending</td>
<td>string</td>
<td>Waiting on device, Configuration profile not yet installed</td>
</tr>
<tr>
<td>success</td>
<td>string</td>
<td>Configuration profile installed</td>
</tr>
</tbody>
</table>
</div><p><strong>Parameters</strong></p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th><strong>Value</strong></th>
<th><strong>Type</strong></th>
<th><strong>Additional Info</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>ERROR</td>
<td>string</td>
<td>Audit failure</td>
</tr>
<tr>
<td>INCOMPATIBLE</td>
<td>string</td>
<td>Not compatible with device or OS version</td>
</tr>
<tr>
<td>PASS</td>
<td>string</td>
<td>Device meets requirements</td>
</tr>
<tr>
<td>PENDING</td>
<td>string</td>
<td>Waiting on device. Not yet run.</td>
</tr>
<tr>
<td>REMEDIATED</td>
<td>string</td>
<td>Parameter remediated</td>
</tr>
<tr>
<td>WARNING</td>
<td>string</td>
<td>Muted alert</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1DevicesGet operation
#
##############################################################################
print_apiV1DevicesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesGet - List Devices${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices in a Kandji tenant. Optionally. query parameters can be used to filter results.</p>
<p>There is a hard upper limit of 300 results per request. To return addtional results pagination must be used. Pagination examples can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools/code-examples\">GitHub</a>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}asset_tag${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: asset_tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results \"containing\" the specified blueprint id</p>${YELLOW} Specify as: blueprint_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filevault_enabled${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Query for devices that either have FileVault on (true) or off (false). This parameter only applies to macOS. </p>
<p>An empty list <code>[]</code> will be returned if no devices are found with the given parameter value.</p>${YELLOW} Specify as: filevault_enabled=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mac_address${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a specific device by MAC address </p>${YELLOW} Specify as: mac_address=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}model${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return model results \"containing\" the specified model string.</p>${YELLOW} Specify as: model=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}ordering${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>The <code>ordering</code> parameter can be used to define how the device records are ordered in the response. Prepending a dash (-) to the parameter value will reverse the order of the returned results.</p>
<p><code>?ordering=-serial_number</code> will order the response by serial_number in descending order.</p>
<p><strong>Possible values</strong></p>
<ul>
<li><code>asset_tag</code></li>
<li><code>blueprint_id</code></li>
<li><code>device_id</code></li>
<li><code>device_name</code></li>
<li><code>last_check_in</code> - agent checkin</li>
<li><code>model</code></li>
<li><code>platform</code></li>
<li><code>os_version</code></li>
<li><code>serial_number</code></li>
<li><code>user</code></li>
</ul>
<p>Additionally, multiple values can be combined in a comma separated list to further customize the ordering of the response.</p>
<p><code>?ordering=serial_number,platform</code></p>${YELLOW} Specify as: ordering=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}os_version${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return all device records with the specified OS version</p>${YELLOW} Specify as: os_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}platform${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return all records matching a specific platform. Possible values:<code>Mac</code>, <code>iPad</code>, <code>iPhone</code>, <code>AppleTV</code></p>${YELLOW} Specify as: platform=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}serial_number${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.</p>${YELLOW} Specify as: serial_number=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results for given tag name. Case sensitive.</p>${YELLOW} Specify as: tag_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_name_in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results for given tag names separate by commas. Case sensitive.</p>${YELLOW} Specify as: tag_name_in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a tag by its ID. Case sensitive.</p>${YELLOW} Specify as: tag_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_id_in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results for given tag IDs separated by commas. Case sensitive.</p>${YELLOW} Specify as: tag_id_in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results \"containing\" the user name</p>${YELLOW} Specify as: user=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results \"containing\" search on email address</p>${YELLOW} Specify as: user_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>\"exact\" match on kandji user ID number</p>${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results \"containing\" the assigned user Display Name</p>${YELLOW} Specify as: user_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdDelete operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdDelete - Delete ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=\"warning\"><strong>WARNING!</strong></h1>
<p>This is a HIGHLY destructive action.</p>
<p>Deleting an ADE token will unassign the associated device records from Kandji. For currently enrolled devices that were assigned to Kandji via the delete ADE integration will not be impacted until they are wiped and reprovisioned. This action is essentially the same as removing an ADE token from MDM and then adding it back.</p>
<p>If applicable, be sure to reassign the device records in ABM.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet - List devices associated to ADE token${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices associated with a specified <code>ade_token_id</code> as well as their enrollment status.</p>
<p>When the <code>mdm_device</code> key value is <code>null</code>, this can be taken as an indication that the device is awaiting enrollment into Kandji.</p>
<p>When data is present within the mdm_device dictionary, you can reference the <code>device_id</code> as the ID of the enrolled device record.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Use the <code>page</code> parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the <code>next</code> and <code>previous</code> key attributes in the response can be used to request the next page of results or return to the previous page.</p>${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdGet - Get ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a specific ADE integration based on the <code>ade_token_id</code> passed.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdPatch operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdPatch - Update ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will update the default blueprint, phone number, and email address in an existing ADE integration.</p>
<p>The default <code>blueprint_id</code>, <code>phone</code> number, and <code>email</code> address must be sent in the request.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdRenewPost operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdRenewPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdRenewPost - Renew ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will renew an existing ADE integration.</p>
<p>The default <code>blueprint_id</code>, <code>phone</code> number, <code>email</code> address, and MDM server token <code>file</code> from the associated MDM server in ABM are required and must be sent in the request.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesDeviceIdGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesDeviceIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesDeviceIdGet - Get ADE device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get information about a specific Automated Device Enrollment device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesDeviceIdPatch operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesDeviceIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesDeviceIdPatch - Update ADE device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update a specific Automated Device Enrollment device's blueprint assignment, user assignment, and asset tag.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesGet - List ADE devices${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get a list of Automated Device Enrollment devices.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return results \"containing\" the specified blueprint id</p>${YELLOW} Specify as: blueprint_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>\"exact\" match on kandji user ID number</p>${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}dep_account${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>The ADE token UUID</p>${YELLOW} Specify as: dep_account=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_family${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Mac, iPhone, iPad, AppleTV, iPod</p>${YELLOW} Specify as: device_family=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}model${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return model results \"containing\" the specified model string. - \"iPad (8th Generation)\", \"MacBook Air\"</p>${YELLOW} Specify as: model=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}os${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>OSX, iOS, tvOS</p>${YELLOW} Specify as: os=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}profile_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>The automated device enrollment profile assignment status - assigned, empty, pushed, removed</p>${YELLOW} Specify as: profile_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}serial_number${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.</p>${YELLOW} Specify as: serial_number=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Use the <code>page</code> parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the <code>next</code> and <code>previous</code> key attributes in the response can be used to request the next page of results or return to the previous page.</p>${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeGet - List ADE integrations${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of configured ADE integrations.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdePost operation
#
##############################################################################
print_apiV1IntegrationsAppleAdePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdePost - Create ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will create a new ADE integration.</p>
<p>The default <code>blueprint_id</code>, <code>phone</code> number, <code>email</code> address, and MDM server token <code>file</code> downloaded from ABM are required and must be sent in the request.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdePublicKeyGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdePublicKeyGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdePublicKeyGet - Download ADE public key${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the public key used to create an MDM server connection in Apple Business Manager.</p>
<p>The encoded information needs to be saved to a file with the <code>.pem</code> format and then uploaded to ABM.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsGet operation
#
##############################################################################
print_apiV1LibraryCustomAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsGet - List Custom Apps${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom apps from the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Optional page number. Used when results exceed pagination threshold. A hard upper <code>limit</code> is set at 300 device records returned per request.</p>${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdDelete - Delete Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom app from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdGet - Get Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom app from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdPatch - Update Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom app in the Kandji library.</p>
<p>Must have already generated a <code>file_key</code> via <code>Create custom app</code> endpoint and uploaded the file to S3 using a request similar to the <code>Upload to S3</code> example.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsPost operation
#
##############################################################################
print_apiV1LibraryCustomAppsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsPost - Create Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom app in the Kandji library.</p>
<p>Must have already generated a <code>file_key</code> via <code>Create custom app</code> endpoint and uploaded the file to S3 using a request similar to the <code>Upload to S3</code> example.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsUploadPost operation
#
##############################################################################
print_apiV1LibraryCustomAppsUploadPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsUploadPost - Upload Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request retrieves the S3 upload details need for uploading the app to Amazon S3.</p>
<p>Creates a pre-signed <code>post_url</code> to upload a new Custom App to S3.</p>
<p>The provided <code>name</code> will be used to calculate a unique <code>file_key</code> in S3.</p>
<p>A separate request will have to be made to the <code>Upload to S3</code> endpoint to upload the file to S3 directly using the <code>post_url</code> and <code>post_data</code> from the <code>Upload Custom App</code> response.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesGet operation
#
##############################################################################
print_apiV1LibraryCustomProfilesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesGet - List Custom Profiles${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom profiles from the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Optional page number (when results exceed pagination threshold)</p>${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdDelete - Delete Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom profile from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdGet - Get Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom profile from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdPatch - Update Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom profile in the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_mac${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_mac=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_iphone${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_iphone=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_ipad${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_ipad=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_tv${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_tv=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesPost operation
#
##############################################################################
print_apiV1LibraryCustomProfilesPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesPost - Create Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom profile in the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}runs_on_mac${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_mac=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_iphone${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_iphone=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_ipad${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_ipad=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}runs_on_tv${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: runs_on_tv=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsGet operation
#
##############################################################################
print_apiV1LibraryCustomScriptsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsGet - List Custom Scripts${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom scripts from the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Optional page number (when results exceed pagination threshold)</p>${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdDelete - Delete Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom scripts from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdGet - Get Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom script from the Kandji library.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdPatch - Update Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom script in the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsPost operation
#
##############################################################################
print_apiV1LibraryCustomScriptsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsPost - Create Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom script in the Kandji library.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryLibraryItemsLibraryItemIdActivityGet operation
#
##############################################################################
print_apiV1LibraryLibraryItemsLibraryItemIdActivityGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryLibraryItemsLibraryItemIdActivityGet - Get Library Item Activity${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the activity related to a specific library item. Activity is listed from newest to oldest.</p>
<p>To see a delta of the activity events between now and the last request, you can store the newest entry from the previous request and then look for that entry in the next request. Any entry post that will be the delta.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}activity_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter actions by this activity type. Choices are: library_item_created, library_item_edited, library_item_deleted, library_item_duplicated, library_item_assignment_changed</p>${YELLOW} Specify as: activity_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter actions by this user (id)</p>${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter actions by this user (email)</p>${YELLOW} Specify as: user_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1LibraryLibraryItemsLibraryItemIdStatusGet operation
#
##############################################################################
print_apiV1LibraryLibraryItemsLibraryItemIdStatusGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryLibraryItemsLibraryItemIdStatusGet - Get Library Item Statuses${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the statuses related to a specific library item.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}computer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Query for the status of one device.</p>${YELLOW} Specify as: computer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismActivationLockGet operation
#
##############################################################################
print_apiV1PrismActivationLockGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismActivationLockGet - Activation lock${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get activation lock attributes for devices.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismApplicationFirewallGet operation
#
##############################################################################
print_apiV1PrismApplicationFirewallGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismApplicationFirewallGet - Application firewall${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Application Firewall details for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismAppsGet operation
#
##############################################################################
print_apiV1PrismAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismAppsGet - Applications${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get the applications installed on macOS, iOS, iPadOS, and tvOS devices.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismCertificatesGet operation
#
##############################################################################
print_apiV1PrismCertificatesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismCertificatesGet - Certificates${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get certificate details.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismCountGet operation
#
##############################################################################
print_apiV1PrismCountGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismCountGet - Count${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get the total record count for the specified Prism category.</p>
<p>If a category contains spaces substitute the spaces for underscores (\"_\") when using the API query.</p>
<p>Example: <code>Device information</code> becomes <code>device_information</code>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>Return the count of records for the specified category. 
If a category contains spaces substitute the spaces for underscores (\"_\") when using the API query.</p>
<p>Examples:
apps
device_information
kernel_extensions
system_extensions</p>${YELLOW} Specify as: category=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismDesktopAndScreensaverGet operation
#
##############################################################################
print_apiV1PrismDesktopAndScreensaverGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismDesktopAndScreensaverGet - Desktop and Screensaver${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Desktop and Screensaver details for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismDeviceInformationGet operation
#
##############################################################################
print_apiV1PrismDeviceInformationGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismDeviceInformationGet - Device information${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get attributes about devices.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.</p>
<p>Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismExportExportIdGet operation
#
##############################################################################
print_apiV1PrismExportExportIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismExportExportIdGet - Get category export${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get an export request's status. To download the export, use the <code>signed_url</code>. This will download a CSV file containing the exported category information.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p>export_id (path parameter): The unique identifier of the the export job.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}export_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: export_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismExportPost operation
#
##############################################################################
print_apiV1PrismExportPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismExportPost - Request category export${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Request export of a category. The <code>id</code> key is used when checking the export status using the <em>Request category export</em> endpoint.</p>
<p><strong>Request Body Parameters: application/json</strong></p>
<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>
<thead>
<tr>
<th>Key</th>
<th>Type</th>
<th>Possible value(s)</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>blueprint_ids</code></td>
<td><code>array</code></td>
<td><code>[\"string\", \"string\", \"string\"]</code></td>
<td>List of one or more comma separate blueprint IDs.</td>
</tr>
<tr>
<td><code>category</code></td>
<td><code>string</code></td>
<td><code>apps</code> ,  <br /><code>activation_lock</code> ,  <br /><code>desktop_and_screensaver</code> ,  <br /><code>device_information</code> ,  <br /><code>gatekeeper_and_xprotect</code> ,  <br /><code>installed_profiles</code> ,  <br /><code>kernel_extensions</code> ,  <br /><code>local_users</code> ,  <br /><code>launch_agents_and_daemons</code> ,  <br /><code>system_extensions</code> ,  <br /><code>startup_settings</code> ,  <br /><code>transparency_database</code></td>
<td>Only one category per export reqest.</td>
</tr>
<tr>
<td><code>device_families</code></td>
<td><code>array</code></td>
<td><code>[\"Mac\", \"iPhone\", \"iPad\", \"tvOS\"]</code></td>
<td>List of one or more comma separted string values for device families.</td>
</tr>
<tr>
<td><code>filter</code></td>
<td><code>object</code></td>
<td><code>{\"apple_silicon\": {\"eq\": true}, \"device__name\": {\"like\": [\"this\", \"or_this\"]}}</code></td>
<td>JSON schema object containing one or more key value pairs.  <br />  <br /><strong>Note</strong>: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</td>
</tr>
<tr>
<td><code>sort_by</code></td>
<td><code>string</code></td>
<td></td>
<td>Sort results by the name of a given response body key in either ascending (default behavior) or descending('-') order.</td>
</tr>
</tbody>
</table>
</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismFilevaultGet operation
#
##############################################################################
print_apiV1PrismFilevaultGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismFilevaultGet - FileVault${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get FileVault information for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismGatekeeperAndXprotectGet operation
#
##############################################################################
print_apiV1PrismGatekeeperAndXprotectGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismGatekeeperAndXprotectGet - Gatekeeper and XProtect${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Gatekeeper and XProtect attributes for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Results are limited to Mac only as Gatekeeper and XProtect are not applicable for other platfroms.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismInstalledProfilesGet operation
#
##############################################################################
print_apiV1PrismInstalledProfilesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismInstalledProfilesGet - Installed profiles${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Installed Profiles attributes for macOS, iOS, iPadOS, and tvOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismKernelExtensionsGet operation
#
##############################################################################
print_apiV1PrismKernelExtensionsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismKernelExtensionsGet - Kernel Extensions${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Kernel Extension attributes for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>SON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismLaunchAgentsAndDaemonsGet operation
#
##############################################################################
print_apiV1PrismLaunchAgentsAndDaemonsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismLaunchAgentsAndDaemonsGet - Launch Agents and Daemons${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Launch Agents and Daemons installed on macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismLocalUsersGet operation
#
##############################################################################
print_apiV1PrismLocalUsersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismLocalUsersGet - Local users${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Local Users detials for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismStartupSettingsGet operation
#
##############################################################################
print_apiV1PrismStartupSettingsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismStartupSettingsGet - Startup settings${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Startup settings for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismSystemExtensionsGet operation
#
##############################################################################
print_apiV1PrismSystemExtensionsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismSystemExtensionsGet - System Extensions${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get System Extension attributes for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1PrismTransparencyDatabaseGet operation
#
##############################################################################
print_apiV1PrismTransparencyDatabaseGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismTransparencyDatabaseGet - Transparency database${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Transparency Database (TCC) attributes for macOS.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more blueprint IDs separated by commas.</p>${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Filter results by one or more device families separate by commas.</p>${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return.</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1SelfServiceCategoriesGet operation
#
##############################################################################
print_apiV1SelfServiceCategoriesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1SelfServiceCategoriesGet - List Self Service Categories${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves a list of self-service categories and their associated IDs.</p>
<p>If you are planning to make a Library item available in Self Service under a specific category, you can call this endpoint to get the category ID and then use that ID when creating or updating the library item via the Kandji API.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1SettingsLicensingGet operation
#
##############################################################################
print_apiV1SettingsLicensingGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1SettingsLicensingGet - Licensing${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Returns Kandji tenant licensing and utilization information.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1TagsGet operation
#
##############################################################################
print_apiV1TagsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsGet - Get Tags${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Return configured tags.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}search${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>Return resultes containing a given tag search string.</p>${YELLOW} Specify as: search=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1TagsPost operation
#
##############################################################################
print_apiV1TagsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsPost - Create Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Create a tag. Can only create one tag per request.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1TagsTagIdDelete operation
#
##############################################################################
print_apiV1TagsTagIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsTagIdDelete - Delete Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Delete a tag.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: tag_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1TagsTagIdPatch operation
#
##############################################################################
print_apiV1TagsTagIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsTagIdPatch - Update Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update tag name.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: tag_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1ThreatDetailsGet operation
#
##############################################################################
print_apiV1ThreatDetailsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1ThreatDetailsGet - Get Threat Details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get threat details.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}classification${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return all records matching a specified classification. The following classification options are available: <code>malware</code> and <code>pup</code>. Leave this parameter empty to return all classification types.</p>${YELLOW} Specify as: classification=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_range${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return all records within a specified number of days. Any positive number of days may be specified. Examples: <code>7</code>, <code>30</code>, <code>60</code>, <code>90</code>, <code>180</code>, or <code>365</code>.</p>${YELLOW} Specify as: date_range=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return all records matching a specified status. The following status options are available: <code>quarantined</code>, <code>not_quarantined</code>, or <code>released</code>. Leave this parameter empty to return all status types.</p>${YELLOW} Specify as: status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Results can be sorted with the following options: </p>
<ul>
<li>threat_name</li>
<li>classification</li>
<li>device_name</li>
<li>process_name</li>
<li>process_owner</li>
<li>detection_date</li>
<li>status</li>
</ul>
<p>Prepending a dash (-) to the parameter value will reverse the order of the returned results.</p>
<p><code>?sort_by=-device_name</code> will order the response by device_name in descending order.</p>${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}term${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search term to filter threat results.</p>
<p>The response will include anything matching the following fields: <code>device_name</code>, <code>file_hash</code>, and <code>file_path</code>.</p>
<p>So if you search for <code>bad file</code>, the results will include anywhere <code>bad file</code> exists in the three fields above.</p>${YELLOW} Specify as: term=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>A hard upper <code>limit</code> is set at 1000 records returned per request. If more records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. </p>
<p>Additionally, parameter queries can be added to a request to limit the results.</p>${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Specify the starting record to return</p>${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1UsersGet operation
#
##############################################################################
print_apiV1UsersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1UsersGet - List Users${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of users from user directory integrations.</p>
<p>A maximum of 300 records are returned per request, and pagination can be performed leveraging the URLs provided in the <code>next</code> and <code>previous</code> keys in the response. If there are no more results available, the respective key will be <code>null</code>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Returns users with email addresses containing the provided string.</p>${YELLOW} Specify as: email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a user matching the provided UUID value.</p>${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}integration_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Search for a integration matching the provided UUID value.</p>${YELLOW} Specify as: integration_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}archived${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Return only users that are either archived (true) or not archived (false). Archived users are users that appear in the Kandji Users module under the Archived tab. </p>${YELLOW} Specify as: archived=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for apiV1UsersUserIdGet operation
#
##############################################################################
print_apiV1UsersUserIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1UsersUserIdGet - Get User${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a specified user directory integration user by id.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p>user_id (path parameter): The unique identifier of the user directory integration user.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: user_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for rootPost operation
#
##############################################################################
print_rootPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}rootPost - Upload to S3${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Example showing separate post request to upload the file to Amazon S3.</p>
<h3 id=\"request-parameters\">Request Parameters</h3>
<p><code>post_url</code> (path parameter): The <code>post_url</code> value from the <code>Upload custom app</code> response.</p>
<h3 id=\"request-body\">Request Body</h3>
<p>For the request body, use the contents of the <code>post_data</code> object in the <code>Upload Custom App</code> endpoint response (example response below) and supply the path to the custom app file in the <code>file</code> request parameter.</p>
<h4 id=\"example-post_data-object\">Example post_data object</h4>
<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">\"post_data\": {
   \"key\": \"(field to post along with file to S3 -- the key for the uploaded file)\",
   \"x-amz-algorithm\": \"(field to post along with file to S3)\",
   \"x-amz-credential\": \"(field to post along with file to S3)\",
   \"x-amz-date\": \"(field to post along with file to S3)\",
   \"x-amz-security-token\": \"(field to post along with file to S3)\",
   \"policy\": \"(field to post along with file to S3)\",
   \"x-amz-signature\": \"(field to post along with file to S3)\",
}

</code></pre>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}x-amz-id-2${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}x-amz-request-id${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}x-amz-version-id${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}x-amz-server-side-encryption${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}ETag${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Location${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}


##############################################################################
#
# Call apiV1BlueprintsBlueprintIdAssignLibraryItemPost operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdAssignLibraryItemPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}/assign-library-item" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdDelete operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdGet operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdListLibraryItemsGet operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdListLibraryItemsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}/list-library-items" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(sso  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}/ota-enrollment-profile" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdPatch operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsBlueprintIdRemoveLibraryItemPost operation
#
##############################################################################
call_apiV1BlueprintsBlueprintIdRemoveLibraryItemPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(blueprint_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/{blueprint_id}/remove-library-item" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1BlueprintsGet operation
#
##############################################################################
call_apiV1BlueprintsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(id id__in name limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsPost operation
#
##############################################################################
call_apiV1BlueprintsPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1BlueprintsTemplatesGet operation
#
##############################################################################
call_apiV1BlueprintsTemplatesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/blueprints/templates/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionBlankpushPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionBlankpushPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/blankpush" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionClearpasscodePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionClearpasscodePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/clearpasscode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionDeleteuserPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionDeleteuserPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/deleteuser" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionDisablelostmodePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionDisablelostmodePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/disablelostmode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionEnablelostmodePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionEnablelostmodePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/enablelostmode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionErasePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionErasePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/erase" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionLockPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionLockPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/lock" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionPlaylostmodesoundPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionPlaylostmodesoundPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/playlostmodesound" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionReinstallagentPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionReinstallagentPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/reinstallagent" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionRemotedesktopPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionRemotedesktopPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/remotedesktop" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionRenewmdmprofilePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionRenewmdmprofilePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/renewmdmprofile" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionRestartPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionRestartPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/restart" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionSetnamePost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionSetnamePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/setname" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionShutdownPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionShutdownPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/shutdown" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionUnlockaccountPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionUnlockaccountPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/unlockaccount" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionUpdateinventoryPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionUpdateinventoryPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/updateinventory" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActionUpdatelocationPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdActionUpdatelocationPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/action/updatelocation" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdActivityGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdActivityGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/activity" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdAppsGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdAppsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/apps" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdCommandsGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdCommandsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/commands" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdDelete operation
#
##############################################################################
call_apiV1DevicesDeviceIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdDetailsGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdDetailsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/details" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdDetailsLostmodeDelete operation
#
##############################################################################
call_apiV1DevicesDeviceIdDetailsLostmodeDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/details/lostmode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdDetailsLostmodeGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdDetailsLostmodeGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/details/lostmode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdLibraryItemsGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdLibraryItemsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/library-items" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdNotesGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdNotesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/notes" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdNotesNoteIdDelete operation
#
##############################################################################
call_apiV1DevicesDeviceIdNotesNoteIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id note_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/notes/{note_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdNotesNoteIdGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdNotesNoteIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id note_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/notes/{note_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdNotesNoteIdPatch operation
#
##############################################################################
call_apiV1DevicesDeviceIdNotesNoteIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id note_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/notes/{note_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdNotesPost operation
#
##############################################################################
call_apiV1DevicesDeviceIdNotesPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/notes" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdParametersGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdParametersGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/parameters" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdPatch operation
#
##############################################################################
call_apiV1DevicesDeviceIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdSecretsBypasscodeGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdSecretsBypasscodeGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/secrets/bypasscode" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdSecretsFilevaultkeyGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdSecretsFilevaultkeyGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/secrets/filevaultkey" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdSecretsRecoverypasswordGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdSecretsRecoverypasswordGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/secrets/recoverypassword" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdSecretsUnlockpinGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdSecretsUnlockpinGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/secrets/unlockpin" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesDeviceIdStatusGet operation
#
##############################################################################
call_apiV1DevicesDeviceIdStatusGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/status" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1DevicesGet operation
#
##############################################################################
call_apiV1DevicesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(asset_tag blueprint_id device_id device_name filevault_enabled mac_address model ordering os_version platform serial_number tag_name tag_name_in tag_id tag_id_in user user_email user_id user_name limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/devices" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeAdeTokenIdDelete operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeAdeTokenIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(ade_token_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/{ade_token_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(ade_token_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/{ade_token_id}/devices" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeAdeTokenIdGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeAdeTokenIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(ade_token_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/{ade_token_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeAdeTokenIdPatch operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeAdeTokenIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(ade_token_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/{ade_token_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeAdeTokenIdRenewPost operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeAdeTokenIdRenewPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(ade_token_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/{ade_token_id}/renew" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeDevicesDeviceIdGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeDevicesDeviceIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/devices/{device_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeDevicesDeviceIdPatch operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeDevicesDeviceIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/devices/{device_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeDevicesGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeDevicesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_id user_id dep_account device_family model os profile_status serial_number page  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/devices" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdeGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdeGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdePost operation
#
##############################################################################
call_apiV1IntegrationsAppleAdePost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1IntegrationsAppleAdePublicKeyGet operation
#
##############################################################################
call_apiV1IntegrationsAppleAdePublicKeyGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/integrations/apple/ade/public_key/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsGet operation
#
##############################################################################
call_apiV1LibraryCustomAppsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsLibraryItemIdDelete operation
#
##############################################################################
call_apiV1LibraryCustomAppsLibraryItemIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsLibraryItemIdGet operation
#
##############################################################################
call_apiV1LibraryCustomAppsLibraryItemIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsLibraryItemIdPatch operation
#
##############################################################################
call_apiV1LibraryCustomAppsLibraryItemIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsPost operation
#
##############################################################################
call_apiV1LibraryCustomAppsPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomAppsUploadPost operation
#
##############################################################################
call_apiV1LibraryCustomAppsUploadPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-apps/upload" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomProfilesGet operation
#
##############################################################################
call_apiV1LibraryCustomProfilesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-profiles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomProfilesLibraryItemIdDelete operation
#
##############################################################################
call_apiV1LibraryCustomProfilesLibraryItemIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-profiles/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomProfilesLibraryItemIdGet operation
#
##############################################################################
call_apiV1LibraryCustomProfilesLibraryItemIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-profiles/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomProfilesLibraryItemIdPatch operation
#
##############################################################################
call_apiV1LibraryCustomProfilesLibraryItemIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(runs_on_mac runs_on_iphone runs_on_ipad runs_on_tv  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-profiles/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomProfilesPost operation
#
##############################################################################
call_apiV1LibraryCustomProfilesPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(runs_on_mac runs_on_iphone runs_on_ipad runs_on_tv  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-profiles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomScriptsGet operation
#
##############################################################################
call_apiV1LibraryCustomScriptsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-scripts" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomScriptsLibraryItemIdDelete operation
#
##############################################################################
call_apiV1LibraryCustomScriptsLibraryItemIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-scripts/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomScriptsLibraryItemIdGet operation
#
##############################################################################
call_apiV1LibraryCustomScriptsLibraryItemIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-scripts/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomScriptsLibraryItemIdPatch operation
#
##############################################################################
call_apiV1LibraryCustomScriptsLibraryItemIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-scripts/{library_item_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1LibraryCustomScriptsPost operation
#
##############################################################################
call_apiV1LibraryCustomScriptsPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/library/custom-scripts" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1LibraryLibraryItemsLibraryItemIdActivityGet operation
#
##############################################################################
call_apiV1LibraryLibraryItemsLibraryItemIdActivityGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(activity_type user_id user_email limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/library/library-items/{library_item_id}/activity" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1LibraryLibraryItemsLibraryItemIdStatusGet operation
#
##############################################################################
call_apiV1LibraryLibraryItemsLibraryItemIdStatusGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(library_item_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(computer_id limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/library/library-items/{library_item_id}/status" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismActivationLockGet operation
#
##############################################################################
call_apiV1PrismActivationLockGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/activation_lock" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismApplicationFirewallGet operation
#
##############################################################################
call_apiV1PrismApplicationFirewallGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/application_firewall" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismAppsGet operation
#
##############################################################################
call_apiV1PrismAppsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/apps" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismCertificatesGet operation
#
##############################################################################
call_apiV1PrismCertificatesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/certificates" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismCountGet operation
#
##############################################################################
call_apiV1PrismCountGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(category  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/count" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismDesktopAndScreensaverGet operation
#
##############################################################################
call_apiV1PrismDesktopAndScreensaverGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/desktop_and_screensaver" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismDeviceInformationGet operation
#
##############################################################################
call_apiV1PrismDeviceInformationGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/device_information" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1PrismExportExportIdGet operation
#
##############################################################################
call_apiV1PrismExportExportIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(export_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/export/{export_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismExportPost operation
#
##############################################################################
call_apiV1PrismExportPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/export" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1PrismFilevaultGet operation
#
##############################################################################
call_apiV1PrismFilevaultGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/filevault" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismGatekeeperAndXprotectGet operation
#
##############################################################################
call_apiV1PrismGatekeeperAndXprotectGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/gatekeeper_and_xprotect" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismInstalledProfilesGet operation
#
##############################################################################
call_apiV1PrismInstalledProfilesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/installed_profiles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismKernelExtensionsGet operation
#
##############################################################################
call_apiV1PrismKernelExtensionsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/kernel_extensions" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismLaunchAgentsAndDaemonsGet operation
#
##############################################################################
call_apiV1PrismLaunchAgentsAndDaemonsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/launch_agents_and_daemons" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismLocalUsersGet operation
#
##############################################################################
call_apiV1PrismLocalUsersGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/local_users" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismStartupSettingsGet operation
#
##############################################################################
call_apiV1PrismStartupSettingsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/startup_settings" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismSystemExtensionsGet operation
#
##############################################################################
call_apiV1PrismSystemExtensionsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/system_extensions" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1PrismTransparencyDatabaseGet operation
#
##############################################################################
call_apiV1PrismTransparencyDatabaseGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(blueprint_ids device_families filter sort_by limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/prism/transparency_database" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1SelfServiceCategoriesGet operation
#
##############################################################################
call_apiV1SelfServiceCategoriesGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/self-service/categories" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1SettingsLicensingGet operation
#
##############################################################################
call_apiV1SettingsLicensingGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/settings/licensing" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1TagsGet operation
#
##############################################################################
call_apiV1TagsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(search  )
    local path

    if ! path=$(build_request_path "/api/v1/tags" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1TagsPost operation
#
##############################################################################
call_apiV1TagsPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/tags" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1TagsTagIdDelete operation
#
##############################################################################
call_apiV1TagsTagIdDelete() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tag_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/tags/{tag_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1TagsTagIdPatch operation
#
##############################################################################
call_apiV1TagsTagIdPatch() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(tag_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/tags/{tag_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambiguously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call apiV1ThreatDetailsGet operation
#
##############################################################################
call_apiV1ThreatDetailsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(classification date_range device_id status sort_by term limit offset  )
    local path

    if ! path=$(build_request_path "/api/v1/threat-details" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1UsersGet operation
#
##############################################################################
call_apiV1UsersGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(email id integration_id archived  )
    local path

    if ! path=$(build_request_path "/api/v1/users" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1UsersUserIdGet operation
#
##############################################################################
call_apiV1UsersUserIdGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(user_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/v1/users/{user_id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call rootPost operation
#
##############################################################################
call_rootPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    body_form_urlencoded=$(body_parameters_to_form_urlencoded)
    if [[ "$print_curl" = true ]]; then
        echo "curl ${body_form_urlencoded} ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${body_form_urlencoded} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    apiV1BlueprintsBlueprintIdAssignLibraryItemPost)
    operation="apiV1BlueprintsBlueprintIdAssignLibraryItemPost"
    ;;
    apiV1BlueprintsBlueprintIdDelete)
    operation="apiV1BlueprintsBlueprintIdDelete"
    ;;
    apiV1BlueprintsBlueprintIdGet)
    operation="apiV1BlueprintsBlueprintIdGet"
    ;;
    apiV1BlueprintsBlueprintIdListLibraryItemsGet)
    operation="apiV1BlueprintsBlueprintIdListLibraryItemsGet"
    ;;
    apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet)
    operation="apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet"
    ;;
    apiV1BlueprintsBlueprintIdPatch)
    operation="apiV1BlueprintsBlueprintIdPatch"
    ;;
    apiV1BlueprintsBlueprintIdRemoveLibraryItemPost)
    operation="apiV1BlueprintsBlueprintIdRemoveLibraryItemPost"
    ;;
    apiV1BlueprintsGet)
    operation="apiV1BlueprintsGet"
    ;;
    apiV1BlueprintsPost)
    operation="apiV1BlueprintsPost"
    ;;
    apiV1BlueprintsTemplatesGet)
    operation="apiV1BlueprintsTemplatesGet"
    ;;
    apiV1DevicesDeviceIdActionBlankpushPost)
    operation="apiV1DevicesDeviceIdActionBlankpushPost"
    ;;
    apiV1DevicesDeviceIdActionClearpasscodePost)
    operation="apiV1DevicesDeviceIdActionClearpasscodePost"
    ;;
    apiV1DevicesDeviceIdActionDeleteuserPost)
    operation="apiV1DevicesDeviceIdActionDeleteuserPost"
    ;;
    apiV1DevicesDeviceIdActionDisablelostmodePost)
    operation="apiV1DevicesDeviceIdActionDisablelostmodePost"
    ;;
    apiV1DevicesDeviceIdActionEnablelostmodePost)
    operation="apiV1DevicesDeviceIdActionEnablelostmodePost"
    ;;
    apiV1DevicesDeviceIdActionErasePost)
    operation="apiV1DevicesDeviceIdActionErasePost"
    ;;
    apiV1DevicesDeviceIdActionLockPost)
    operation="apiV1DevicesDeviceIdActionLockPost"
    ;;
    apiV1DevicesDeviceIdActionPlaylostmodesoundPost)
    operation="apiV1DevicesDeviceIdActionPlaylostmodesoundPost"
    ;;
    apiV1DevicesDeviceIdActionReinstallagentPost)
    operation="apiV1DevicesDeviceIdActionReinstallagentPost"
    ;;
    apiV1DevicesDeviceIdActionRemotedesktopPost)
    operation="apiV1DevicesDeviceIdActionRemotedesktopPost"
    ;;
    apiV1DevicesDeviceIdActionRenewmdmprofilePost)
    operation="apiV1DevicesDeviceIdActionRenewmdmprofilePost"
    ;;
    apiV1DevicesDeviceIdActionRestartPost)
    operation="apiV1DevicesDeviceIdActionRestartPost"
    ;;
    apiV1DevicesDeviceIdActionSetnamePost)
    operation="apiV1DevicesDeviceIdActionSetnamePost"
    ;;
    apiV1DevicesDeviceIdActionShutdownPost)
    operation="apiV1DevicesDeviceIdActionShutdownPost"
    ;;
    apiV1DevicesDeviceIdActionUnlockaccountPost)
    operation="apiV1DevicesDeviceIdActionUnlockaccountPost"
    ;;
    apiV1DevicesDeviceIdActionUpdateinventoryPost)
    operation="apiV1DevicesDeviceIdActionUpdateinventoryPost"
    ;;
    apiV1DevicesDeviceIdActionUpdatelocationPost)
    operation="apiV1DevicesDeviceIdActionUpdatelocationPost"
    ;;
    apiV1DevicesDeviceIdActivityGet)
    operation="apiV1DevicesDeviceIdActivityGet"
    ;;
    apiV1DevicesDeviceIdAppsGet)
    operation="apiV1DevicesDeviceIdAppsGet"
    ;;
    apiV1DevicesDeviceIdCommandsGet)
    operation="apiV1DevicesDeviceIdCommandsGet"
    ;;
    apiV1DevicesDeviceIdDelete)
    operation="apiV1DevicesDeviceIdDelete"
    ;;
    apiV1DevicesDeviceIdDetailsGet)
    operation="apiV1DevicesDeviceIdDetailsGet"
    ;;
    apiV1DevicesDeviceIdDetailsLostmodeDelete)
    operation="apiV1DevicesDeviceIdDetailsLostmodeDelete"
    ;;
    apiV1DevicesDeviceIdDetailsLostmodeGet)
    operation="apiV1DevicesDeviceIdDetailsLostmodeGet"
    ;;
    apiV1DevicesDeviceIdGet)
    operation="apiV1DevicesDeviceIdGet"
    ;;
    apiV1DevicesDeviceIdLibraryItemsGet)
    operation="apiV1DevicesDeviceIdLibraryItemsGet"
    ;;
    apiV1DevicesDeviceIdNotesGet)
    operation="apiV1DevicesDeviceIdNotesGet"
    ;;
    apiV1DevicesDeviceIdNotesNoteIdDelete)
    operation="apiV1DevicesDeviceIdNotesNoteIdDelete"
    ;;
    apiV1DevicesDeviceIdNotesNoteIdGet)
    operation="apiV1DevicesDeviceIdNotesNoteIdGet"
    ;;
    apiV1DevicesDeviceIdNotesNoteIdPatch)
    operation="apiV1DevicesDeviceIdNotesNoteIdPatch"
    ;;
    apiV1DevicesDeviceIdNotesPost)
    operation="apiV1DevicesDeviceIdNotesPost"
    ;;
    apiV1DevicesDeviceIdParametersGet)
    operation="apiV1DevicesDeviceIdParametersGet"
    ;;
    apiV1DevicesDeviceIdPatch)
    operation="apiV1DevicesDeviceIdPatch"
    ;;
    apiV1DevicesDeviceIdSecretsBypasscodeGet)
    operation="apiV1DevicesDeviceIdSecretsBypasscodeGet"
    ;;
    apiV1DevicesDeviceIdSecretsFilevaultkeyGet)
    operation="apiV1DevicesDeviceIdSecretsFilevaultkeyGet"
    ;;
    apiV1DevicesDeviceIdSecretsRecoverypasswordGet)
    operation="apiV1DevicesDeviceIdSecretsRecoverypasswordGet"
    ;;
    apiV1DevicesDeviceIdSecretsUnlockpinGet)
    operation="apiV1DevicesDeviceIdSecretsUnlockpinGet"
    ;;
    apiV1DevicesDeviceIdStatusGet)
    operation="apiV1DevicesDeviceIdStatusGet"
    ;;
    apiV1DevicesGet)
    operation="apiV1DevicesGet"
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdDelete)
    operation="apiV1IntegrationsAppleAdeAdeTokenIdDelete"
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet)
    operation="apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet"
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdGet)
    operation="apiV1IntegrationsAppleAdeAdeTokenIdGet"
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdPatch)
    operation="apiV1IntegrationsAppleAdeAdeTokenIdPatch"
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdRenewPost)
    operation="apiV1IntegrationsAppleAdeAdeTokenIdRenewPost"
    ;;
    apiV1IntegrationsAppleAdeDevicesDeviceIdGet)
    operation="apiV1IntegrationsAppleAdeDevicesDeviceIdGet"
    ;;
    apiV1IntegrationsAppleAdeDevicesDeviceIdPatch)
    operation="apiV1IntegrationsAppleAdeDevicesDeviceIdPatch"
    ;;
    apiV1IntegrationsAppleAdeDevicesGet)
    operation="apiV1IntegrationsAppleAdeDevicesGet"
    ;;
    apiV1IntegrationsAppleAdeGet)
    operation="apiV1IntegrationsAppleAdeGet"
    ;;
    apiV1IntegrationsAppleAdePost)
    operation="apiV1IntegrationsAppleAdePost"
    ;;
    apiV1IntegrationsAppleAdePublicKeyGet)
    operation="apiV1IntegrationsAppleAdePublicKeyGet"
    ;;
    apiV1LibraryCustomAppsGet)
    operation="apiV1LibraryCustomAppsGet"
    ;;
    apiV1LibraryCustomAppsLibraryItemIdDelete)
    operation="apiV1LibraryCustomAppsLibraryItemIdDelete"
    ;;
    apiV1LibraryCustomAppsLibraryItemIdGet)
    operation="apiV1LibraryCustomAppsLibraryItemIdGet"
    ;;
    apiV1LibraryCustomAppsLibraryItemIdPatch)
    operation="apiV1LibraryCustomAppsLibraryItemIdPatch"
    ;;
    apiV1LibraryCustomAppsPost)
    operation="apiV1LibraryCustomAppsPost"
    ;;
    apiV1LibraryCustomAppsUploadPost)
    operation="apiV1LibraryCustomAppsUploadPost"
    ;;
    apiV1LibraryCustomProfilesGet)
    operation="apiV1LibraryCustomProfilesGet"
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdDelete)
    operation="apiV1LibraryCustomProfilesLibraryItemIdDelete"
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdGet)
    operation="apiV1LibraryCustomProfilesLibraryItemIdGet"
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdPatch)
    operation="apiV1LibraryCustomProfilesLibraryItemIdPatch"
    ;;
    apiV1LibraryCustomProfilesPost)
    operation="apiV1LibraryCustomProfilesPost"
    ;;
    apiV1LibraryCustomScriptsGet)
    operation="apiV1LibraryCustomScriptsGet"
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdDelete)
    operation="apiV1LibraryCustomScriptsLibraryItemIdDelete"
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdGet)
    operation="apiV1LibraryCustomScriptsLibraryItemIdGet"
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdPatch)
    operation="apiV1LibraryCustomScriptsLibraryItemIdPatch"
    ;;
    apiV1LibraryCustomScriptsPost)
    operation="apiV1LibraryCustomScriptsPost"
    ;;
    apiV1LibraryLibraryItemsLibraryItemIdActivityGet)
    operation="apiV1LibraryLibraryItemsLibraryItemIdActivityGet"
    ;;
    apiV1LibraryLibraryItemsLibraryItemIdStatusGet)
    operation="apiV1LibraryLibraryItemsLibraryItemIdStatusGet"
    ;;
    apiV1PrismActivationLockGet)
    operation="apiV1PrismActivationLockGet"
    ;;
    apiV1PrismApplicationFirewallGet)
    operation="apiV1PrismApplicationFirewallGet"
    ;;
    apiV1PrismAppsGet)
    operation="apiV1PrismAppsGet"
    ;;
    apiV1PrismCertificatesGet)
    operation="apiV1PrismCertificatesGet"
    ;;
    apiV1PrismCountGet)
    operation="apiV1PrismCountGet"
    ;;
    apiV1PrismDesktopAndScreensaverGet)
    operation="apiV1PrismDesktopAndScreensaverGet"
    ;;
    apiV1PrismDeviceInformationGet)
    operation="apiV1PrismDeviceInformationGet"
    ;;
    apiV1PrismExportExportIdGet)
    operation="apiV1PrismExportExportIdGet"
    ;;
    apiV1PrismExportPost)
    operation="apiV1PrismExportPost"
    ;;
    apiV1PrismFilevaultGet)
    operation="apiV1PrismFilevaultGet"
    ;;
    apiV1PrismGatekeeperAndXprotectGet)
    operation="apiV1PrismGatekeeperAndXprotectGet"
    ;;
    apiV1PrismInstalledProfilesGet)
    operation="apiV1PrismInstalledProfilesGet"
    ;;
    apiV1PrismKernelExtensionsGet)
    operation="apiV1PrismKernelExtensionsGet"
    ;;
    apiV1PrismLaunchAgentsAndDaemonsGet)
    operation="apiV1PrismLaunchAgentsAndDaemonsGet"
    ;;
    apiV1PrismLocalUsersGet)
    operation="apiV1PrismLocalUsersGet"
    ;;
    apiV1PrismStartupSettingsGet)
    operation="apiV1PrismStartupSettingsGet"
    ;;
    apiV1PrismSystemExtensionsGet)
    operation="apiV1PrismSystemExtensionsGet"
    ;;
    apiV1PrismTransparencyDatabaseGet)
    operation="apiV1PrismTransparencyDatabaseGet"
    ;;
    apiV1SelfServiceCategoriesGet)
    operation="apiV1SelfServiceCategoriesGet"
    ;;
    apiV1SettingsLicensingGet)
    operation="apiV1SettingsLicensingGet"
    ;;
    apiV1TagsGet)
    operation="apiV1TagsGet"
    ;;
    apiV1TagsPost)
    operation="apiV1TagsPost"
    ;;
    apiV1TagsTagIdDelete)
    operation="apiV1TagsTagIdDelete"
    ;;
    apiV1TagsTagIdPatch)
    operation="apiV1TagsTagIdPatch"
    ;;
    apiV1ThreatDetailsGet)
    operation="apiV1ThreatDetailsGet"
    ;;
    apiV1UsersGet)
    operation="apiV1UsersGet"
    ;;
    apiV1UsersUserIdGet)
    operation="apiV1UsersUserIdGet"
    ;;
    rootPost)
    operation="rootPost"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    --body=*)
    # Parse value of body as argument and convert it into only
    # the raw body content
    if [[ "$operation" ]]; then
        IFS='--body=' read -r body_value <<< "$key"
        body_value=${body_value##--body=}
        body_parameters["RAW_BODY"]="${body_value}"
        RAW_BODY=1
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without quotes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +([^=]):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    apiV1BlueprintsBlueprintIdAssignLibraryItemPost)
    call_apiV1BlueprintsBlueprintIdAssignLibraryItemPost
    ;;
    apiV1BlueprintsBlueprintIdDelete)
    call_apiV1BlueprintsBlueprintIdDelete
    ;;
    apiV1BlueprintsBlueprintIdGet)
    call_apiV1BlueprintsBlueprintIdGet
    ;;
    apiV1BlueprintsBlueprintIdListLibraryItemsGet)
    call_apiV1BlueprintsBlueprintIdListLibraryItemsGet
    ;;
    apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet)
    call_apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet
    ;;
    apiV1BlueprintsBlueprintIdPatch)
    call_apiV1BlueprintsBlueprintIdPatch
    ;;
    apiV1BlueprintsBlueprintIdRemoveLibraryItemPost)
    call_apiV1BlueprintsBlueprintIdRemoveLibraryItemPost
    ;;
    apiV1BlueprintsGet)
    call_apiV1BlueprintsGet
    ;;
    apiV1BlueprintsPost)
    call_apiV1BlueprintsPost
    ;;
    apiV1BlueprintsTemplatesGet)
    call_apiV1BlueprintsTemplatesGet
    ;;
    apiV1DevicesDeviceIdActionBlankpushPost)
    call_apiV1DevicesDeviceIdActionBlankpushPost
    ;;
    apiV1DevicesDeviceIdActionClearpasscodePost)
    call_apiV1DevicesDeviceIdActionClearpasscodePost
    ;;
    apiV1DevicesDeviceIdActionDeleteuserPost)
    call_apiV1DevicesDeviceIdActionDeleteuserPost
    ;;
    apiV1DevicesDeviceIdActionDisablelostmodePost)
    call_apiV1DevicesDeviceIdActionDisablelostmodePost
    ;;
    apiV1DevicesDeviceIdActionEnablelostmodePost)
    call_apiV1DevicesDeviceIdActionEnablelostmodePost
    ;;
    apiV1DevicesDeviceIdActionErasePost)
    call_apiV1DevicesDeviceIdActionErasePost
    ;;
    apiV1DevicesDeviceIdActionLockPost)
    call_apiV1DevicesDeviceIdActionLockPost
    ;;
    apiV1DevicesDeviceIdActionPlaylostmodesoundPost)
    call_apiV1DevicesDeviceIdActionPlaylostmodesoundPost
    ;;
    apiV1DevicesDeviceIdActionReinstallagentPost)
    call_apiV1DevicesDeviceIdActionReinstallagentPost
    ;;
    apiV1DevicesDeviceIdActionRemotedesktopPost)
    call_apiV1DevicesDeviceIdActionRemotedesktopPost
    ;;
    apiV1DevicesDeviceIdActionRenewmdmprofilePost)
    call_apiV1DevicesDeviceIdActionRenewmdmprofilePost
    ;;
    apiV1DevicesDeviceIdActionRestartPost)
    call_apiV1DevicesDeviceIdActionRestartPost
    ;;
    apiV1DevicesDeviceIdActionSetnamePost)
    call_apiV1DevicesDeviceIdActionSetnamePost
    ;;
    apiV1DevicesDeviceIdActionShutdownPost)
    call_apiV1DevicesDeviceIdActionShutdownPost
    ;;
    apiV1DevicesDeviceIdActionUnlockaccountPost)
    call_apiV1DevicesDeviceIdActionUnlockaccountPost
    ;;
    apiV1DevicesDeviceIdActionUpdateinventoryPost)
    call_apiV1DevicesDeviceIdActionUpdateinventoryPost
    ;;
    apiV1DevicesDeviceIdActionUpdatelocationPost)
    call_apiV1DevicesDeviceIdActionUpdatelocationPost
    ;;
    apiV1DevicesDeviceIdActivityGet)
    call_apiV1DevicesDeviceIdActivityGet
    ;;
    apiV1DevicesDeviceIdAppsGet)
    call_apiV1DevicesDeviceIdAppsGet
    ;;
    apiV1DevicesDeviceIdCommandsGet)
    call_apiV1DevicesDeviceIdCommandsGet
    ;;
    apiV1DevicesDeviceIdDelete)
    call_apiV1DevicesDeviceIdDelete
    ;;
    apiV1DevicesDeviceIdDetailsGet)
    call_apiV1DevicesDeviceIdDetailsGet
    ;;
    apiV1DevicesDeviceIdDetailsLostmodeDelete)
    call_apiV1DevicesDeviceIdDetailsLostmodeDelete
    ;;
    apiV1DevicesDeviceIdDetailsLostmodeGet)
    call_apiV1DevicesDeviceIdDetailsLostmodeGet
    ;;
    apiV1DevicesDeviceIdGet)
    call_apiV1DevicesDeviceIdGet
    ;;
    apiV1DevicesDeviceIdLibraryItemsGet)
    call_apiV1DevicesDeviceIdLibraryItemsGet
    ;;
    apiV1DevicesDeviceIdNotesGet)
    call_apiV1DevicesDeviceIdNotesGet
    ;;
    apiV1DevicesDeviceIdNotesNoteIdDelete)
    call_apiV1DevicesDeviceIdNotesNoteIdDelete
    ;;
    apiV1DevicesDeviceIdNotesNoteIdGet)
    call_apiV1DevicesDeviceIdNotesNoteIdGet
    ;;
    apiV1DevicesDeviceIdNotesNoteIdPatch)
    call_apiV1DevicesDeviceIdNotesNoteIdPatch
    ;;
    apiV1DevicesDeviceIdNotesPost)
    call_apiV1DevicesDeviceIdNotesPost
    ;;
    apiV1DevicesDeviceIdParametersGet)
    call_apiV1DevicesDeviceIdParametersGet
    ;;
    apiV1DevicesDeviceIdPatch)
    call_apiV1DevicesDeviceIdPatch
    ;;
    apiV1DevicesDeviceIdSecretsBypasscodeGet)
    call_apiV1DevicesDeviceIdSecretsBypasscodeGet
    ;;
    apiV1DevicesDeviceIdSecretsFilevaultkeyGet)
    call_apiV1DevicesDeviceIdSecretsFilevaultkeyGet
    ;;
    apiV1DevicesDeviceIdSecretsRecoverypasswordGet)
    call_apiV1DevicesDeviceIdSecretsRecoverypasswordGet
    ;;
    apiV1DevicesDeviceIdSecretsUnlockpinGet)
    call_apiV1DevicesDeviceIdSecretsUnlockpinGet
    ;;
    apiV1DevicesDeviceIdStatusGet)
    call_apiV1DevicesDeviceIdStatusGet
    ;;
    apiV1DevicesGet)
    call_apiV1DevicesGet
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdDelete)
    call_apiV1IntegrationsAppleAdeAdeTokenIdDelete
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet)
    call_apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdGet)
    call_apiV1IntegrationsAppleAdeAdeTokenIdGet
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdPatch)
    call_apiV1IntegrationsAppleAdeAdeTokenIdPatch
    ;;
    apiV1IntegrationsAppleAdeAdeTokenIdRenewPost)
    call_apiV1IntegrationsAppleAdeAdeTokenIdRenewPost
    ;;
    apiV1IntegrationsAppleAdeDevicesDeviceIdGet)
    call_apiV1IntegrationsAppleAdeDevicesDeviceIdGet
    ;;
    apiV1IntegrationsAppleAdeDevicesDeviceIdPatch)
    call_apiV1IntegrationsAppleAdeDevicesDeviceIdPatch
    ;;
    apiV1IntegrationsAppleAdeDevicesGet)
    call_apiV1IntegrationsAppleAdeDevicesGet
    ;;
    apiV1IntegrationsAppleAdeGet)
    call_apiV1IntegrationsAppleAdeGet
    ;;
    apiV1IntegrationsAppleAdePost)
    call_apiV1IntegrationsAppleAdePost
    ;;
    apiV1IntegrationsAppleAdePublicKeyGet)
    call_apiV1IntegrationsAppleAdePublicKeyGet
    ;;
    apiV1LibraryCustomAppsGet)
    call_apiV1LibraryCustomAppsGet
    ;;
    apiV1LibraryCustomAppsLibraryItemIdDelete)
    call_apiV1LibraryCustomAppsLibraryItemIdDelete
    ;;
    apiV1LibraryCustomAppsLibraryItemIdGet)
    call_apiV1LibraryCustomAppsLibraryItemIdGet
    ;;
    apiV1LibraryCustomAppsLibraryItemIdPatch)
    call_apiV1LibraryCustomAppsLibraryItemIdPatch
    ;;
    apiV1LibraryCustomAppsPost)
    call_apiV1LibraryCustomAppsPost
    ;;
    apiV1LibraryCustomAppsUploadPost)
    call_apiV1LibraryCustomAppsUploadPost
    ;;
    apiV1LibraryCustomProfilesGet)
    call_apiV1LibraryCustomProfilesGet
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdDelete)
    call_apiV1LibraryCustomProfilesLibraryItemIdDelete
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdGet)
    call_apiV1LibraryCustomProfilesLibraryItemIdGet
    ;;
    apiV1LibraryCustomProfilesLibraryItemIdPatch)
    call_apiV1LibraryCustomProfilesLibraryItemIdPatch
    ;;
    apiV1LibraryCustomProfilesPost)
    call_apiV1LibraryCustomProfilesPost
    ;;
    apiV1LibraryCustomScriptsGet)
    call_apiV1LibraryCustomScriptsGet
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdDelete)
    call_apiV1LibraryCustomScriptsLibraryItemIdDelete
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdGet)
    call_apiV1LibraryCustomScriptsLibraryItemIdGet
    ;;
    apiV1LibraryCustomScriptsLibraryItemIdPatch)
    call_apiV1LibraryCustomScriptsLibraryItemIdPatch
    ;;
    apiV1LibraryCustomScriptsPost)
    call_apiV1LibraryCustomScriptsPost
    ;;
    apiV1LibraryLibraryItemsLibraryItemIdActivityGet)
    call_apiV1LibraryLibraryItemsLibraryItemIdActivityGet
    ;;
    apiV1LibraryLibraryItemsLibraryItemIdStatusGet)
    call_apiV1LibraryLibraryItemsLibraryItemIdStatusGet
    ;;
    apiV1PrismActivationLockGet)
    call_apiV1PrismActivationLockGet
    ;;
    apiV1PrismApplicationFirewallGet)
    call_apiV1PrismApplicationFirewallGet
    ;;
    apiV1PrismAppsGet)
    call_apiV1PrismAppsGet
    ;;
    apiV1PrismCertificatesGet)
    call_apiV1PrismCertificatesGet
    ;;
    apiV1PrismCountGet)
    call_apiV1PrismCountGet
    ;;
    apiV1PrismDesktopAndScreensaverGet)
    call_apiV1PrismDesktopAndScreensaverGet
    ;;
    apiV1PrismDeviceInformationGet)
    call_apiV1PrismDeviceInformationGet
    ;;
    apiV1PrismExportExportIdGet)
    call_apiV1PrismExportExportIdGet
    ;;
    apiV1PrismExportPost)
    call_apiV1PrismExportPost
    ;;
    apiV1PrismFilevaultGet)
    call_apiV1PrismFilevaultGet
    ;;
    apiV1PrismGatekeeperAndXprotectGet)
    call_apiV1PrismGatekeeperAndXprotectGet
    ;;
    apiV1PrismInstalledProfilesGet)
    call_apiV1PrismInstalledProfilesGet
    ;;
    apiV1PrismKernelExtensionsGet)
    call_apiV1PrismKernelExtensionsGet
    ;;
    apiV1PrismLaunchAgentsAndDaemonsGet)
    call_apiV1PrismLaunchAgentsAndDaemonsGet
    ;;
    apiV1PrismLocalUsersGet)
    call_apiV1PrismLocalUsersGet
    ;;
    apiV1PrismStartupSettingsGet)
    call_apiV1PrismStartupSettingsGet
    ;;
    apiV1PrismSystemExtensionsGet)
    call_apiV1PrismSystemExtensionsGet
    ;;
    apiV1PrismTransparencyDatabaseGet)
    call_apiV1PrismTransparencyDatabaseGet
    ;;
    apiV1SelfServiceCategoriesGet)
    call_apiV1SelfServiceCategoriesGet
    ;;
    apiV1SettingsLicensingGet)
    call_apiV1SettingsLicensingGet
    ;;
    apiV1TagsGet)
    call_apiV1TagsGet
    ;;
    apiV1TagsPost)
    call_apiV1TagsPost
    ;;
    apiV1TagsTagIdDelete)
    call_apiV1TagsTagIdDelete
    ;;
    apiV1TagsTagIdPatch)
    call_apiV1TagsTagIdPatch
    ;;
    apiV1ThreatDetailsGet)
    call_apiV1ThreatDetailsGet
    ;;
    apiV1UsersGet)
    call_apiV1UsersGet
    ;;
    apiV1UsersUserIdGet)
    call_apiV1UsersUserIdGet
    ;;
    rootPost)
    call_rootPost
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac