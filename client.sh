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
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionErasePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionLockPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdActivitylimit300Get:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdAppsGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdCommandslimit300Get:::device_id"]=1
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
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdNotesPost:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdParametersGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1DevicesDeviceIdStatusGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=1
operation_parameters_minimum_occurrences["apiV1PrismExportExportIdGet:::export_id"]=1
operation_parameters_minimum_occurrences["apiV1TagsTagIdDelete:::tag_id"]=1
operation_parameters_minimum_occurrences["apiV1TagsTagIdPatch:::tag_id"]=1
operation_parameters_minimum_occurrences["apiV1UsersUserIdGet:::user_id"]=1
operation_parameters_minimum_occurrences["postUrlPost:::post_url"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionErasePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionLockPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdActivitylimit300Get:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdAppsGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdCommandslimit300Get:::device_id"]=0
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
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdNotesPost:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdParametersGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1DevicesDeviceIdStatusGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=0
operation_parameters_maximum_occurrences["apiV1PrismExportExportIdGet:::export_id"]=0
operation_parameters_maximum_occurrences["apiV1TagsTagIdDelete:::tag_id"]=0
operation_parameters_maximum_occurrences["apiV1TagsTagIdPatch:::tag_id"]=0
operation_parameters_maximum_occurrences["apiV1UsersUserIdGet:::user_id"]=0
operation_parameters_maximum_occurrences["postUrlPost:::post_url"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdAssignLibraryItemPost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdDelete:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdListLibraryItemsGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdPatch:::blueprint_id"]=""
operation_parameters_collection_type["apiV1BlueprintsBlueprintIdRemoveLibraryItemPost:::blueprint_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionBlankpushPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionClearpasscodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionDeleteuserPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionDisablelostmodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionEnablelostmodePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionErasePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionLockPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionPlaylostmodesoundPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionReinstallagentPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRemotedesktopPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRenewmdmprofilePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionRestartPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionSetnamePost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionShutdownPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUnlockaccountPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUpdateinventoryPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActionUpdatelocationPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdActivitylimit300Get:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdAppsGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdCommandslimit300Get:::device_id"]=""
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
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::Authorization"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::Content-Type"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesNoteIdPatch:::note_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdNotesPost:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdParametersGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsBypasscodeGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsFilevaultkeyGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsRecoverypasswordGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdSecretsUnlockpinGet:::device_id"]=""
operation_parameters_collection_type["apiV1DevicesDeviceIdStatusGet:::device_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdDelete:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdGet:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdPatch:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeAdeTokenIdRenewPost:::ade_token_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesDeviceIdGet:::device_id"]=""
operation_parameters_collection_type["apiV1IntegrationsAppleAdeDevicesDeviceIdPatch:::device_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomAppsLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomProfilesLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdDelete:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryCustomScriptsLibraryItemIdPatch:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdActivityGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1LibraryLibraryItemsLibraryItemIdStatusGet:::library_item_id"]=""
operation_parameters_collection_type["apiV1PrismExportExportIdGet:::export_id"]=""
operation_parameters_collection_type["apiV1TagsTagIdDelete:::tag_id"]=""
operation_parameters_collection_type["apiV1TagsTagIdPatch:::tag_id"]=""
operation_parameters_collection_type["apiV1UsersUserIdGet:::user_id"]=""
operation_parameters_collection_type["postUrlPost:::post_url"]=""


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
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[default]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}apiV1BlueprintsBlueprintIdAssignLibraryItemPost${OFF};Assign Library Item
  ${CYAN}apiV1BlueprintsBlueprintIdDelete${OFF};Delete Blueprint
  ${CYAN}apiV1BlueprintsBlueprintIdGet${OFF};Get Blueprint
  ${CYAN}apiV1BlueprintsBlueprintIdListLibraryItemsGet${OFF};List Library Items
  ${CYAN}apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet${OFF};Get Manual Enrollment Profile
  ${CYAN}apiV1BlueprintsBlueprintIdPatch${OFF};Update Blueprint
  ${CYAN}apiV1BlueprintsBlueprintIdRemoveLibraryItemPost${OFF};Remove Library Item
  ${CYAN}apiV1BlueprintsGet${OFF};List Blueprints
  ${CYAN}apiV1BlueprintsPost${OFF};Create Blueprint
  ${CYAN}apiV1BlueprintsTemplatesGet${OFF};Get Blueprint Templates
  ${CYAN}apiV1DevicesDeviceIdActionBlankpushPost${OFF};Send Blankpush
  ${CYAN}apiV1DevicesDeviceIdActionClearpasscodePost${OFF};Clear Passcode
  ${CYAN}apiV1DevicesDeviceIdActionDeleteuserPost${OFF};Delete User
  ${CYAN}apiV1DevicesDeviceIdActionDisablelostmodePost${OFF};Disable Lost Mode
  ${CYAN}apiV1DevicesDeviceIdActionEnablelostmodePost${OFF};Enable Lost Mode
  ${CYAN}apiV1DevicesDeviceIdActionErasePost${OFF};Erase Device
  ${CYAN}apiV1DevicesDeviceIdActionLockPost${OFF};Lock Device
  ${CYAN}apiV1DevicesDeviceIdActionPlaylostmodesoundPost${OFF};Play Lost Mode Sound
  ${CYAN}apiV1DevicesDeviceIdActionReinstallagentPost${OFF};Reinstall Agent
  ${CYAN}apiV1DevicesDeviceIdActionRemotedesktopPost${OFF};Remote Desktop
  ${CYAN}apiV1DevicesDeviceIdActionRenewmdmprofilePost${OFF};Renew MDM Profile
  ${CYAN}apiV1DevicesDeviceIdActionRestartPost${OFF};Restart Device
  ${CYAN}apiV1DevicesDeviceIdActionSetnamePost${OFF};Set Name
  ${CYAN}apiV1DevicesDeviceIdActionShutdownPost${OFF};Shutdown
  ${CYAN}apiV1DevicesDeviceIdActionUnlockaccountPost${OFF};Unlock Account
  ${CYAN}apiV1DevicesDeviceIdActionUpdateinventoryPost${OFF};Update Inventory
  ${CYAN}apiV1DevicesDeviceIdActionUpdatelocationPost${OFF};Update Location
  ${CYAN}apiV1DevicesDeviceIdActivitylimit300Get${OFF};Get Device Activity
  ${CYAN}apiV1DevicesDeviceIdAppsGet${OFF};Get Device Apps
  ${CYAN}apiV1DevicesDeviceIdCommandslimit300Get${OFF};Get Device Commands
  ${CYAN}apiV1DevicesDeviceIdDelete${OFF};Delete Device
  ${CYAN}apiV1DevicesDeviceIdDetailsGet${OFF};Get Device Details
  ${CYAN}apiV1DevicesDeviceIdDetailsLostmodeDelete${OFF};Cancel Lost Mode
  ${CYAN}apiV1DevicesDeviceIdDetailsLostmodeGet${OFF};Get Device Lost Mode details
  ${CYAN}apiV1DevicesDeviceIdGet${OFF};Get Device
  ${CYAN}apiV1DevicesDeviceIdLibraryItemsGet${OFF};Get Device Library Items
  ${CYAN}apiV1DevicesDeviceIdNotesGet${OFF};Get Device Notes
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdDelete${OFF};Delete Device Note
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdGet${OFF};Retrieve Device Note
  ${CYAN}apiV1DevicesDeviceIdNotesNoteIdPatch${OFF};Update Device Note
  ${CYAN}apiV1DevicesDeviceIdNotesPost${OFF};Create Device Note
  ${CYAN}apiV1DevicesDeviceIdParametersGet${OFF};Get Device Parameters
  ${CYAN}apiV1DevicesDeviceIdPatch${OFF};Update Device
  ${CYAN}apiV1DevicesDeviceIdSecretsBypasscodeGet${OFF};Get Activation Lock Bypass Code
  ${CYAN}apiV1DevicesDeviceIdSecretsFilevaultkeyGet${OFF};Get FileVault Recovery Key
  ${CYAN}apiV1DevicesDeviceIdSecretsRecoverypasswordGet${OFF};Get Recovery Lock Password
  ${CYAN}apiV1DevicesDeviceIdSecretsUnlockpinGet${OFF};Get Unlock Pin
  ${CYAN}apiV1DevicesDeviceIdStatusGet${OFF};Get Device Status
  ${CYAN}apiV1Deviceslimit300Get${OFF};List Devices
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdDelete${OFF};Delete ADE integration
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet${OFF};List devices associated to ADE token
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdGet${OFF};Get ADE integration
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdPatch${OFF};Update ADE integration
  ${CYAN}apiV1IntegrationsAppleAdeAdeTokenIdRenewPost${OFF};Renew ADE integration
  ${CYAN}apiV1IntegrationsAppleAdeDevicesDeviceIdGet${OFF};Get ADE device
  ${CYAN}apiV1IntegrationsAppleAdeDevicesDeviceIdPatch${OFF};Update ADE device
  ${CYAN}apiV1IntegrationsAppleAdeDevicesGet${OFF};List ADE devices
  ${CYAN}apiV1IntegrationsAppleAdeGet${OFF};List ADE integrations
  ${CYAN}apiV1IntegrationsAppleAdePost${OFF};Create ADE integration
  ${CYAN}apiV1IntegrationsAppleAdePublicKeyGet${OFF};Download ADE public key
  ${CYAN}apiV1LibraryCustomAppsGet${OFF};List Custom Apps
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdDelete${OFF};Delete Custom App
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdGet${OFF};Get Custom App
  ${CYAN}apiV1LibraryCustomAppsLibraryItemIdPatch${OFF};Update Custom App
  ${CYAN}apiV1LibraryCustomAppsPost${OFF};Create Custom App
  ${CYAN}apiV1LibraryCustomAppsUploadPost${OFF};Upload Custom App
  ${CYAN}apiV1LibraryCustomProfilesGet${OFF};List Custom Profiles
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdDelete${OFF};Delete Custom Profile
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdGet${OFF};Get Custom Profile
  ${CYAN}apiV1LibraryCustomProfilesLibraryItemIdPatch${OFF};Update Custom Profile
  ${CYAN}apiV1LibraryCustomProfilesPost${OFF};Create Custom Profile
  ${CYAN}apiV1LibraryCustomScriptsGet${OFF};List Custom Scripts
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdDelete${OFF};Delete Custom Script
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdGet${OFF};Get Custom Script
  ${CYAN}apiV1LibraryCustomScriptsLibraryItemIdPatch${OFF};Update Custom Script
  ${CYAN}apiV1LibraryCustomScriptsPost${OFF};Create Custom Script
  ${CYAN}apiV1LibraryLibraryItemsLibraryItemIdActivityGet${OFF};Get Library Item Activity
  ${CYAN}apiV1LibraryLibraryItemsLibraryItemIdStatusGet${OFF};Get Library Item Statuses
  ${CYAN}apiV1PrismActivationLockGet${OFF};Activation lock
  ${CYAN}apiV1PrismApplicationFirewallGet${OFF};Application firewall
  ${CYAN}apiV1PrismAppsGet${OFF};Applications
  ${CYAN}apiV1PrismCertificatesGet${OFF};Certificates
  ${CYAN}apiV1PrismCountcategoryappsGet${OFF};Count
  ${CYAN}apiV1PrismDesktopAndScreensaverGet${OFF};Desktop and Screensaver
  ${CYAN}apiV1PrismDeviceInformationGet${OFF};Device information
  ${CYAN}apiV1PrismExportExportIdGet${OFF};Get category export
  ${CYAN}apiV1PrismExportPost${OFF};Request category export
  ${CYAN}apiV1PrismFilevaultGet${OFF};FileVault
  ${CYAN}apiV1PrismGatekeeperAndXprotectGet${OFF};Gatekeeper and XProtect
  ${CYAN}apiV1PrismInstalledProfilesGet${OFF};Installed profiles
  ${CYAN}apiV1PrismKernelExtensionsGet${OFF};Kernel Extensions
  ${CYAN}apiV1PrismLaunchAgentsAndDaemonsGet${OFF};Launch Agents and Daemons
  ${CYAN}apiV1PrismLocalUsersGet${OFF};Local users
  ${CYAN}apiV1PrismStartupSettingsGet${OFF};Startup settings
  ${CYAN}apiV1PrismSystemExtensionsGet${OFF};System Extensions
  ${CYAN}apiV1PrismTransparencyDatabaseGet${OFF};Transparency database
  ${CYAN}apiV1SelfServiceCategoriesGet${OFF};List Self Service Categories
  ${CYAN}apiV1SettingsLicensingGet${OFF};Licensing
  ${CYAN}apiV1TagsPost${OFF};Create Tag
  ${CYAN}apiV1TagsTagIdDelete${OFF};Delete Tag
  ${CYAN}apiV1TagsTagIdPatch${OFF};Update Tag
  ${CYAN}apiV1TagssearchaccuhiveGet${OFF};Get Tags
  ${CYAN}apiV1ThreatDetailsGet${OFF};Get Threat Details
  ${CYAN}apiV1UsersGet${OFF};List Users
  ${CYAN}apiV1UsersUserIdGet${OFF};Get User
  ${CYAN}postUrlPost${OFF};Upload to S3
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://localhost')"

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

<html><head></head><body><h1 id=\"welcome-to-the-kandji-api-documentation\">Welcome to the Kandji API Documentation</h1>\\n<p>You can find your API URL in Settings &gt; Access. The API URL will follow the below formats.</p>\\n<ul>\\n<li><p>US - <code>https://SubDomain.api.kandji.io</code></p>\\n</li>\\n<li><p>EU - <code>https://SubDomain.api.eu.kandji.io</code></p>\\n</li>\\n</ul>\\n<p>For information on how to obtain an API token, please refer to the following support article.</p>\\n<p><a href=\"https://support.kandji.io/api\">https://support.kandji.io/api</a></p>\\n<h4 id=\"rate-limit\">Rate Limit</h4>\\n<p>The Kandji API currently has an API rate limit of 10,000 requests per hour per customer.</p>\\n<h4 id=\"request-methods\">Request Methods</h4>\\n<p>HTTP request methods supported by the Kandji API.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Method</th>\\n<th>Definition</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>GET</td>\\n<td>The <code>GET</code> method requests a representation of the specified resource.</td>\\n</tr>\\n<tr>\\n<td>POST</td>\\n<td>The <code>POST</code> method submits an entity to the specified resource.</td>\\n</tr>\\n<tr>\\n<td>PATCH</td>\\n<td>The <code>PATCH</code> method applies partial modifications to a resource.</td>\\n</tr>\\n<tr>\\n<td>DELETE</td>\\n<td>The <code>DELETE</code> method deletes the specified resource.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"response-codes\">Response codes</h4>\\n<p>Not all response codes apply to every endpoint.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Code</th>\\n<th>Response</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>200</td>\\n<td>OK</td>\\n</tr>\\n<tr>\\n<td>201</td>\\n<td>Created</td>\\n</tr>\\n<tr>\\n<td>204</td>\\n<td>No content</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Typical response when sending the DELETE method.</td>\\n</tr>\\n<tr>\\n<td>400</td>\\n<td>Bad Request</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command already running\" - The command may already be running in a <em>Pending</em> state waiting on the device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command is not allowed for current device\" - The command may not be compatible with the target device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"JSON parse error - Expecting ',' delimiter: line 3 column 2 (char 65)\"</td>\\n</tr>\\n<tr>\\n<td>401</td>\\n<td>Unauthorized</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if the token is incorrect, was revoked, or the token has expired.</td>\\n</tr>\\n<tr>\\n<td>403</td>\\n<td>Forbidden</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request was understood but cannot be authorized.</td>\\n</tr>\\n<tr>\\n<td>404</td>\\n<td>Not found</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Unable to locate the resource in the Kandji tenant.</td>\\n</tr>\\n<tr>\\n<td>415</td>\\n<td>Unsupported Media Type</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request contains a media type which the server or resource does not support.</td>\\n</tr>\\n<tr>\\n<td>500</td>\\n<td>Internal server error</td>\\n</tr>\\n<tr>\\n<td>503</td>\\n<td>Service unavailable</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if a file upload is still being processed via the custom apps API.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"data-structure\">Data structure</h4>\\n<p>The API returns all structured responses in JSON schema format.</p>\\n<h4 id=\"examples\">Examples</h4>\\n<p>Code examples using the API can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools\">GitHub</a>.</p>\\n</body></html>
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
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdAssignLibraryItemPost - Assign Library Item${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows assigning a library item to a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n<h3 id=\"request-body\">Request Body</h3>\\n<ul>\\n<li><p><code>library_item_id</code> (string, required)</p>\\n</li>\\n<li><p><code>assignment_node_id</code> (string, required for maps)</p>\\n<ul>\\n<li>Note: To find the assignment_node_id, view the map in a browser. Then, on your keyboard, press and hold the Option ⌥ key. Each node ID remains fixed for the lifespan of the node on the map.</li>\\n</ul>\\n</li>\\n</ul>\\n<h3 id=\"error-responses\">Error responses</h3>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Code</strong></th>\\n<th><strong>Body</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>400 - Bad Request</td>\\n<td>Bad Request</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Library Item already exists on Blueprint\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Library Item already exists in Assignment Node\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"assignment_node_id cannot be provided for Classic Blueprint\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Must provide assignment_node_id for Assignment Map Blueprint\"</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success - classic${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdDelete operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdDelete - Delete Blueprint${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=\"warning\"><strong>WARNING!</strong></h1>\\n<p>This is a HIGHLY destructive action.</p>\\n<p>Deleting a Blueprint will un-manage ALL devices assigned to the Blueprint.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdGet - Get Blueprint${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns information about a specific blueprint based on blueprint ID.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdListLibraryItemsGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdListLibraryItemsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdListLibraryItemsGet - List Library Items${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This API endpoint retrieves a list of library items associated with a specific blueprint. (classic and maps). Requires that the blueprint ID is passed as a path parameter in the URL.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n<h3 id=\"response-fields\">Response fields</h3>\\n<ul>\\n<li><p><code>count</code> (int): The total count of library items.</p>\\n</li>\\n<li><p><code>next</code> (str): The URL for the next page of results, if available. If not available will value will be <code>null</code>.</p>\\n</li>\\n<li><p><code>previous</code> (str): The URL for the previous page of results, if available. If not available will value will be <code>null</code>.</p>\\n</li>\\n<li><p><code>results</code> (object): An array containing objects with the following fields:</p>\\n<ul>\\n<li><p><code>id</code> (str): The ID of the library item.</p>\\n</li>\\n<li><p><code>name</code> (str): The name of the library item.</p>\\n</li>\\n</ul>\\n</li>\\n</ul>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet - Get Manual Enrollment Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the manual enrollment profile (.mobileconfig file) for a specified Blueprint.</p>\\n<p>This request will return the enrollment profile even if \"Require Authentication\" is configured for the Blueprint in Manual Enrollment.</p>\\n<p>The enrollment profile will be returned in raw form with response headers:</p>\\n<ul>\\n<li><p><code>Content-Type</code> = <code>application/x-apple-aspen-config</code></p>\\n</li>\\n<li><p><code>Content-Disposition</code> = <code>attachment;filename=kandji-enroll.mobileconfig</code></p>\\n</li>\\n</ul>\\n<p>An optional query parameter <code>sso=true</code> can be used to return a URL for SSO authentication instead. If this query parameter is used for a Blueprint that does not require authentication, then the enrollment profile will be returned.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get Manual Enrollment Profile${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdPatch operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdPatch - Update Blueprint${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This requests allows updating of the name, icon, icon color, description, enrollment code, and active status on an existing blueprint.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsBlueprintIdRemoveLibraryItemPost operation
#
##############################################################################
print_apiV1BlueprintsBlueprintIdRemoveLibraryItemPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsBlueprintIdRemoveLibraryItemPost - Remove Library Item${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows removing a library item from a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>\\n<h3 id=\"request-body\">Request Body</h3>\\n<ul>\\n<li><p><code>library_item_id</code> (string, required)</p>\\n</li>\\n<li><p><code>assignment_node_id</code> (string, required for maps)</p>\\n</li>\\n</ul>\\n<h3 id=\"error-responses\">Error responses</h3>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Code</strong></th>\\n<th><strong>Body</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>400 - Bad Request</td>\\n<td>Bad Request</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"assignment_node_id cannot be provided for Classic Blueprint\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Must provide assignment_node_id for Assignment Map Blueprint\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Library Item does not exist on Blueprint\"</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Library Item does not exist in Assignment Node\"</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'blueprint_id' ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success - classic${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsGet operation
#
##############################################################################
print_apiV1BlueprintsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsGet - List Blueprints${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of a blueprint records in the Kandji tenant. Optional query parameters can be specified to filter the results.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsPost operation
#
##############################################################################
print_apiV1BlueprintsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsPost - Create Blueprint${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request creates a new empty Blueprint or a new Blueprint from a template. The keys <code>name</code> and <code>enrollment_code</code> <code>is_active</code> are required, and the blueprint name key must be unique from the existing blueprint names in the Kandji tenant.</p>\\n<p>optionally, <code>type: map</code> can be used when creating a new Assignment Map blueprint.</p>\\n<p>Note: If cloning an existing blueprint,'type' value and the type of sourced ('source.id') blueprint must match and 'source.type' value must be set to 'blueprint'.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;400 - type does not match source.id blueprint type${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1BlueprintsTemplatesGet operation
#
##############################################################################
print_apiV1BlueprintsTemplatesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1BlueprintsTemplatesGet - Get Blueprint Templates${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionBlankpushPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionBlankpushPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionBlankpushPost - Send Blankpush${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to initiate a blank push.</p>\\n<p><a href=\"https://support.kandji.io/what-is-a-blank-push\">Using the Blank Push command</a></p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Send Blankpush${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionClearpasscodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionClearpasscodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionClearpasscodePost - Clear Passcode${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to clear a device passcode. Available for iPhone and iPad.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Clear Passcode${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionDeleteuserPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionDeleteuserPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionDeleteuserPost - Delete User${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to delete a local user account on macOS and Shared iPad (Device Supervision via Automated Device Enrollment is required).</p>\\n<p><strong>Request Body Parameters</strong>: application/json</p>\\n<hr />\\n<p><code>DeleteAllUsers</code> - <code>boolean</code></p>\\n<p><code>ForceDeletion</code> - <code>boolean</code></p>\\n<p><code>UserName</code> - <code>string</code></p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Delete User${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionDisablelostmodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionDisablelostmodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionDisablelostmodePost - Disable Lost Mode${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This command will send a request to turn off lost mode on iOS and iPadOS.</p>\\n<p>If the command is already pending, the message \"<em>Disable lost mode is already pending for this device.</em>\" will be in the response.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Disable Lost Mode${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionEnablelostmodePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionEnablelostmodePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionEnablelostmodePost - Enable Lost Mode${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely turn on lost mode on iOS and iPadOS.</p>\\n<p>Optionally, a JSON payload can be sent in the request to set a lock message, phone number, and footnote on the target device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Enable Lost Mode${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionErasePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionErasePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionErasePost - Erase Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to erase the device.</p>\\n<p>iOS 4.0+, iPadOS 4.0+, macOS 10.7+, tvOS 10.2+</p>\\n<p><strong>Request Body Parameters: application/json</strong></p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Key</th>\\n<th>Type</th>\\n<th>Description</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td><code>PIN</code></td>\\n<td><code>string</code></td>\\n<td>The six-character PIN for Find My. This value is available in macOS 10.8 and later.</td>\\n</tr>\\n<tr>\\n<td><code>PreserveDataPlan</code></td>\\n<td><code>boolean</code></td>\\n<td>If true, preserve the data plan on an iPhone or iPad with eSIM functionality, if one exists. This value is available in iOS 11 and later.  <br />  <br />Default: true</td>\\n</tr>\\n<tr>\\n<td><code>DisallowProximitySetup</code></td>\\n<td><code>boolean</code></td>\\n<td>If true, disable Proximity Setup on the next reboot and skip the pane in Setup Assistant. This value is available in iOS 11 and later. Prior to iOS 14, don’t use this option with any other option.  <br />  <br />Default: false</td>\\n</tr>\\n<tr>\\n<td><code>ReturnToService</code></td>\\n<td><code>object</code></td>\\n<td>(iOS 17 and later and iPadOS 17 and later and with Shared iPad ) When sending the erase device command to mobile devices, use this key to enable Return to Service. Include an optional Wi-Fi payload ProfileId to allow the device to connect to a Wi-Fi network automatically after being erased. If a Wi-Fi ProfileId is not provided and the mobile device is not tethered to a Mac to share the network connection, the end-user will be required to select a Wi-Fi network to complete the setup.  <br />  <br />If sent to any macOS computer or to mobile devices on iOS 16 or iPadOS 16 and below, the RTS keys will be ignored, and only the erase device command will be issued to the device.</td>\\n</tr>\\n<tr>\\n<td>- <code>Enabled</code></td>\\n<td><code>boolean</code></td>\\n<td>(Required) If true, the device tries to re-enroll itself automatically after erasure. The user needs to deactivate all activation locks for this feature to work correctly.</td>\\n</tr>\\n<tr>\\n<td>- <code>ProfileId</code></td>\\n<td><code>string</code></td>\\n<td>Profile ID value associated with a Wi-Fi profile payload. This is required when the device doesn’t have ethernet access.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;RTS - Profile not in scope${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionLockPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionLockPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionLockPost - Lock Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely lock a device.</p>\\n<p>For macOS clients, an unlock PIN will be created, and returned in the response.</p>\\n<blockquote>\\n<p><strong>Caution !!!</strong><br /><em>For a Mac with Apple silicon running a version of macOS before 11.5 will deactivate the Mac. To reactivate, the Mac requires a network connection and authentication by a Secure Token enabled local administrator.</em></p>\\n</blockquote>\\n<p>Optionally, a JSON payload can be sent in the request to set a lock message and phone number on the target device.</p>\\n<p><strong>Note:</strong> For macOS, although the lock message is displayed on all types of Mac computers, the phone number is displayed only on a Mac with Apple silicon.</p>\\n<h4 id=\"response-properties\">Response properties</h4>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Property</th>\\n<th>Description</th>\\n<th>Type</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>PIN</td>\\n<td>Six digit pin code used to unlock a Mac.</td>\\n<td>String</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Device already locked${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionPlaylostmodesoundPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionPlaylostmodesoundPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionPlaylostmodesoundPost - Play Lost Mode Sound${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This command will tell the target iOS or iPadOS device to play the lost mode sound.</p>\\n<p><strong>Note</strong>: The Lost Mode sound will play for 2 minutes, even if the device is in silent mode. Anyone finding the device can silence the sound by pressing any of its side buttons.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Play Lost Mode Sound${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionReinstallagentPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionReinstallagentPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionReinstallagentPost - Reinstall Agent${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command reinstall the Kandji Agent. Available for macOS devices.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Reinstall Agent${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRemotedesktopPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRemotedesktopPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRemotedesktopPost - Remote Desktop${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to control the Remote Management status on a Mac. This MDM command turns on (or turns off) Remote Management with <em>Observe</em> and <em>Control</em> permissions given to all users*.*</p>\\n<p><strong>Request Body Parameters</strong>: application/json</p>\\n<hr />\\n<p><code>EnableRemoteDesktop</code> - <code>boolean</code></p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Turn off Remote Desktop${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRenewmdmprofilePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRenewmdmprofilePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRenewmdmprofilePost - Renew MDM Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to re-install the existing root MDM profile for a given device ID. This command will not impact any existing configurations, apps, or profiles.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Renew MDM Profile${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionRestartPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionRestartPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionRestartPost - Restart Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely restart a device.</p>\\n<ul>\\n<li><p><code>RebuildKernelCache</code> - If <code>true</code>, the system rebuilds the kernel cache during a device restart. If <code>BootstrapTokenAllowedForAuthentication</code> is <code>true</code> inSecurityInfoResponse.SecurityInfo, the device requests the bootstrap token from MDM before executing this command. This value is available in macOS 11 and later. Default: false</p>\\n</li>\\n<li><p><code>NotifyUser</code> - If <code>true</code>, notifies the user to restart the device at their convenience. Forced restart if the device is at <code>loginwindow</code> with no logged-in users. The user can dismiss the notification and ignore the request. No further notifications display unless you resend the command. This value is available in macOS 11.3 and later. Default: false</p>\\n</li>\\n</ul>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Restart Device${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionSetnamePost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionSetnamePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionSetnamePost - Set Name${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to set the device name.</p>\\n<p><strong>Request Body Parameters</strong>: application/json</p>\\n<hr />\\n<p><code>DeviceName</code> - <code>string</code></p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Set Name${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionShutdownPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionShutdownPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionShutdownPost - Shutdown${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to shutdown a device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Shutdown${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUnlockaccountPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUnlockaccountPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUnlockaccountPost - Unlock Account${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to unlock a user account that locked by the system because of too many failed password attempts. Available for macOS.</p>\\n<p><strong>Request Body Parameters</strong>: application/json</p>\\n<hr />\\n<p><code>UserName</code> - <code>string</code></p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Unlock Account${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUpdateinventoryPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUpdateinventoryPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUpdateinventoryPost - Update Inventory${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to start a check-in for a device, initiating the daily MDM commands and MDM logic.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Update Inventory${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActionUpdatelocationPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdActionUpdatelocationPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActionUpdatelocationPost - Update Location${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to update the location data on iOS and iPadOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Update Location${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdActivitylimit300Get operation
#
##############################################################################
print_apiV1DevicesDeviceIdActivitylimit300Get_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdActivitylimit300Get - Get Device Activity${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device activity for a specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get Device Activity${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdAppsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdAppsGet - Get Device Apps${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of all installed apps for a specified Device ID.</p>\\n<p>For iPhone and iPad, the preinstalled Apple apps are not reported.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;iPad apps${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdCommandslimit300Get operation
#
##############################################################################
print_apiV1DevicesDeviceIdCommandslimit300Get_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdCommandslimit300Get - Get Device Commands${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends a request to get information about the commands sent to a given device ID.</p>\\n<h3 id=\"mdm-status-codes\">MDM Status Codes</h3>\\n<ul>\\n<li>1 : Command is Pending</li>\\n<li>2 : Command is running</li>\\n<li>3 : Command completed</li>\\n<li>4 : Command failed</li>\\n<li>5 : Command received \"Not Now\" response</li>\\n</ul>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get Device Commands${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDelete - Delete Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to delete a device. This will remove the device record from Kandji and send a Remove Management command. For macOS devices, it will also send an uninstall command to the Kandji Agent at the next agent checkin.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Delete Device${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsGet - Get Device Details${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device details for a specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;iPhone or iPad in Lost mode${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsLostmodeDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsLostmodeDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsLostmodeDelete - Cancel Lost Mode${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint can be used to send a cancelation request if Lost Mode is in an error state for a given iOS or iPadOS device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=0
    echo -e "${result_color_table[${code:0:1}]}  0;Default response${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdDetailsLostmodeGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdDetailsLostmodeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdDetailsLostmodeGet - Get Device Lost Mode details${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device lost mode details for a specified Device ID.</p>\\n<p><strong>Note</strong>: Lost Mode is is only available for iOS and iPadOS. For more information, please see this <a href=\"https://support.kandji.io/a/solutions/articles/72000573873\">Kandji support artilcle</a>.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Device not in lost mode${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdGet - Get Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the high-level information for a specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get iPad${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdLibraryItemsGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdLibraryItemsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdLibraryItemsGet - Get Device Library Items${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request gets all library items and their statuses for a specified Device ID</p>\\n<h4 id=\"possible-library-item-status-values\">Possible library item status values</h4>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Value</strong></th>\\n<th><strong>Type</strong></th>\\n<th><strong>Additional Info</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>AVAILABLE</td>\\n<td>string</td>\\n<td>Library item available in Self Service</td>\\n</tr>\\n<tr>\\n<td>CACHED</td>\\n<td>string</td>\\n<td>Library item downloaded for install but not yet installed</td>\\n</tr>\\n<tr>\\n<td>CHANGE_PENDING</td>\\n<td>string</td>\\n<td>Recovery Password library item has changes that have not yet been applied</td>\\n</tr>\\n<tr>\\n<td>DOWNLOADING</td>\\n<td>string</td>\\n<td>Library item downloading</td>\\n</tr>\\n<tr>\\n<td>ERROR</td>\\n<td>string</td>\\n<td>Audit failure</td>\\n</tr>\\n<tr>\\n<td>EXCLUDED</td>\\n<td>string</td>\\n<td>Not in scope for assignment rule</td>\\n</tr>\\n<tr>\\n<td>INCOMPATIBLE</td>\\n<td>string</td>\\n<td>Not compatible with device or OS version</td>\\n</tr>\\n<tr>\\n<td>INSTALLING</td>\\n<td>string</td>\\n<td>Library item installing</td>\\n</tr>\\n<tr>\\n<td>PASS</td>\\n<td>string</td>\\n<td>Device meets requirements</td>\\n</tr>\\n<tr>\\n<td>PENDING</td>\\n<td>string</td>\\n<td>Waiting on device, not yet installed (All library items except for config profiles)</td>\\n</tr>\\n<tr>\\n<td>failed</td>\\n<td>string</td>\\n<td>Configuration profile failed to install</td>\\n</tr>\\n<tr>\\n<td>pending</td>\\n<td>string</td>\\n<td>Waiting on device, Configuration profile not yet installed</td>\\n</tr>\\n<tr>\\n<td>success</td>\\n<td>string</td>\\n<td>Configuration profile installed</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;edr status${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesGet - Get Device Notes${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request gets all notes for the specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get All Device Notes${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdDelete operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdDelete - Delete Device Note${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request deletes a specified note (Note ID) for the specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'note_id' ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Delete Device Note${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdGet - Retrieve Device Note${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request retrieves a specified note (Note ID) for the specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'note_id' ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Retrieve Device Note${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesNoteIdPatch operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesNoteIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesNoteIdPatch - Update Device Note${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request patches a specified note (Note ID) for the specified Device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}Authorization${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: Authorization:value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}Content-Type${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: Content-Type:value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'note_id' ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Update Device Note${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdNotesPost operation
#
##############################################################################
print_apiV1DevicesDeviceIdNotesPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdNotesPost - Create Device Note${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request creates a note for the specified device ID.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Create Device Note${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdParametersGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdParametersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdParametersGet - Get Device Parameters${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the parameters and their statuses for a specified Device ID</p>\\n<p>This endpoint is only applicable to macOS clients.</p>\\n<p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=\"https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations\">https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>\\n<p><strong>Possible parameter status values</strong></p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Value</strong></th>\\n<th><strong>Type</strong></th>\\n<th><strong>Additional Info</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>ERROR</td>\\n<td>string</td>\\n<td>Audit failure</td>\\n</tr>\\n<tr>\\n<td>INCOMPATIBLE</td>\\n<td>string</td>\\n<td>Not compatible with device or OS version</td>\\n</tr>\\n<tr>\\n<td>PASS</td>\\n<td>string</td>\\n<td>Device meets requirements</td>\\n</tr>\\n<tr>\\n<td>PENDING</td>\\n<td>string</td>\\n<td>Waiting on device. Not yet run.</td>\\n</tr>\\n<tr>\\n<td>REMEDIATED</td>\\n<td>string</td>\\n<td>Parameter remediated</td>\\n</tr>\\n<tr>\\n<td>WARNING</td>\\n<td>string</td>\\n<td>Muted alert</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get Device Parameters${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdPatch operation
#
##############################################################################
print_apiV1DevicesDeviceIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdPatch - Update Device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update device information, such as the assigned blueprint, user, Asset Tag, and Tags. It is not required to use all attributes in a given request. For example if you only want to update the assigned blueprint, you only need to pass the <code>blueprint_id</code> in the request payload.</p>\\n<p><strong>NOTE</strong>: With the introduction of a UUID value for user ID in the <a href=\"https://api-docs.kandji.io/#b107eb0a-b586-414f-bc4c-3d2b304cfd5f\">Users API</a>, the Device PATCH endpoint will support both the depricated user ID integer value and the new user ID UUID value when updating the user assignment for a device. The ability to update user assignment via the integer ID value will be removed starting January 2025.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n<h3 id=\"additional-information\">Additional information</h3>\\n<p>User ID can be found using the <code>list users</code> API</p>\\n<p>A Blueprint ID can be found using the <code>list blueprints</code> API or in the URL path while on a Blueprint overview page.</p>\\n<p>For example, for this URL <a href=\"https://subdomain.kandji.io/blueprints/6391086e-85a1-4820-813c-f9c75025fff4\">https://subdomain.kandji.io/blueprints/6391086e-85a1-4820-813c-f9c75025fff4</a></p>\\n<p>The Blueprint ID would be <code>6391086e-85a1-4820-813c-f9c75025fff4</code></p>\\n<p>An example script that leverages this API can be found in the <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools/update-device-record\">Kandji Support GitHub</a></p>\\n<h4 id=\"clearing-the-device-asset-tag\">Clearing the device asset tag</h4>\\n<p>To clear a device asset tag, set the <code>asset_tag</code> value to <code>null</code> in the JSON payload.</p>\\n<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{\\n    \"asset_tag\": null\\n}\\n\\n</code></pre>\\n<h4 id=\"clearing-the-assigned-user-attribute\">Clearing the assigned user attribute</h4>\\n<p>To clear the assigned user for a given device, set the <code>user</code> value to <code>null</code> in the JSON payload.</p>\\n<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{\\n    \"user\": null\\n}\\n\\n</code></pre>\\n<h4 id=\"clearing-all-tags\">Clearing all tags</h4>\\n<p>To clear the assigned tags for a given device, set the <code>tags</code> value to an empty list <code>[]</code> in the JSON payload.</p>\\n<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">{\\n    \"tags\": []\\n}\\n\\n</code></pre>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Clear all tags${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsBypasscodeGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsBypasscodeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsBypasscodeGet - Get Activation Lock Bypass Code${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the Activation Lock Bypass code.</p>\\n<p>user_based_albc is the user-based Activation Lock bypass code for when Activation Lock is enabled using an personal Apple ID and Find My.</p>\\n<p>device_based_albc is the device-based Activation Lock bypass code for when Activation Lock is enabled by the MDM server.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsFilevaultkeyGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsFilevaultkeyGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsFilevaultkeyGet - Get FileVault Recovery Key${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the FileVault Recovery key for a macOS device.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsRecoverypasswordGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsRecoverypasswordGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsRecoverypasswordGet - Get Recovery Lock Password${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the Recovery Lock password for a Mac with an Apple Silicon processor and the legacy EFI firmware password for a Mac with an Intel processor.</p>\\n<p>For more details on setting and managing Recovery passwords, see this <a href=\"https://support.kandji.io/support/solutions/articles/72000560472-configure-the-recovery-password-library-item\">Kandji support article</a>.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdSecretsUnlockpinGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdSecretsUnlockpinGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdSecretsUnlockpinGet - Get Unlock Pin${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the device unlock pin for a macOS device.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1DevicesDeviceIdStatusGet operation
#
##############################################################################
print_apiV1DevicesDeviceIdStatusGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1DevicesDeviceIdStatusGet - Get Device Status${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the full status (parameters and library items) for a specified Device ID.</p>\\n<p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=\"https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations\">https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>\\n<h4 id=\"possible-status-values\">Possible status values</h4>\\n<p><strong>Library items</strong></p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Value</strong></th>\\n<th><strong>Type</strong></th>\\n<th><strong>Additional Info</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>AVAILABLE</td>\\n<td>string</td>\\n<td>Library item available in Self Service</td>\\n</tr>\\n<tr>\\n<td>ERROR</td>\\n<td>string</td>\\n<td>Audit failure</td>\\n</tr>\\n<tr>\\n<td>EXCLUDED</td>\\n<td>string</td>\\n<td>Not in scope for assignment rule</td>\\n</tr>\\n<tr>\\n<td>INCOMPATIBLE</td>\\n<td>string</td>\\n<td>Not compatible with device or OS version</td>\\n</tr>\\n<tr>\\n<td>PASS</td>\\n<td>string</td>\\n<td>Device meets requirements</td>\\n</tr>\\n<tr>\\n<td>PENDING</td>\\n<td>string</td>\\n<td>Waiting on device, not yet installed (All library items except for config profiles)</td>\\n</tr>\\n<tr>\\n<td>failed</td>\\n<td>string</td>\\n<td>Configuration profile failed to install</td>\\n</tr>\\n<tr>\\n<td>pending</td>\\n<td>string</td>\\n<td>Waiting on device, Configuration profile not yet installed</td>\\n</tr>\\n<tr>\\n<td>success</td>\\n<td>string</td>\\n<td>Configuration profile installed</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><p><strong>Parameters</strong></p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th><strong>Value</strong></th>\\n<th><strong>Type</strong></th>\\n<th><strong>Additional Info</strong></th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>ERROR</td>\\n<td>string</td>\\n<td>Audit failure</td>\\n</tr>\\n<tr>\\n<td>INCOMPATIBLE</td>\\n<td>string</td>\\n<td>Not compatible with device or OS version</td>\\n</tr>\\n<tr>\\n<td>PASS</td>\\n<td>string</td>\\n<td>Device meets requirements</td>\\n</tr>\\n<tr>\\n<td>PENDING</td>\\n<td>string</td>\\n<td>Waiting on device. Not yet run.</td>\\n</tr>\\n<tr>\\n<td>REMEDIATED</td>\\n<td>string</td>\\n<td>Parameter remediated</td>\\n</tr>\\n<tr>\\n<td>WARNING</td>\\n<td>string</td>\\n<td>Muted alert</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get Device Status${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1Deviceslimit300Get operation
#
##############################################################################
print_apiV1Deviceslimit300Get_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1Deviceslimit300Get - List Devices${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices in a Kandji tenant. Optionally. query parameters can be used to filter results.</p>\\n<p>There is a hard upper limit of 300 results per request. To return addtional results pagination must be used. Pagination examples can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools/code-examples\">GitHub</a>.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;List iPad only${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdDelete operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdDelete - Delete ADE integration${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=\"warning\"><strong>WARNING!</strong></h1>\\n<p>This is a HIGHLY destructive action.</p>\\n<p>Deleting an ADE token will unassign the associated device records from Kandji. For currently enrolled devices that were assigned to Kandji via the delete ADE integration will not be impacted until they are wiped and reprovisioned. This action is essentially the same as removing an ADE token from MDM and then adding it back.</p>\\n<p>If applicable, be sure to reassign the device records in ABM.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'ade_token_id' ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Delete integration${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet - List devices associated to ADE token${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices associated with a specified <code>ade_token_id</code> as well as their enrollment status.</p>\\n<p>When the <code>mdm_device</code> key value is <code>null</code>, this can be taken as an indication that the device is awaiting enrollment into Kandji.</p>\\n<p>When data is present within the mdm_device dictionary, you can reference the <code>device_id</code> as the ID of the enrolled device record.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'ade_token_id' ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;List associated devices - null mdm_device${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdGet - Get ADE integration${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a specific ADE integration based on the <code>ade_token_id</code> passed.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'ade_token_id' ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get integration${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdPatch operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdPatch - Update ADE integration${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will update the default blueprint, phone number, and email address in an existing ADE integration.</p>\\n<p>The default <code>blueprint_id</code>, <code>phone</code> number, and <code>email</code> address must be sent in the request.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'ade_token_id' ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Update integration${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeAdeTokenIdRenewPost operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeAdeTokenIdRenewPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeAdeTokenIdRenewPost - Renew ADE integration${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will renew an existing ADE integration.</p>\\n<p>The default <code>blueprint_id</code>, <code>phone</code> number, <code>email</code> address, and MDM server token <code>file</code> from the associated MDM server in ABM are required and must be sent in the request.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'ade_token_id' ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Renew integration${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesDeviceIdGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesDeviceIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesDeviceIdGet - Get ADE device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get information about a specific Automated Device Enrollment device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesDeviceIdPatch operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesDeviceIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesDeviceIdPatch - Update ADE device${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update a specific Automated Device Enrollment device's blueprint assignment, user assignment, and asset tag.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'device_id' ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Update user assignment${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeDevicesGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeDevicesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeDevicesGet - List ADE devices${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get a list of Automated Device Enrollment devices.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Invalid UUID${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdeGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdeGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdeGet - List ADE integrations${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of configured ADE integrations.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;List integrations${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdePost operation
#
##############################################################################
print_apiV1IntegrationsAppleAdePost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdePost - Create ADE integration${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request will create a new ADE integration.</p>\\n<p>The default <code>blueprint_id</code>, <code>phone</code> number, <code>email</code> address, and MDM server token <code>file</code> downloaded from ABM are required and must be sent in the request.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Create integration${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1IntegrationsAppleAdePublicKeyGet operation
#
##############################################################################
print_apiV1IntegrationsAppleAdePublicKeyGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1IntegrationsAppleAdePublicKeyGet - Download ADE public key${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the public key used to create an MDM server connection in Apple Business Manager.</p>\\n<p>The encoded information needs to be saved to a file with the <code>.pem</code> format and then uploaded to ABM.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Download public key${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsGet operation
#
##############################################################################
print_apiV1LibraryCustomAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsGet - List Custom Apps${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom apps from the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdDelete - Delete Custom App${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>\\n<p>This endpoint sends a request to delete a specific custom app from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;requested library item not found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdGet - Get Custom App${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom app from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomAppsLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsLibraryItemIdPatch - Update Custom App${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom app in the Kandji library.</p>\\n<p>Must have already generated a <code>file_key</code> via <code>Create custom app</code> endpoint and uploaded the file to S3 using a request similar to the <code>Upload to S3</code> example.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsPost operation
#
##############################################################################
print_apiV1LibraryCustomAppsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsPost - Create Custom App${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom app in the Kandji library.</p>\\n<p>Must have already generated a <code>file_key</code> via <code>Create custom app</code> endpoint and uploaded the file to S3 using a request similar to the <code>Upload to S3</code> example.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomAppsUploadPost operation
#
##############################################################################
print_apiV1LibraryCustomAppsUploadPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomAppsUploadPost - Upload Custom App${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request retrieves the S3 upload details need for uploading the app to Amazon S3.</p>\\n<p>Creates a pre-signed <code>post_url</code> to upload a new Custom App to S3.</p>\\n<p>The provided <code>name</code> will be used to calculate a unique <code>file_key</code> in S3.</p>\\n<p>A separate request will have to be made to the <code>Upload to S3</code> endpoint to upload the file to S3 directly using the <code>post_url</code> and <code>post_data</code> from the <code>Upload Custom App</code> response.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success - create s3 upload${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesGet operation
#
##############################################################################
print_apiV1LibraryCustomProfilesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesGet - List Custom Profiles${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom profiles from the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdDelete - Delete Custom Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>\\n<p>This endpoint sends a request to delete a specific custom profile from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;requested library item not found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdGet - Get Custom Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom app from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomProfilesLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesLibraryItemIdPatch - Update Custom Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom profile in the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomProfilesPost operation
#
##############################################################################
print_apiV1LibraryCustomProfilesPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomProfilesPost - Create Custom Profile${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom profile in the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsGet operation
#
##############################################################################
print_apiV1LibraryCustomScriptsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsGet - List Custom Scripts${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of custom scripts from the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdDelete operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdDelete - Delete Custom Script${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>\\n<p>This endpoint sends a request to delete a specific custom scripts from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;requested library item not found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdGet operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdGet - Get Custom Script${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom script from the Kandji library.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsLibraryItemIdPatch operation
#
##############################################################################
print_apiV1LibraryCustomScriptsLibraryItemIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsLibraryItemIdPatch - Update Custom Script${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom script in the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success - zsh example${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryCustomScriptsPost operation
#
##############################################################################
print_apiV1LibraryCustomScriptsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryCustomScriptsPost - Create Custom Script${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to create a custom script in the Kandji library.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryLibraryItemsLibraryItemIdActivityGet operation
#
##############################################################################
print_apiV1LibraryLibraryItemsLibraryItemIdActivityGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryLibraryItemsLibraryItemIdActivityGet - Get Library Item Activity${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the activity related to a specific library item. Activity is listed from newest to oldest.</p>\\n<p>To see a delta of the activity events between now and the last request, you can store the newest entry from the previous request and then look for that entry in the next request. Any entry post that will be the delta.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1LibraryLibraryItemsLibraryItemIdStatusGet operation
#
##############################################################################
print_apiV1LibraryLibraryItemsLibraryItemIdStatusGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1LibraryLibraryItemsLibraryItemIdStatusGet - Get Library Item Statuses${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the statuses related to a specific library item.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'library_item_id' ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;edr status${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismActivationLockGet operation
#
##############################################################################
print_apiV1PrismActivationLockGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismActivationLockGet - Activation lock${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get activation lock attributes for devices.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismApplicationFirewallGet operation
#
##############################################################################
print_apiV1PrismApplicationFirewallGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismApplicationFirewallGet - Application firewall${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Application Firewall details for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismAppsGet operation
#
##############################################################################
print_apiV1PrismAppsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismAppsGet - Applications${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get the applications installed on macOS, iOS, iPadOS, and tvOS devices.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismCertificatesGet operation
#
##############################################################################
print_apiV1PrismCertificatesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismCertificatesGet - Certificates${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get certificate details.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismCountcategoryappsGet operation
#
##############################################################################
print_apiV1PrismCountcategoryappsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismCountcategoryappsGet - Count${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get the total record count for the specified Prism category.</p>\\n<p>If a category contains spaces substitute the spaces for underscores (\"_\") when using the API query.</p>\\n<p>Example: <code>Device information</code> becomes <code>device_information</code>.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismDesktopAndScreensaverGet operation
#
##############################################################################
print_apiV1PrismDesktopAndScreensaverGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismDesktopAndScreensaverGet - Desktop and Screensaver${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Desktop and Screensaver details for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismDeviceInformationGet operation
#
##############################################################################
print_apiV1PrismDeviceInformationGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismDeviceInformationGet - Device information${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get attributes about devices.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Get devices in a blueprint sorted by serial number${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismExportExportIdGet operation
#
##############################################################################
print_apiV1PrismExportExportIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismExportExportIdGet - Get category export${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get an export request's status. To download the export, use the <code>signed_url</code>. This will download a CSV file containing the exported category information.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p>export_id (path parameter): The unique identifier of the the export job.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}export_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'export_id' ${YELLOW}Specify as: export_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Example export status check${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismExportPost operation
#
##############################################################################
print_apiV1PrismExportPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismExportPost - Request category export${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Request export of a category. The <code>id</code> key is used when checking the export status using the <em>Request category export</em> endpoint.</p>\\n<p><strong>Request Body Parameters: application/json</strong></p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Key</th>\\n<th>Type</th>\\n<th>Possible value(s)</th>\\n<th>Description</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td><code>blueprint_ids</code></td>\\n<td><code>array</code></td>\\n<td><code>[\"string\", \"string\", \"string\"]</code></td>\\n<td>List of one or more comma separate blueprint IDs.</td>\\n</tr>\\n<tr>\\n<td><code>category</code></td>\\n<td><code>string</code></td>\\n<td><code>apps</code> ,  <br /><code>activation_lock</code> ,  <br /><code>desktop_and_screensaver</code> ,  <br /><code>device_information</code> ,  <br /><code>gatekeeper_and_xprotect</code> ,  <br /><code>installed_profiles</code> ,  <br /><code>kernel_extensions</code> ,  <br /><code>local_users</code> ,  <br /><code>launch_agents_and_daemons</code> ,  <br /><code>system_extensions</code> ,  <br /><code>startup_settings</code> ,  <br /><code>transparency_database</code></td>\\n<td>Only one category per export reqest.</td>\\n</tr>\\n<tr>\\n<td><code>device_families</code></td>\\n<td><code>array</code></td>\\n<td><code>[\"Mac\", \"iPhone\", \"iPad\", \"tvOS\"]</code></td>\\n<td>List of one or more comma separted string values for device families.</td>\\n</tr>\\n<tr>\\n<td><code>filter</code></td>\\n<td><code>object</code></td>\\n<td><code>{\"apple_silicon\": {\"eq\": true}, \"device__name\": {\"like\": [\"this\", \"or_this\"]}}</code></td>\\n<td>JSON schema object containing one or more key value pairs.  <br />  <br /><strong>Note</strong>: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</td>\\n</tr>\\n<tr>\\n<td><code>sort_by</code></td>\\n<td><code>string</code></td>\\n<td></td>\\n<td>Sort results by the name of a given response body key in either ascending (default behavior) or descending('-') order.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Bad category request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismFilevaultGet operation
#
##############################################################################
print_apiV1PrismFilevaultGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismFilevaultGet - FileVault${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get FileVault information for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismGatekeeperAndXprotectGet operation
#
##############################################################################
print_apiV1PrismGatekeeperAndXprotectGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismGatekeeperAndXprotectGet - Gatekeeper and XProtect${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Gatekeeper and XProtect attributes for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismInstalledProfilesGet operation
#
##############################################################################
print_apiV1PrismInstalledProfilesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismInstalledProfilesGet - Installed profiles${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Installed Profiles attributes for macOS, iOS, iPadOS, and tvOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismKernelExtensionsGet operation
#
##############################################################################
print_apiV1PrismKernelExtensionsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismKernelExtensionsGet - Kernel Extensions${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Kernel Extension attributes for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success - no kernel extensions${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismLaunchAgentsAndDaemonsGet operation
#
##############################################################################
print_apiV1PrismLaunchAgentsAndDaemonsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismLaunchAgentsAndDaemonsGet - Launch Agents and Daemons${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Launch Agents and Daemons installed on macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismLocalUsersGet operation
#
##############################################################################
print_apiV1PrismLocalUsersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismLocalUsersGet - Local users${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Local Users detials for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismStartupSettingsGet operation
#
##############################################################################
print_apiV1PrismStartupSettingsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismStartupSettingsGet - Startup settings${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Startup settings for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Startup settings${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismSystemExtensionsGet operation
#
##############################################################################
print_apiV1PrismSystemExtensionsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismSystemExtensionsGet - System Extensions${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get System Extension attributes for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;System Extensions${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1PrismTransparencyDatabaseGet operation
#
##############################################################################
print_apiV1PrismTransparencyDatabaseGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1PrismTransparencyDatabaseGet - Transparency database${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get Transparency Database (TCC) attributes for macOS.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Transparency database${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1SelfServiceCategoriesGet operation
#
##############################################################################
print_apiV1SelfServiceCategoriesGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1SelfServiceCategoriesGet - List Self Service Categories${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves a list of self-service categories and their associated IDs.</p>\\n<p>If you are planning to make a Library item available in Self Service under a specific category, you can call this endpoint to get the category ID and then use that ID when creating or updating the library item via the Kandji API.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1SettingsLicensingGet operation
#
##############################################################################
print_apiV1SettingsLicensingGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1SettingsLicensingGet - Licensing${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Returns Kandji tenant licensing and utilization information.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1TagsPost operation
#
##############################################################################
print_apiV1TagsPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsPost - Create Tag${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Create a tag. Can only create one tag per request.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1TagsTagIdDelete operation
#
##############################################################################
print_apiV1TagsTagIdDelete_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsTagIdDelete - Delete Tag${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Delete a tag.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'tag_id' ${YELLOW}Specify as: tag_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1TagsTagIdPatch operation
#
##############################################################################
print_apiV1TagsTagIdPatch_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagsTagIdPatch - Update Tag${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update tag name.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'tag_id' ${YELLOW}Specify as: tag_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1TagssearchaccuhiveGet operation
#
##############################################################################
print_apiV1TagssearchaccuhiveGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1TagssearchaccuhiveGet - Get Tags${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Return configured tags.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1ThreatDetailsGet operation
#
##############################################################################
print_apiV1ThreatDetailsGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1ThreatDetailsGet - Get Threat Details${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get threat details.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;using term param${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1UsersGet operation
#
##############################################################################
print_apiV1UsersGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1UsersGet - List Users${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of users from user directory integrations.</p>\\n<p>A maximum of 300 records are returned per request, and pagination can be performed leveraging the URLs provided in the <code>next</code> and <code>previous</code> keys in the response. If there are no more results available, the respective key will be <code>null</code>.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for apiV1UsersUserIdGet operation
#
##############################################################################
print_apiV1UsersUserIdGet_help() {
    echo ""
    echo -e "${BOLD}${WHITE}apiV1UsersUserIdGet - Get User${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a specified user directory integration user by id.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p>user_id (path parameter): The unique identifier of the user directory integration user.</p>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'user_id' ${YELLOW}Specify as: user_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postUrlPost operation
#
##############################################################################
print_postUrlPost_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postUrlPost - Upload to S3${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Example showing separate post request to upload the file to Amazon S3.</p>\\n<h3 id=\"request-parameters\">Request Parameters</h3>\\n<p><code>post_url</code> (path parameter): The <code>post_url</code> value from the <code>Upload custom app</code> response.</p>\\n<h3 id=\"request-body\">Request Body</h3>\\n<p>For the request body, use the contents of the <code>post_data</code> object in the <code>Upload Custom App</code> endpoint response (example response below) and supply the path to the custom app file in the <code>file</code> request parameter.</p>\\n<h4 id=\"example-post_data-object\">Example post_data object</h4>\\n<pre class=\"click-to-expand-wrapper is-snippet-wrapper\"><code class=\"language-json\">\"post_data\": {\\n   \"key\": \"(field to post along with file to S3 -- the key for the uploaded file)\",\\n   \"x-amz-algorithm\": \"(field to post along with file to S3)\",\\n   \"x-amz-credential\": \"(field to post along with file to S3)\",\\n   \"x-amz-date\": \"(field to post along with file to S3)\",\\n   \"x-amz-security-token\": \"(field to post along with file to S3)\",\\n   \"policy\": \"(field to post along with file to S3)\",\\n   \"x-amz-signature\": \"(field to post along with file to S3)\",\\n}\\n\\n</code></pre>\\n" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}post_url${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Path parameter 'post_url' ${YELLOW}Specify as: post_url=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;success${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
# Call apiV1DevicesDeviceIdActivitylimit300Get operation
#
##############################################################################
call_apiV1DevicesDeviceIdActivitylimit300Get() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/activity?limit=300" path_parameter_names query_parameter_names); then
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
    local query_parameter_names=()
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
# Call apiV1DevicesDeviceIdCommandslimit300Get operation
#
##############################################################################
call_apiV1DevicesDeviceIdCommandslimit300Get() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(device_id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/v1/devices/{device_id}/commands?limit=300" path_parameter_names query_parameter_names); then
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
# Call apiV1Deviceslimit300Get operation
#
##############################################################################
call_apiV1Deviceslimit300Get() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/v1/devices?limit=300" path_parameter_names query_parameter_names); then
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
# Call apiV1PrismCountcategoryappsGet operation
#
##############################################################################
call_apiV1PrismCountcategoryappsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/v1/prism/count?category=apps" path_parameter_names query_parameter_names); then
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
# Call apiV1TagsPost operation
#
##############################################################################
call_apiV1TagsPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    if [[ "$print_curl" = true ]]; then
        echo "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl -d '' ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call apiV1TagssearchaccuhiveGet operation
#
##############################################################################
call_apiV1TagssearchaccuhiveGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/v1/tags?search=accuhive" path_parameter_names query_parameter_names); then
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
# Call apiV1ThreatDetailsGet operation
#
##############################################################################
call_apiV1ThreatDetailsGet() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
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
    local query_parameter_names=()
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
    local query_parameter_names=()
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
# Call postUrlPost operation
#
##############################################################################
call_postUrlPost() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(post_url)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/{post_url}" path_parameter_names query_parameter_names); then
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
    apiV1DevicesDeviceIdActivitylimit300Get)
    operation="apiV1DevicesDeviceIdActivitylimit300Get"
    ;;
    apiV1DevicesDeviceIdAppsGet)
    operation="apiV1DevicesDeviceIdAppsGet"
    ;;
    apiV1DevicesDeviceIdCommandslimit300Get)
    operation="apiV1DevicesDeviceIdCommandslimit300Get"
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
    apiV1Deviceslimit300Get)
    operation="apiV1Deviceslimit300Get"
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
    apiV1PrismCountcategoryappsGet)
    operation="apiV1PrismCountcategoryappsGet"
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
    apiV1TagsPost)
    operation="apiV1TagsPost"
    ;;
    apiV1TagsTagIdDelete)
    operation="apiV1TagsTagIdDelete"
    ;;
    apiV1TagsTagIdPatch)
    operation="apiV1TagsTagIdPatch"
    ;;
    apiV1TagssearchaccuhiveGet)
    operation="apiV1TagssearchaccuhiveGet"
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
    postUrlPost)
    operation="postUrlPost"
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
    apiV1DevicesDeviceIdActivitylimit300Get)
    call_apiV1DevicesDeviceIdActivitylimit300Get
    ;;
    apiV1DevicesDeviceIdAppsGet)
    call_apiV1DevicesDeviceIdAppsGet
    ;;
    apiV1DevicesDeviceIdCommandslimit300Get)
    call_apiV1DevicesDeviceIdCommandslimit300Get
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
    apiV1Deviceslimit300Get)
    call_apiV1Deviceslimit300Get
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
    apiV1PrismCountcategoryappsGet)
    call_apiV1PrismCountcategoryappsGet
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
    apiV1TagsPost)
    call_apiV1TagsPost
    ;;
    apiV1TagsTagIdDelete)
    call_apiV1TagsTagIdDelete
    ;;
    apiV1TagsTagIdPatch)
    call_apiV1TagsTagIdPatch
    ;;
    apiV1TagssearchaccuhiveGet)
    call_apiV1TagssearchaccuhiveGet
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
    postUrlPost)
    call_postUrlPost
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
