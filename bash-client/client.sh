#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Generator version: 7.9.0
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for Kandji API.
#
# LICENSE:
# 
#
# CONTACT:
# mitchelsblake@gmail.com
#
# MORE INFORMATION:
# https://api-docs.kandji.io
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
operation_parameters_minimum_occurrences["createAdeIntegration:::blueprint_id"]=1
operation_parameters_minimum_occurrences["createAdeIntegration:::email"]=1
operation_parameters_minimum_occurrences["createAdeIntegration:::file"]=1
operation_parameters_minimum_occurrences["createAdeIntegration:::phone"]=1
operation_parameters_minimum_occurrences["deleteAdeIntegration:::ade_token_id"]=1
operation_parameters_minimum_occurrences["getAdeDevice:::device_id"]=1
operation_parameters_minimum_occurrences["getAdeIntegration:::ade_token_id"]=1
operation_parameters_minimum_occurrences["listAdeDevices:::blueprint_id"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::user_id"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::dep_account"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::device_family"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::model"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::os"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::profile_status"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::serial_number"]=0
operation_parameters_minimum_occurrences["listAdeDevices:::page"]=0
operation_parameters_minimum_occurrences["listDevicesAssociatedToAdeToken:::ade_token_id"]=1
operation_parameters_minimum_occurrences["listDevicesAssociatedToAdeToken:::page"]=0
operation_parameters_minimum_occurrences["renewAdeIntegration:::ade_token_id"]=1
operation_parameters_minimum_occurrences["renewAdeIntegration:::blueprint_id"]=1
operation_parameters_minimum_occurrences["renewAdeIntegration:::email"]=1
operation_parameters_minimum_occurrences["renewAdeIntegration:::file"]=1
operation_parameters_minimum_occurrences["renewAdeIntegration:::phone"]=1
operation_parameters_minimum_occurrences["updateAdeDevice:::device_id"]=1
operation_parameters_minimum_occurrences["updateAdeDevice:::body"]=0
operation_parameters_minimum_occurrences["updateAdeIntegration:::ade_token_id"]=1
operation_parameters_minimum_occurrences["updateAdeIntegration:::body"]=0
operation_parameters_minimum_occurrences["assignLibraryItem:::blueprint_id"]=1
operation_parameters_minimum_occurrences["assignLibraryItem:::body"]=0
operation_parameters_minimum_occurrences["createBlueprint:::enrollment_code.code"]=1
operation_parameters_minimum_occurrences["createBlueprint:::enrollment_code.is_active"]=1
operation_parameters_minimum_occurrences["createBlueprint:::name"]=1
operation_parameters_minimum_occurrences["createBlueprint:::source.id"]=1
operation_parameters_minimum_occurrences["createBlueprint:::source.type"]=1
operation_parameters_minimum_occurrences["createBlueprint:::type"]=1
operation_parameters_minimum_occurrences["deleteBlueprint:::blueprint_id"]=1
operation_parameters_minimum_occurrences["getBlueprint:::blueprint_id"]=1
operation_parameters_minimum_occurrences["getBlueprintTemplates:::limit"]=0
operation_parameters_minimum_occurrences["getBlueprintTemplates:::offset"]=0
operation_parameters_minimum_occurrences["getManualEnrollmentProfile:::blueprint_id"]=1
operation_parameters_minimum_occurrences["getManualEnrollmentProfile:::sso"]=0
operation_parameters_minimum_occurrences["listBlueprints:::id"]=0
operation_parameters_minimum_occurrences["listBlueprints:::id__in"]=0
operation_parameters_minimum_occurrences["listBlueprints:::name"]=0
operation_parameters_minimum_occurrences["listBlueprints:::limit"]=0
operation_parameters_minimum_occurrences["listBlueprints:::offset"]=0
operation_parameters_minimum_occurrences["listLibraryItems:::blueprint_id"]=1
operation_parameters_minimum_occurrences["removeLibraryItem:::blueprint_id"]=1
operation_parameters_minimum_occurrences["removeLibraryItem:::body"]=0
operation_parameters_minimum_occurrences["updateBlueprint:::blueprint_id"]=1
operation_parameters_minimum_occurrences["updateBlueprint:::description"]=1
operation_parameters_minimum_occurrences["updateBlueprint:::enrollment_code.code"]=1
operation_parameters_minimum_occurrences["updateBlueprint:::enrollment_code.is_active"]=1
operation_parameters_minimum_occurrences["updateBlueprint:::name"]=1
operation_parameters_minimum_occurrences["createCustomApp:::file_key"]=1
operation_parameters_minimum_occurrences["createCustomApp:::install_enforcement"]=1
operation_parameters_minimum_occurrences["createCustomApp:::install_type"]=1
operation_parameters_minimum_occurrences["createCustomApp:::name"]=1
operation_parameters_minimum_occurrences["createCustomApp:::self_service_category_id"]=1
operation_parameters_minimum_occurrences["createCustomApp:::self_service_recommended"]=1
operation_parameters_minimum_occurrences["createCustomApp:::show_in_self_service"]=1
operation_parameters_minimum_occurrences["deleteCustomApp:::library_item_id"]=1
operation_parameters_minimum_occurrences["getCustomApp:::library_item_id"]=1
operation_parameters_minimum_occurrences["listCustomApps:::page"]=0
operation_parameters_minimum_occurrences["updateCustomApp:::library_item_id"]=1
operation_parameters_minimum_occurrences["updateCustomApp:::active"]=1
operation_parameters_minimum_occurrences["updateCustomApp:::name"]=1
operation_parameters_minimum_occurrences["uploadCustomApp:::body"]=0
operation_parameters_minimum_occurrences["createCustomProfile:::active"]=1
operation_parameters_minimum_occurrences["createCustomProfile:::file"]=1
operation_parameters_minimum_occurrences["createCustomProfile:::name"]=1
operation_parameters_minimum_occurrences["deleteCustomProfile:::library_item_id"]=1
operation_parameters_minimum_occurrences["getCustomProfile:::library_item_id"]=1
operation_parameters_minimum_occurrences["listCustomProfiles:::page"]=0
operation_parameters_minimum_occurrences["updateCustomProfile:::library_item_id"]=1
operation_parameters_minimum_occurrences["createCustomScript:::body"]=0
operation_parameters_minimum_occurrences["deleteCustomScript:::library_item_id"]=1
operation_parameters_minimum_occurrences["getCustomScript:::library_item_id"]=1
operation_parameters_minimum_occurrences["listCustomScripts:::page"]=0
operation_parameters_minimum_occurrences["updateCustomScript:::library_item_id"]=1
operation_parameters_minimum_occurrences["updateCustomScript:::body"]=0
operation_parameters_minimum_occurrences["clearPasscode:::device_id"]=1
operation_parameters_minimum_occurrences["deleteDevice:::device_id"]=1
operation_parameters_minimum_occurrences["deleteUser:::device_id"]=1
operation_parameters_minimum_occurrences["deleteUser:::body"]=0
operation_parameters_minimum_occurrences["eraseDevice:::device_id"]=1
operation_parameters_minimum_occurrences["eraseDevice:::body"]=0
operation_parameters_minimum_occurrences["getDeviceCommands:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceCommands:::limit"]=1
operation_parameters_minimum_occurrences["getDeviceCommands:::offset"]=0
operation_parameters_minimum_occurrences["lockDevice:::device_id"]=1
operation_parameters_minimum_occurrences["lockDevice:::body"]=0
operation_parameters_minimum_occurrences["reinstallAgent:::device_id"]=1
operation_parameters_minimum_occurrences["remoteDesktop:::device_id"]=1
operation_parameters_minimum_occurrences["remoteDesktop:::body"]=0
operation_parameters_minimum_occurrences["renewMdmProfile:::device_id"]=1
operation_parameters_minimum_occurrences["restartDevice:::device_id"]=1
operation_parameters_minimum_occurrences["restartDevice:::body"]=0
operation_parameters_minimum_occurrences["sendBlankpush:::device_id"]=1
operation_parameters_minimum_occurrences["setName:::device_id"]=1
operation_parameters_minimum_occurrences["setName:::body"]=0
operation_parameters_minimum_occurrences["shutdown:::device_id"]=1
operation_parameters_minimum_occurrences["unlockAccount:::device_id"]=1
operation_parameters_minimum_occurrences["unlockAccount:::body"]=0
operation_parameters_minimum_occurrences["updateInventory:::device_id"]=1
operation_parameters_minimum_occurrences["cancelLostMode:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceActivity:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceActivity:::limit"]=1
operation_parameters_minimum_occurrences["getDeviceActivity:::offset"]=0
operation_parameters_minimum_occurrences["getDeviceApps:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceDetails:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceLibraryItems:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceLostModeDetails:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceParameters:::device_id"]=1
operation_parameters_minimum_occurrences["getDeviceStatus:::device_id"]=1
operation_parameters_minimum_occurrences["listDevices:::limit"]=1
operation_parameters_minimum_occurrences["listDevices:::asset_tag"]=0
operation_parameters_minimum_occurrences["listDevices:::blueprint_id"]=0
operation_parameters_minimum_occurrences["listDevices:::device_id"]=0
operation_parameters_minimum_occurrences["listDevices:::device_name"]=0
operation_parameters_minimum_occurrences["listDevices:::filevault_enabled"]=0
operation_parameters_minimum_occurrences["listDevices:::mac_address"]=0
operation_parameters_minimum_occurrences["listDevices:::model"]=0
operation_parameters_minimum_occurrences["listDevices:::ordering"]=0
operation_parameters_minimum_occurrences["listDevices:::os_version"]=0
operation_parameters_minimum_occurrences["listDevices:::platform"]=0
operation_parameters_minimum_occurrences["listDevices:::serial_number"]=0
operation_parameters_minimum_occurrences["listDevices:::tag_name"]=0
operation_parameters_minimum_occurrences["listDevices:::tag_name_in"]=0
operation_parameters_minimum_occurrences["listDevices:::tag_id"]=0
operation_parameters_minimum_occurrences["listDevices:::tag_id_in"]=0
operation_parameters_minimum_occurrences["listDevices:::user"]=0
operation_parameters_minimum_occurrences["listDevices:::user_email"]=0
operation_parameters_minimum_occurrences["listDevices:::user_id"]=0
operation_parameters_minimum_occurrences["listDevices:::user_name"]=0
operation_parameters_minimum_occurrences["listDevices:::offset"]=0
operation_parameters_minimum_occurrences["getActivationLockBypassCode:::device_id"]=1
operation_parameters_minimum_occurrences["getFilevaultRecoveryKey:::device_id"]=1
operation_parameters_minimum_occurrences["getRecoveryLockPassword:::device_id"]=1
operation_parameters_minimum_occurrences["getUnlockPin:::device_id"]=1
operation_parameters_minimum_occurrences["getLibraryItemActivity:::library_item_id"]=1
operation_parameters_minimum_occurrences["getLibraryItemActivity:::activity_type"]=0
operation_parameters_minimum_occurrences["getLibraryItemActivity:::user_id"]=0
operation_parameters_minimum_occurrences["getLibraryItemActivity:::user_email"]=0
operation_parameters_minimum_occurrences["getLibraryItemActivity:::limit"]=0
operation_parameters_minimum_occurrences["getLibraryItemActivity:::offset"]=0
operation_parameters_minimum_occurrences["getLibraryItemStatuses:::library_item_id"]=1
operation_parameters_minimum_occurrences["getLibraryItemStatuses:::computer_id"]=0
operation_parameters_minimum_occurrences["getLibraryItemStatuses:::limit"]=0
operation_parameters_minimum_occurrences["getLibraryItemStatuses:::offset"]=0
operation_parameters_minimum_occurrences["disableLostMode:::device_id"]=1
operation_parameters_minimum_occurrences["enableLostMode:::device_id"]=1
operation_parameters_minimum_occurrences["enableLostMode:::body"]=0
operation_parameters_minimum_occurrences["playLostModeSound:::device_id"]=1
operation_parameters_minimum_occurrences["updateLocation:::device_id"]=1
operation_parameters_minimum_occurrences["createDeviceNote:::device_id"]=1
operation_parameters_minimum_occurrences["createDeviceNote:::body"]=0
operation_parameters_minimum_occurrences["deleteDeviceNote:::device_id"]=1
operation_parameters_minimum_occurrences["deleteDeviceNote:::note_id"]=1
operation_parameters_minimum_occurrences["getDeviceNotes:::device_id"]=1
operation_parameters_minimum_occurrences["retrieveDeviceNote:::device_id"]=1
operation_parameters_minimum_occurrences["retrieveDeviceNote:::note_id"]=1
operation_parameters_minimum_occurrences["updateDeviceNote:::device_id"]=1
operation_parameters_minimum_occurrences["updateDeviceNote:::note_id"]=1
operation_parameters_minimum_occurrences["updateDeviceNote:::Authorization"]=1
operation_parameters_minimum_occurrences["updateDeviceNote:::Content-Type"]=1
operation_parameters_minimum_occurrences["updateDeviceNote:::body"]=0
operation_parameters_minimum_occurrences["activationLock:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["activationLock:::device_families"]=0
operation_parameters_minimum_occurrences["activationLock:::filter"]=0
operation_parameters_minimum_occurrences["activationLock:::sort_by"]=0
operation_parameters_minimum_occurrences["activationLock:::limit"]=0
operation_parameters_minimum_occurrences["activationLock:::offset"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::device_families"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::filter"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::sort_by"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::limit"]=0
operation_parameters_minimum_occurrences["applicationFirewall:::offset"]=0
operation_parameters_minimum_occurrences["applications:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["applications:::device_families"]=0
operation_parameters_minimum_occurrences["applications:::filter"]=0
operation_parameters_minimum_occurrences["applications:::sort_by"]=0
operation_parameters_minimum_occurrences["applications:::limit"]=0
operation_parameters_minimum_occurrences["applications:::offset"]=0
operation_parameters_minimum_occurrences["certificates:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["certificates:::device_families"]=0
operation_parameters_minimum_occurrences["certificates:::filter"]=0
operation_parameters_minimum_occurrences["certificates:::sort_by"]=0
operation_parameters_minimum_occurrences["certificates:::limit"]=0
operation_parameters_minimum_occurrences["certificates:::offset"]=0
operation_parameters_minimum_occurrences["count:::category"]=1
operation_parameters_minimum_occurrences["desktopAndScreensaver:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["desktopAndScreensaver:::device_families"]=0
operation_parameters_minimum_occurrences["desktopAndScreensaver:::filter"]=0
operation_parameters_minimum_occurrences["desktopAndScreensaver:::sort_by"]=0
operation_parameters_minimum_occurrences["desktopAndScreensaver:::limit"]=0
operation_parameters_minimum_occurrences["desktopAndScreensaver:::offset"]=0
operation_parameters_minimum_occurrences["deviceInformation:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["deviceInformation:::device_families"]=0
operation_parameters_minimum_occurrences["deviceInformation:::filter"]=0
operation_parameters_minimum_occurrences["deviceInformation:::sort_by"]=0
operation_parameters_minimum_occurrences["deviceInformation:::limit"]=0
operation_parameters_minimum_occurrences["deviceInformation:::offset"]=0
operation_parameters_minimum_occurrences["deviceInformation:::body"]=0
operation_parameters_minimum_occurrences["filevault:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["filevault:::device_families"]=0
operation_parameters_minimum_occurrences["filevault:::filter"]=0
operation_parameters_minimum_occurrences["filevault:::sort_by"]=0
operation_parameters_minimum_occurrences["filevault:::limit"]=0
operation_parameters_minimum_occurrences["filevault:::offset"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::device_families"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::filter"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::sort_by"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::limit"]=0
operation_parameters_minimum_occurrences["gatekeeperAndXprotect:::offset"]=0
operation_parameters_minimum_occurrences["getCategoryExport:::export_id"]=1
operation_parameters_minimum_occurrences["installedProfiles:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["installedProfiles:::device_families"]=0
operation_parameters_minimum_occurrences["installedProfiles:::filter"]=0
operation_parameters_minimum_occurrences["installedProfiles:::sort_by"]=0
operation_parameters_minimum_occurrences["installedProfiles:::limit"]=0
operation_parameters_minimum_occurrences["installedProfiles:::offset"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::device_families"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::filter"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::sort_by"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::limit"]=0
operation_parameters_minimum_occurrences["kernelExtensions:::offset"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::device_families"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::filter"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::sort_by"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::limit"]=0
operation_parameters_minimum_occurrences["launchAgentsAndDaemons:::offset"]=0
operation_parameters_minimum_occurrences["localUsers:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["localUsers:::device_families"]=0
operation_parameters_minimum_occurrences["localUsers:::filter"]=0
operation_parameters_minimum_occurrences["localUsers:::sort_by"]=0
operation_parameters_minimum_occurrences["localUsers:::limit"]=0
operation_parameters_minimum_occurrences["localUsers:::offset"]=0
operation_parameters_minimum_occurrences["requestCategoryExport:::body"]=0
operation_parameters_minimum_occurrences["startupSettings:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["startupSettings:::device_families"]=0
operation_parameters_minimum_occurrences["startupSettings:::filter"]=0
operation_parameters_minimum_occurrences["startupSettings:::sort_by"]=0
operation_parameters_minimum_occurrences["startupSettings:::limit"]=0
operation_parameters_minimum_occurrences["startupSettings:::offset"]=0
operation_parameters_minimum_occurrences["systemExtensions:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["systemExtensions:::device_families"]=0
operation_parameters_minimum_occurrences["systemExtensions:::filter"]=0
operation_parameters_minimum_occurrences["systemExtensions:::sort_by"]=0
operation_parameters_minimum_occurrences["systemExtensions:::limit"]=0
operation_parameters_minimum_occurrences["systemExtensions:::offset"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::blueprint_ids"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::device_families"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::filter"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::sort_by"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::limit"]=0
operation_parameters_minimum_occurrences["transparencyDatabase:::offset"]=0
operation_parameters_minimum_occurrences["createTag:::body"]=0
operation_parameters_minimum_occurrences["deleteTag:::tag_id"]=1
operation_parameters_minimum_occurrences["getTags:::search"]=1
operation_parameters_minimum_occurrences["updateTag:::tag_id"]=1
operation_parameters_minimum_occurrences["updateTag:::body"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::classification"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::date_range"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::device_id"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::status"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::sort_by"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::term"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::limit"]=0
operation_parameters_minimum_occurrences["getThreatDetails:::offset"]=0
operation_parameters_minimum_occurrences["getUser:::user_id"]=1
operation_parameters_minimum_occurrences["listUsers:::email"]=0
operation_parameters_minimum_occurrences["listUsers:::id"]=0
operation_parameters_minimum_occurrences["listUsers:::integration_id"]=0
operation_parameters_minimum_occurrences["listUsers:::archived"]=0

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["createAdeIntegration:::blueprint_id"]=0
operation_parameters_maximum_occurrences["createAdeIntegration:::email"]=0
operation_parameters_maximum_occurrences["createAdeIntegration:::file"]=0
operation_parameters_maximum_occurrences["createAdeIntegration:::phone"]=0
operation_parameters_maximum_occurrences["deleteAdeIntegration:::ade_token_id"]=0
operation_parameters_maximum_occurrences["getAdeDevice:::device_id"]=0
operation_parameters_maximum_occurrences["getAdeIntegration:::ade_token_id"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::blueprint_id"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::user_id"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::dep_account"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::device_family"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::model"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::os"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::profile_status"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::serial_number"]=0
operation_parameters_maximum_occurrences["listAdeDevices:::page"]=0
operation_parameters_maximum_occurrences["listDevicesAssociatedToAdeToken:::ade_token_id"]=0
operation_parameters_maximum_occurrences["listDevicesAssociatedToAdeToken:::page"]=0
operation_parameters_maximum_occurrences["renewAdeIntegration:::ade_token_id"]=0
operation_parameters_maximum_occurrences["renewAdeIntegration:::blueprint_id"]=0
operation_parameters_maximum_occurrences["renewAdeIntegration:::email"]=0
operation_parameters_maximum_occurrences["renewAdeIntegration:::file"]=0
operation_parameters_maximum_occurrences["renewAdeIntegration:::phone"]=0
operation_parameters_maximum_occurrences["updateAdeDevice:::device_id"]=0
operation_parameters_maximum_occurrences["updateAdeDevice:::body"]=0
operation_parameters_maximum_occurrences["updateAdeIntegration:::ade_token_id"]=0
operation_parameters_maximum_occurrences["updateAdeIntegration:::body"]=0
operation_parameters_maximum_occurrences["assignLibraryItem:::blueprint_id"]=0
operation_parameters_maximum_occurrences["assignLibraryItem:::body"]=0
operation_parameters_maximum_occurrences["createBlueprint:::enrollment_code.code"]=0
operation_parameters_maximum_occurrences["createBlueprint:::enrollment_code.is_active"]=0
operation_parameters_maximum_occurrences["createBlueprint:::name"]=0
operation_parameters_maximum_occurrences["createBlueprint:::source.id"]=0
operation_parameters_maximum_occurrences["createBlueprint:::source.type"]=0
operation_parameters_maximum_occurrences["createBlueprint:::type"]=0
operation_parameters_maximum_occurrences["deleteBlueprint:::blueprint_id"]=0
operation_parameters_maximum_occurrences["getBlueprint:::blueprint_id"]=0
operation_parameters_maximum_occurrences["getBlueprintTemplates:::limit"]=0
operation_parameters_maximum_occurrences["getBlueprintTemplates:::offset"]=0
operation_parameters_maximum_occurrences["getManualEnrollmentProfile:::blueprint_id"]=0
operation_parameters_maximum_occurrences["getManualEnrollmentProfile:::sso"]=0
operation_parameters_maximum_occurrences["listBlueprints:::id"]=0
operation_parameters_maximum_occurrences["listBlueprints:::id__in"]=0
operation_parameters_maximum_occurrences["listBlueprints:::name"]=0
operation_parameters_maximum_occurrences["listBlueprints:::limit"]=0
operation_parameters_maximum_occurrences["listBlueprints:::offset"]=0
operation_parameters_maximum_occurrences["listLibraryItems:::blueprint_id"]=0
operation_parameters_maximum_occurrences["removeLibraryItem:::blueprint_id"]=0
operation_parameters_maximum_occurrences["removeLibraryItem:::body"]=0
operation_parameters_maximum_occurrences["updateBlueprint:::blueprint_id"]=0
operation_parameters_maximum_occurrences["updateBlueprint:::description"]=0
operation_parameters_maximum_occurrences["updateBlueprint:::enrollment_code.code"]=0
operation_parameters_maximum_occurrences["updateBlueprint:::enrollment_code.is_active"]=0
operation_parameters_maximum_occurrences["updateBlueprint:::name"]=0
operation_parameters_maximum_occurrences["createCustomApp:::file_key"]=0
operation_parameters_maximum_occurrences["createCustomApp:::install_enforcement"]=0
operation_parameters_maximum_occurrences["createCustomApp:::install_type"]=0
operation_parameters_maximum_occurrences["createCustomApp:::name"]=0
operation_parameters_maximum_occurrences["createCustomApp:::self_service_category_id"]=0
operation_parameters_maximum_occurrences["createCustomApp:::self_service_recommended"]=0
operation_parameters_maximum_occurrences["createCustomApp:::show_in_self_service"]=0
operation_parameters_maximum_occurrences["deleteCustomApp:::library_item_id"]=0
operation_parameters_maximum_occurrences["getCustomApp:::library_item_id"]=0
operation_parameters_maximum_occurrences["listCustomApps:::page"]=0
operation_parameters_maximum_occurrences["updateCustomApp:::library_item_id"]=0
operation_parameters_maximum_occurrences["updateCustomApp:::active"]=0
operation_parameters_maximum_occurrences["updateCustomApp:::name"]=0
operation_parameters_maximum_occurrences["uploadCustomApp:::body"]=0
operation_parameters_maximum_occurrences["createCustomProfile:::active"]=0
operation_parameters_maximum_occurrences["createCustomProfile:::file"]=0
operation_parameters_maximum_occurrences["createCustomProfile:::name"]=0
operation_parameters_maximum_occurrences["deleteCustomProfile:::library_item_id"]=0
operation_parameters_maximum_occurrences["getCustomProfile:::library_item_id"]=0
operation_parameters_maximum_occurrences["listCustomProfiles:::page"]=0
operation_parameters_maximum_occurrences["updateCustomProfile:::library_item_id"]=0
operation_parameters_maximum_occurrences["createCustomScript:::body"]=0
operation_parameters_maximum_occurrences["deleteCustomScript:::library_item_id"]=0
operation_parameters_maximum_occurrences["getCustomScript:::library_item_id"]=0
operation_parameters_maximum_occurrences["listCustomScripts:::page"]=0
operation_parameters_maximum_occurrences["updateCustomScript:::library_item_id"]=0
operation_parameters_maximum_occurrences["updateCustomScript:::body"]=0
operation_parameters_maximum_occurrences["clearPasscode:::device_id"]=0
operation_parameters_maximum_occurrences["deleteDevice:::device_id"]=0
operation_parameters_maximum_occurrences["deleteUser:::device_id"]=0
operation_parameters_maximum_occurrences["deleteUser:::body"]=0
operation_parameters_maximum_occurrences["eraseDevice:::device_id"]=0
operation_parameters_maximum_occurrences["eraseDevice:::body"]=0
operation_parameters_maximum_occurrences["getDeviceCommands:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceCommands:::limit"]=0
operation_parameters_maximum_occurrences["getDeviceCommands:::offset"]=0
operation_parameters_maximum_occurrences["lockDevice:::device_id"]=0
operation_parameters_maximum_occurrences["lockDevice:::body"]=0
operation_parameters_maximum_occurrences["reinstallAgent:::device_id"]=0
operation_parameters_maximum_occurrences["remoteDesktop:::device_id"]=0
operation_parameters_maximum_occurrences["remoteDesktop:::body"]=0
operation_parameters_maximum_occurrences["renewMdmProfile:::device_id"]=0
operation_parameters_maximum_occurrences["restartDevice:::device_id"]=0
operation_parameters_maximum_occurrences["restartDevice:::body"]=0
operation_parameters_maximum_occurrences["sendBlankpush:::device_id"]=0
operation_parameters_maximum_occurrences["setName:::device_id"]=0
operation_parameters_maximum_occurrences["setName:::body"]=0
operation_parameters_maximum_occurrences["shutdown:::device_id"]=0
operation_parameters_maximum_occurrences["unlockAccount:::device_id"]=0
operation_parameters_maximum_occurrences["unlockAccount:::body"]=0
operation_parameters_maximum_occurrences["updateInventory:::device_id"]=0
operation_parameters_maximum_occurrences["cancelLostMode:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceActivity:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceActivity:::limit"]=0
operation_parameters_maximum_occurrences["getDeviceActivity:::offset"]=0
operation_parameters_maximum_occurrences["getDeviceApps:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceDetails:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceLibraryItems:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceLostModeDetails:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceParameters:::device_id"]=0
operation_parameters_maximum_occurrences["getDeviceStatus:::device_id"]=0
operation_parameters_maximum_occurrences["listDevices:::limit"]=0
operation_parameters_maximum_occurrences["listDevices:::asset_tag"]=0
operation_parameters_maximum_occurrences["listDevices:::blueprint_id"]=0
operation_parameters_maximum_occurrences["listDevices:::device_id"]=0
operation_parameters_maximum_occurrences["listDevices:::device_name"]=0
operation_parameters_maximum_occurrences["listDevices:::filevault_enabled"]=0
operation_parameters_maximum_occurrences["listDevices:::mac_address"]=0
operation_parameters_maximum_occurrences["listDevices:::model"]=0
operation_parameters_maximum_occurrences["listDevices:::ordering"]=0
operation_parameters_maximum_occurrences["listDevices:::os_version"]=0
operation_parameters_maximum_occurrences["listDevices:::platform"]=0
operation_parameters_maximum_occurrences["listDevices:::serial_number"]=0
operation_parameters_maximum_occurrences["listDevices:::tag_name"]=0
operation_parameters_maximum_occurrences["listDevices:::tag_name_in"]=0
operation_parameters_maximum_occurrences["listDevices:::tag_id"]=0
operation_parameters_maximum_occurrences["listDevices:::tag_id_in"]=0
operation_parameters_maximum_occurrences["listDevices:::user"]=0
operation_parameters_maximum_occurrences["listDevices:::user_email"]=0
operation_parameters_maximum_occurrences["listDevices:::user_id"]=0
operation_parameters_maximum_occurrences["listDevices:::user_name"]=0
operation_parameters_maximum_occurrences["listDevices:::offset"]=0
operation_parameters_maximum_occurrences["getActivationLockBypassCode:::device_id"]=0
operation_parameters_maximum_occurrences["getFilevaultRecoveryKey:::device_id"]=0
operation_parameters_maximum_occurrences["getRecoveryLockPassword:::device_id"]=0
operation_parameters_maximum_occurrences["getUnlockPin:::device_id"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::library_item_id"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::activity_type"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::user_id"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::user_email"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::limit"]=0
operation_parameters_maximum_occurrences["getLibraryItemActivity:::offset"]=0
operation_parameters_maximum_occurrences["getLibraryItemStatuses:::library_item_id"]=0
operation_parameters_maximum_occurrences["getLibraryItemStatuses:::computer_id"]=0
operation_parameters_maximum_occurrences["getLibraryItemStatuses:::limit"]=0
operation_parameters_maximum_occurrences["getLibraryItemStatuses:::offset"]=0
operation_parameters_maximum_occurrences["disableLostMode:::device_id"]=0
operation_parameters_maximum_occurrences["enableLostMode:::device_id"]=0
operation_parameters_maximum_occurrences["enableLostMode:::body"]=0
operation_parameters_maximum_occurrences["playLostModeSound:::device_id"]=0
operation_parameters_maximum_occurrences["updateLocation:::device_id"]=0
operation_parameters_maximum_occurrences["createDeviceNote:::device_id"]=0
operation_parameters_maximum_occurrences["createDeviceNote:::body"]=0
operation_parameters_maximum_occurrences["deleteDeviceNote:::device_id"]=0
operation_parameters_maximum_occurrences["deleteDeviceNote:::note_id"]=0
operation_parameters_maximum_occurrences["getDeviceNotes:::device_id"]=0
operation_parameters_maximum_occurrences["retrieveDeviceNote:::device_id"]=0
operation_parameters_maximum_occurrences["retrieveDeviceNote:::note_id"]=0
operation_parameters_maximum_occurrences["updateDeviceNote:::device_id"]=0
operation_parameters_maximum_occurrences["updateDeviceNote:::note_id"]=0
operation_parameters_maximum_occurrences["updateDeviceNote:::Authorization"]=0
operation_parameters_maximum_occurrences["updateDeviceNote:::Content-Type"]=0
operation_parameters_maximum_occurrences["updateDeviceNote:::body"]=0
operation_parameters_maximum_occurrences["activationLock:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["activationLock:::device_families"]=0
operation_parameters_maximum_occurrences["activationLock:::filter"]=0
operation_parameters_maximum_occurrences["activationLock:::sort_by"]=0
operation_parameters_maximum_occurrences["activationLock:::limit"]=0
operation_parameters_maximum_occurrences["activationLock:::offset"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::device_families"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::filter"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::sort_by"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::limit"]=0
operation_parameters_maximum_occurrences["applicationFirewall:::offset"]=0
operation_parameters_maximum_occurrences["applications:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["applications:::device_families"]=0
operation_parameters_maximum_occurrences["applications:::filter"]=0
operation_parameters_maximum_occurrences["applications:::sort_by"]=0
operation_parameters_maximum_occurrences["applications:::limit"]=0
operation_parameters_maximum_occurrences["applications:::offset"]=0
operation_parameters_maximum_occurrences["certificates:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["certificates:::device_families"]=0
operation_parameters_maximum_occurrences["certificates:::filter"]=0
operation_parameters_maximum_occurrences["certificates:::sort_by"]=0
operation_parameters_maximum_occurrences["certificates:::limit"]=0
operation_parameters_maximum_occurrences["certificates:::offset"]=0
operation_parameters_maximum_occurrences["count:::category"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::device_families"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::filter"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::sort_by"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::limit"]=0
operation_parameters_maximum_occurrences["desktopAndScreensaver:::offset"]=0
operation_parameters_maximum_occurrences["deviceInformation:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["deviceInformation:::device_families"]=0
operation_parameters_maximum_occurrences["deviceInformation:::filter"]=0
operation_parameters_maximum_occurrences["deviceInformation:::sort_by"]=0
operation_parameters_maximum_occurrences["deviceInformation:::limit"]=0
operation_parameters_maximum_occurrences["deviceInformation:::offset"]=0
operation_parameters_maximum_occurrences["deviceInformation:::body"]=0
operation_parameters_maximum_occurrences["filevault:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["filevault:::device_families"]=0
operation_parameters_maximum_occurrences["filevault:::filter"]=0
operation_parameters_maximum_occurrences["filevault:::sort_by"]=0
operation_parameters_maximum_occurrences["filevault:::limit"]=0
operation_parameters_maximum_occurrences["filevault:::offset"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::device_families"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::filter"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::sort_by"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::limit"]=0
operation_parameters_maximum_occurrences["gatekeeperAndXprotect:::offset"]=0
operation_parameters_maximum_occurrences["getCategoryExport:::export_id"]=0
operation_parameters_maximum_occurrences["installedProfiles:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["installedProfiles:::device_families"]=0
operation_parameters_maximum_occurrences["installedProfiles:::filter"]=0
operation_parameters_maximum_occurrences["installedProfiles:::sort_by"]=0
operation_parameters_maximum_occurrences["installedProfiles:::limit"]=0
operation_parameters_maximum_occurrences["installedProfiles:::offset"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::device_families"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::filter"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::sort_by"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::limit"]=0
operation_parameters_maximum_occurrences["kernelExtensions:::offset"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::device_families"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::filter"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::sort_by"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::limit"]=0
operation_parameters_maximum_occurrences["launchAgentsAndDaemons:::offset"]=0
operation_parameters_maximum_occurrences["localUsers:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["localUsers:::device_families"]=0
operation_parameters_maximum_occurrences["localUsers:::filter"]=0
operation_parameters_maximum_occurrences["localUsers:::sort_by"]=0
operation_parameters_maximum_occurrences["localUsers:::limit"]=0
operation_parameters_maximum_occurrences["localUsers:::offset"]=0
operation_parameters_maximum_occurrences["requestCategoryExport:::body"]=0
operation_parameters_maximum_occurrences["startupSettings:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["startupSettings:::device_families"]=0
operation_parameters_maximum_occurrences["startupSettings:::filter"]=0
operation_parameters_maximum_occurrences["startupSettings:::sort_by"]=0
operation_parameters_maximum_occurrences["startupSettings:::limit"]=0
operation_parameters_maximum_occurrences["startupSettings:::offset"]=0
operation_parameters_maximum_occurrences["systemExtensions:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["systemExtensions:::device_families"]=0
operation_parameters_maximum_occurrences["systemExtensions:::filter"]=0
operation_parameters_maximum_occurrences["systemExtensions:::sort_by"]=0
operation_parameters_maximum_occurrences["systemExtensions:::limit"]=0
operation_parameters_maximum_occurrences["systemExtensions:::offset"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::blueprint_ids"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::device_families"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::filter"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::sort_by"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::limit"]=0
operation_parameters_maximum_occurrences["transparencyDatabase:::offset"]=0
operation_parameters_maximum_occurrences["createTag:::body"]=0
operation_parameters_maximum_occurrences["deleteTag:::tag_id"]=0
operation_parameters_maximum_occurrences["getTags:::search"]=0
operation_parameters_maximum_occurrences["updateTag:::tag_id"]=0
operation_parameters_maximum_occurrences["updateTag:::body"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::classification"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::date_range"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::device_id"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::status"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::sort_by"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::term"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::limit"]=0
operation_parameters_maximum_occurrences["getThreatDetails:::offset"]=0
operation_parameters_maximum_occurrences["getUser:::user_id"]=0
operation_parameters_maximum_occurrences["listUsers:::email"]=0
operation_parameters_maximum_occurrences["listUsers:::id"]=0
operation_parameters_maximum_occurrences["listUsers:::integration_id"]=0
operation_parameters_maximum_occurrences["listUsers:::archived"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["createAdeIntegration:::blueprint_id"]=""
operation_parameters_collection_type["createAdeIntegration:::email"]=""
operation_parameters_collection_type["createAdeIntegration:::file"]=""
operation_parameters_collection_type["createAdeIntegration:::phone"]=""
operation_parameters_collection_type["deleteAdeIntegration:::ade_token_id"]=""
operation_parameters_collection_type["getAdeDevice:::device_id"]=""
operation_parameters_collection_type["getAdeIntegration:::ade_token_id"]=""
operation_parameters_collection_type["listAdeDevices:::blueprint_id"]=""
operation_parameters_collection_type["listAdeDevices:::user_id"]=""
operation_parameters_collection_type["listAdeDevices:::dep_account"]=""
operation_parameters_collection_type["listAdeDevices:::device_family"]=""
operation_parameters_collection_type["listAdeDevices:::model"]=""
operation_parameters_collection_type["listAdeDevices:::os"]=""
operation_parameters_collection_type["listAdeDevices:::profile_status"]=""
operation_parameters_collection_type["listAdeDevices:::serial_number"]=""
operation_parameters_collection_type["listAdeDevices:::page"]=""
operation_parameters_collection_type["listDevicesAssociatedToAdeToken:::ade_token_id"]=""
operation_parameters_collection_type["listDevicesAssociatedToAdeToken:::page"]=""
operation_parameters_collection_type["renewAdeIntegration:::ade_token_id"]=""
operation_parameters_collection_type["renewAdeIntegration:::blueprint_id"]=""
operation_parameters_collection_type["renewAdeIntegration:::email"]=""
operation_parameters_collection_type["renewAdeIntegration:::file"]=""
operation_parameters_collection_type["renewAdeIntegration:::phone"]=""
operation_parameters_collection_type["updateAdeDevice:::device_id"]=""
operation_parameters_collection_type["updateAdeDevice:::body"]=""
operation_parameters_collection_type["updateAdeIntegration:::ade_token_id"]=""
operation_parameters_collection_type["updateAdeIntegration:::body"]=""
operation_parameters_collection_type["assignLibraryItem:::blueprint_id"]=""
operation_parameters_collection_type["assignLibraryItem:::body"]=""
operation_parameters_collection_type["createBlueprint:::enrollment_code.code"]=""
operation_parameters_collection_type["createBlueprint:::enrollment_code.is_active"]=""
operation_parameters_collection_type["createBlueprint:::name"]=""
operation_parameters_collection_type["createBlueprint:::source.id"]=""
operation_parameters_collection_type["createBlueprint:::source.type"]=""
operation_parameters_collection_type["createBlueprint:::type"]=""
operation_parameters_collection_type["deleteBlueprint:::blueprint_id"]=""
operation_parameters_collection_type["getBlueprint:::blueprint_id"]=""
operation_parameters_collection_type["getBlueprintTemplates:::limit"]=""
operation_parameters_collection_type["getBlueprintTemplates:::offset"]=""
operation_parameters_collection_type["getManualEnrollmentProfile:::blueprint_id"]=""
operation_parameters_collection_type["getManualEnrollmentProfile:::sso"]=""
operation_parameters_collection_type["listBlueprints:::id"]=""
operation_parameters_collection_type["listBlueprints:::id__in"]=""
operation_parameters_collection_type["listBlueprints:::name"]=""
operation_parameters_collection_type["listBlueprints:::limit"]=""
operation_parameters_collection_type["listBlueprints:::offset"]=""
operation_parameters_collection_type["listLibraryItems:::blueprint_id"]=""
operation_parameters_collection_type["removeLibraryItem:::blueprint_id"]=""
operation_parameters_collection_type["removeLibraryItem:::body"]=""
operation_parameters_collection_type["updateBlueprint:::blueprint_id"]=""
operation_parameters_collection_type["updateBlueprint:::description"]=""
operation_parameters_collection_type["updateBlueprint:::enrollment_code.code"]=""
operation_parameters_collection_type["updateBlueprint:::enrollment_code.is_active"]=""
operation_parameters_collection_type["updateBlueprint:::name"]=""
operation_parameters_collection_type["createCustomApp:::file_key"]=""
operation_parameters_collection_type["createCustomApp:::install_enforcement"]=""
operation_parameters_collection_type["createCustomApp:::install_type"]=""
operation_parameters_collection_type["createCustomApp:::name"]=""
operation_parameters_collection_type["createCustomApp:::self_service_category_id"]=""
operation_parameters_collection_type["createCustomApp:::self_service_recommended"]=""
operation_parameters_collection_type["createCustomApp:::show_in_self_service"]=""
operation_parameters_collection_type["deleteCustomApp:::library_item_id"]=""
operation_parameters_collection_type["getCustomApp:::library_item_id"]=""
operation_parameters_collection_type["listCustomApps:::page"]=""
operation_parameters_collection_type["updateCustomApp:::library_item_id"]=""
operation_parameters_collection_type["updateCustomApp:::active"]=""
operation_parameters_collection_type["updateCustomApp:::name"]=""
operation_parameters_collection_type["uploadCustomApp:::body"]=""
operation_parameters_collection_type["createCustomProfile:::active"]=""
operation_parameters_collection_type["createCustomProfile:::file"]=""
operation_parameters_collection_type["createCustomProfile:::name"]=""
operation_parameters_collection_type["deleteCustomProfile:::library_item_id"]=""
operation_parameters_collection_type["getCustomProfile:::library_item_id"]=""
operation_parameters_collection_type["listCustomProfiles:::page"]=""
operation_parameters_collection_type["updateCustomProfile:::library_item_id"]=""
operation_parameters_collection_type["createCustomScript:::body"]=""
operation_parameters_collection_type["deleteCustomScript:::library_item_id"]=""
operation_parameters_collection_type["getCustomScript:::library_item_id"]=""
operation_parameters_collection_type["listCustomScripts:::page"]=""
operation_parameters_collection_type["updateCustomScript:::library_item_id"]=""
operation_parameters_collection_type["updateCustomScript:::body"]=""
operation_parameters_collection_type["clearPasscode:::device_id"]=""
operation_parameters_collection_type["deleteDevice:::device_id"]=""
operation_parameters_collection_type["deleteUser:::device_id"]=""
operation_parameters_collection_type["deleteUser:::body"]=""
operation_parameters_collection_type["eraseDevice:::device_id"]=""
operation_parameters_collection_type["eraseDevice:::body"]=""
operation_parameters_collection_type["getDeviceCommands:::device_id"]=""
operation_parameters_collection_type["getDeviceCommands:::limit"]=""
operation_parameters_collection_type["getDeviceCommands:::offset"]=""
operation_parameters_collection_type["lockDevice:::device_id"]=""
operation_parameters_collection_type["lockDevice:::body"]=""
operation_parameters_collection_type["reinstallAgent:::device_id"]=""
operation_parameters_collection_type["remoteDesktop:::device_id"]=""
operation_parameters_collection_type["remoteDesktop:::body"]=""
operation_parameters_collection_type["renewMdmProfile:::device_id"]=""
operation_parameters_collection_type["restartDevice:::device_id"]=""
operation_parameters_collection_type["restartDevice:::body"]=""
operation_parameters_collection_type["sendBlankpush:::device_id"]=""
operation_parameters_collection_type["setName:::device_id"]=""
operation_parameters_collection_type["setName:::body"]=""
operation_parameters_collection_type["shutdown:::device_id"]=""
operation_parameters_collection_type["unlockAccount:::device_id"]=""
operation_parameters_collection_type["unlockAccount:::body"]=""
operation_parameters_collection_type["updateInventory:::device_id"]=""
operation_parameters_collection_type["cancelLostMode:::device_id"]=""
operation_parameters_collection_type["getDeviceActivity:::device_id"]=""
operation_parameters_collection_type["getDeviceActivity:::limit"]=""
operation_parameters_collection_type["getDeviceActivity:::offset"]=""
operation_parameters_collection_type["getDeviceApps:::device_id"]=""
operation_parameters_collection_type["getDeviceDetails:::device_id"]=""
operation_parameters_collection_type["getDeviceLibraryItems:::device_id"]=""
operation_parameters_collection_type["getDeviceLostModeDetails:::device_id"]=""
operation_parameters_collection_type["getDeviceParameters:::device_id"]=""
operation_parameters_collection_type["getDeviceStatus:::device_id"]=""
operation_parameters_collection_type["listDevices:::limit"]=""
operation_parameters_collection_type["listDevices:::asset_tag"]=""
operation_parameters_collection_type["listDevices:::blueprint_id"]=""
operation_parameters_collection_type["listDevices:::device_id"]=""
operation_parameters_collection_type["listDevices:::device_name"]=""
operation_parameters_collection_type["listDevices:::filevault_enabled"]=""
operation_parameters_collection_type["listDevices:::mac_address"]=""
operation_parameters_collection_type["listDevices:::model"]=""
operation_parameters_collection_type["listDevices:::ordering"]=""
operation_parameters_collection_type["listDevices:::os_version"]=""
operation_parameters_collection_type["listDevices:::platform"]=""
operation_parameters_collection_type["listDevices:::serial_number"]=""
operation_parameters_collection_type["listDevices:::tag_name"]=""
operation_parameters_collection_type["listDevices:::tag_name_in"]=""
operation_parameters_collection_type["listDevices:::tag_id"]=""
operation_parameters_collection_type["listDevices:::tag_id_in"]=""
operation_parameters_collection_type["listDevices:::user"]=""
operation_parameters_collection_type["listDevices:::user_email"]=""
operation_parameters_collection_type["listDevices:::user_id"]=""
operation_parameters_collection_type["listDevices:::user_name"]=""
operation_parameters_collection_type["listDevices:::offset"]=""
operation_parameters_collection_type["getActivationLockBypassCode:::device_id"]=""
operation_parameters_collection_type["getFilevaultRecoveryKey:::device_id"]=""
operation_parameters_collection_type["getRecoveryLockPassword:::device_id"]=""
operation_parameters_collection_type["getUnlockPin:::device_id"]=""
operation_parameters_collection_type["getLibraryItemActivity:::library_item_id"]=""
operation_parameters_collection_type["getLibraryItemActivity:::activity_type"]=""
operation_parameters_collection_type["getLibraryItemActivity:::user_id"]=""
operation_parameters_collection_type["getLibraryItemActivity:::user_email"]=""
operation_parameters_collection_type["getLibraryItemActivity:::limit"]=""
operation_parameters_collection_type["getLibraryItemActivity:::offset"]=""
operation_parameters_collection_type["getLibraryItemStatuses:::library_item_id"]=""
operation_parameters_collection_type["getLibraryItemStatuses:::computer_id"]=""
operation_parameters_collection_type["getLibraryItemStatuses:::limit"]=""
operation_parameters_collection_type["getLibraryItemStatuses:::offset"]=""
operation_parameters_collection_type["disableLostMode:::device_id"]=""
operation_parameters_collection_type["enableLostMode:::device_id"]=""
operation_parameters_collection_type["enableLostMode:::body"]=""
operation_parameters_collection_type["playLostModeSound:::device_id"]=""
operation_parameters_collection_type["updateLocation:::device_id"]=""
operation_parameters_collection_type["createDeviceNote:::device_id"]=""
operation_parameters_collection_type["createDeviceNote:::body"]=""
operation_parameters_collection_type["deleteDeviceNote:::device_id"]=""
operation_parameters_collection_type["deleteDeviceNote:::note_id"]=""
operation_parameters_collection_type["getDeviceNotes:::device_id"]=""
operation_parameters_collection_type["retrieveDeviceNote:::device_id"]=""
operation_parameters_collection_type["retrieveDeviceNote:::note_id"]=""
operation_parameters_collection_type["updateDeviceNote:::device_id"]=""
operation_parameters_collection_type["updateDeviceNote:::note_id"]=""
operation_parameters_collection_type["updateDeviceNote:::Authorization"]=""
operation_parameters_collection_type["updateDeviceNote:::Content-Type"]=""
operation_parameters_collection_type["updateDeviceNote:::body"]=""
operation_parameters_collection_type["activationLock:::blueprint_ids"]=""
operation_parameters_collection_type["activationLock:::device_families"]=""
operation_parameters_collection_type["activationLock:::filter"]=""
operation_parameters_collection_type["activationLock:::sort_by"]=""
operation_parameters_collection_type["activationLock:::limit"]=""
operation_parameters_collection_type["activationLock:::offset"]=""
operation_parameters_collection_type["applicationFirewall:::blueprint_ids"]=""
operation_parameters_collection_type["applicationFirewall:::device_families"]=""
operation_parameters_collection_type["applicationFirewall:::filter"]=""
operation_parameters_collection_type["applicationFirewall:::sort_by"]=""
operation_parameters_collection_type["applicationFirewall:::limit"]=""
operation_parameters_collection_type["applicationFirewall:::offset"]=""
operation_parameters_collection_type["applications:::blueprint_ids"]=""
operation_parameters_collection_type["applications:::device_families"]=""
operation_parameters_collection_type["applications:::filter"]=""
operation_parameters_collection_type["applications:::sort_by"]=""
operation_parameters_collection_type["applications:::limit"]=""
operation_parameters_collection_type["applications:::offset"]=""
operation_parameters_collection_type["certificates:::blueprint_ids"]=""
operation_parameters_collection_type["certificates:::device_families"]=""
operation_parameters_collection_type["certificates:::filter"]=""
operation_parameters_collection_type["certificates:::sort_by"]=""
operation_parameters_collection_type["certificates:::limit"]=""
operation_parameters_collection_type["certificates:::offset"]=""
operation_parameters_collection_type["count:::category"]=""
operation_parameters_collection_type["desktopAndScreensaver:::blueprint_ids"]=""
operation_parameters_collection_type["desktopAndScreensaver:::device_families"]=""
operation_parameters_collection_type["desktopAndScreensaver:::filter"]=""
operation_parameters_collection_type["desktopAndScreensaver:::sort_by"]=""
operation_parameters_collection_type["desktopAndScreensaver:::limit"]=""
operation_parameters_collection_type["desktopAndScreensaver:::offset"]=""
operation_parameters_collection_type["deviceInformation:::blueprint_ids"]=""
operation_parameters_collection_type["deviceInformation:::device_families"]=""
operation_parameters_collection_type["deviceInformation:::filter"]=""
operation_parameters_collection_type["deviceInformation:::sort_by"]=""
operation_parameters_collection_type["deviceInformation:::limit"]=""
operation_parameters_collection_type["deviceInformation:::offset"]=""
operation_parameters_collection_type["deviceInformation:::body"]=""
operation_parameters_collection_type["filevault:::blueprint_ids"]=""
operation_parameters_collection_type["filevault:::device_families"]=""
operation_parameters_collection_type["filevault:::filter"]=""
operation_parameters_collection_type["filevault:::sort_by"]=""
operation_parameters_collection_type["filevault:::limit"]=""
operation_parameters_collection_type["filevault:::offset"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::blueprint_ids"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::device_families"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::filter"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::sort_by"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::limit"]=""
operation_parameters_collection_type["gatekeeperAndXprotect:::offset"]=""
operation_parameters_collection_type["getCategoryExport:::export_id"]=""
operation_parameters_collection_type["installedProfiles:::blueprint_ids"]=""
operation_parameters_collection_type["installedProfiles:::device_families"]=""
operation_parameters_collection_type["installedProfiles:::filter"]=""
operation_parameters_collection_type["installedProfiles:::sort_by"]=""
operation_parameters_collection_type["installedProfiles:::limit"]=""
operation_parameters_collection_type["installedProfiles:::offset"]=""
operation_parameters_collection_type["kernelExtensions:::blueprint_ids"]=""
operation_parameters_collection_type["kernelExtensions:::device_families"]=""
operation_parameters_collection_type["kernelExtensions:::filter"]=""
operation_parameters_collection_type["kernelExtensions:::sort_by"]=""
operation_parameters_collection_type["kernelExtensions:::limit"]=""
operation_parameters_collection_type["kernelExtensions:::offset"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::blueprint_ids"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::device_families"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::filter"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::sort_by"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::limit"]=""
operation_parameters_collection_type["launchAgentsAndDaemons:::offset"]=""
operation_parameters_collection_type["localUsers:::blueprint_ids"]=""
operation_parameters_collection_type["localUsers:::device_families"]=""
operation_parameters_collection_type["localUsers:::filter"]=""
operation_parameters_collection_type["localUsers:::sort_by"]=""
operation_parameters_collection_type["localUsers:::limit"]=""
operation_parameters_collection_type["localUsers:::offset"]=""
operation_parameters_collection_type["requestCategoryExport:::body"]=""
operation_parameters_collection_type["startupSettings:::blueprint_ids"]=""
operation_parameters_collection_type["startupSettings:::device_families"]=""
operation_parameters_collection_type["startupSettings:::filter"]=""
operation_parameters_collection_type["startupSettings:::sort_by"]=""
operation_parameters_collection_type["startupSettings:::limit"]=""
operation_parameters_collection_type["startupSettings:::offset"]=""
operation_parameters_collection_type["systemExtensions:::blueprint_ids"]=""
operation_parameters_collection_type["systemExtensions:::device_families"]=""
operation_parameters_collection_type["systemExtensions:::filter"]=""
operation_parameters_collection_type["systemExtensions:::sort_by"]=""
operation_parameters_collection_type["systemExtensions:::limit"]=""
operation_parameters_collection_type["systemExtensions:::offset"]=""
operation_parameters_collection_type["transparencyDatabase:::blueprint_ids"]=""
operation_parameters_collection_type["transparencyDatabase:::device_families"]=""
operation_parameters_collection_type["transparencyDatabase:::filter"]=""
operation_parameters_collection_type["transparencyDatabase:::sort_by"]=""
operation_parameters_collection_type["transparencyDatabase:::limit"]=""
operation_parameters_collection_type["transparencyDatabase:::offset"]=""
operation_parameters_collection_type["createTag:::body"]=""
operation_parameters_collection_type["deleteTag:::tag_id"]=""
operation_parameters_collection_type["getTags:::search"]=""
operation_parameters_collection_type["updateTag:::tag_id"]=""
operation_parameters_collection_type["updateTag:::body"]=""
operation_parameters_collection_type["getThreatDetails:::classification"]=""
operation_parameters_collection_type["getThreatDetails:::date_range"]=""
operation_parameters_collection_type["getThreatDetails:::device_id"]=""
operation_parameters_collection_type["getThreatDetails:::status"]=""
operation_parameters_collection_type["getThreatDetails:::sort_by"]=""
operation_parameters_collection_type["getThreatDetails:::term"]=""
operation_parameters_collection_type["getThreatDetails:::limit"]=""
operation_parameters_collection_type["getThreatDetails:::offset"]=""
operation_parameters_collection_type["getUser:::user_id"]=""
operation_parameters_collection_type["listUsers:::email"]=""
operation_parameters_collection_type["listUsers:::id"]=""
operation_parameters_collection_type["listUsers:::integration_id"]=""
operation_parameters_collection_type["listUsers:::archived"]=""


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
    echo -e "${BOLD}${WHITE}[automatedDeviceEnrollmentIntegrations]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createAdeIntegration${OFF};Create ADE integration (AUTH)
  ${CYAN}deleteAdeIntegration${OFF};Delete ADE integration (AUTH)
  ${CYAN}downloadAdePublicKey${OFF};Download ADE public key (AUTH)
  ${CYAN}getAdeDevice${OFF};Get ADE device (AUTH)
  ${CYAN}getAdeIntegration${OFF};Get ADE integration (AUTH)
  ${CYAN}listAdeDevices${OFF};List ADE devices (AUTH)
  ${CYAN}listAdeIntegrations${OFF};List ADE integrations (AUTH)
  ${CYAN}listDevicesAssociatedToAdeToken${OFF};List devices associated to ADE token (AUTH)
  ${CYAN}renewAdeIntegration${OFF};Renew ADE integration (AUTH)
  ${CYAN}updateAdeDevice${OFF};Update ADE device (AUTH)
  ${CYAN}updateAdeIntegration${OFF};Update ADE integration (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[blueprints]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}assignLibraryItem${OFF};Assign Library Item (AUTH)
  ${CYAN}createBlueprint${OFF};Create Blueprint (AUTH)
  ${CYAN}deleteBlueprint${OFF};Delete Blueprint (AUTH)
  ${CYAN}getBlueprint${OFF};Get Blueprint (AUTH)
  ${CYAN}getBlueprintTemplates${OFF};Get Blueprint Templates (AUTH)
  ${CYAN}getManualEnrollmentProfile${OFF};Get Manual Enrollment Profile (AUTH)
  ${CYAN}listBlueprints${OFF};List Blueprints (AUTH)
  ${CYAN}listLibraryItems${OFF};List Library Items (AUTH)
  ${CYAN}removeLibraryItem${OFF};Remove Library Item (AUTH)
  ${CYAN}updateBlueprint${OFF};Update Blueprint (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customApps]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createCustomApp${OFF};Create Custom App (AUTH)
  ${CYAN}deleteCustomApp${OFF};Delete Custom App (AUTH)
  ${CYAN}getCustomApp${OFF};Get Custom App (AUTH)
  ${CYAN}listCustomApps${OFF};List Custom Apps (AUTH)
  ${CYAN}updateCustomApp${OFF};Update Custom App (AUTH)
  ${CYAN}uploadCustomApp${OFF};Upload Custom App (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customProfiles]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createCustomProfile${OFF};Create Custom Profile (AUTH)
  ${CYAN}deleteCustomProfile${OFF};Delete Custom Profile (AUTH)
  ${CYAN}getCustomProfile${OFF};Get Custom Profile (AUTH)
  ${CYAN}listCustomProfiles${OFF};List Custom Profiles (AUTH)
  ${CYAN}updateCustomProfile${OFF};Update Custom Profile (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[customScripts]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createCustomScript${OFF};Create Custom Script (AUTH)
  ${CYAN}deleteCustomScript${OFF};Delete Custom Script (AUTH)
  ${CYAN}getCustomScript${OFF};Get Custom Script (AUTH)
  ${CYAN}listCustomScripts${OFF};List Custom Scripts (AUTH)
  ${CYAN}updateCustomScript${OFF};Update Custom Script (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[deviceActions]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}clearPasscode${OFF};Clear Passcode (AUTH)
  ${CYAN}deleteDevice${OFF};Delete Device (AUTH)
  ${CYAN}deleteUser${OFF};Delete User (AUTH)
  ${CYAN}eraseDevice${OFF};Erase Device (AUTH)
  ${CYAN}getDeviceCommands${OFF};Get Device Commands (AUTH)
  ${CYAN}lockDevice${OFF};Lock Device (AUTH)
  ${CYAN}reinstallAgent${OFF};Reinstall Agent (AUTH)
  ${CYAN}remoteDesktop${OFF};Remote Desktop (AUTH)
  ${CYAN}renewMdmProfile${OFF};Renew MDM Profile (AUTH)
  ${CYAN}restartDevice${OFF};Restart Device (AUTH)
  ${CYAN}sendBlankpush${OFF};Send Blankpush (AUTH)
  ${CYAN}setName${OFF};Set Name (AUTH)
  ${CYAN}shutdown${OFF};Shutdown (AUTH)
  ${CYAN}unlockAccount${OFF};Unlock Account (AUTH)
  ${CYAN}updateInventory${OFF};Update Inventory (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[deviceInformation]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}cancelLostMode${OFF};Cancel Lost Mode (AUTH)
  ${CYAN}getDeviceActivity${OFF};Get Device Activity (AUTH)
  ${CYAN}getDeviceApps${OFF};Get Device Apps (AUTH)
  ${CYAN}getDeviceDetails${OFF};Get Device Details (AUTH)
  ${CYAN}getDeviceLibraryItems${OFF};Get Device Library Items (AUTH)
  ${CYAN}getDeviceLostModeDetails${OFF};Get Device Lost Mode details (AUTH)
  ${CYAN}getDeviceParameters${OFF};Get Device Parameters (AUTH)
  ${CYAN}getDeviceStatus${OFF};Get Device Status (AUTH)
  ${CYAN}listDevices${OFF};List Devices (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[deviceSecrets]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getActivationLockBypassCode${OFF};Get Activation Lock Bypass Code (AUTH)
  ${CYAN}getFilevaultRecoveryKey${OFF};Get FileVault Recovery Key (AUTH)
  ${CYAN}getRecoveryLockPassword${OFF};Get Recovery Lock Password (AUTH)
  ${CYAN}getUnlockPin${OFF};Get Unlock Pin (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[libraryItems]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getLibraryItemActivity${OFF};Get Library Item Activity (AUTH)
  ${CYAN}getLibraryItemStatuses${OFF};Get Library Item Statuses (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[lostMode]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}disableLostMode${OFF};Disable Lost Mode (AUTH)
  ${CYAN}enableLostMode${OFF};Enable Lost Mode (AUTH)
  ${CYAN}playLostModeSound${OFF};Play Lost Mode Sound (AUTH)
  ${CYAN}updateLocation${OFF};Update Location (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[notes]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createDeviceNote${OFF};Create Device Note (AUTH)
  ${CYAN}deleteDeviceNote${OFF};Delete Device Note (AUTH)
  ${CYAN}getDeviceNotes${OFF};Get Device Notes (AUTH)
  ${CYAN}retrieveDeviceNote${OFF};Retrieve Device Note (AUTH)
  ${CYAN}updateDeviceNote${OFF};Update Device Note (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[prism]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}activationLock${OFF};Activation lock (AUTH)
  ${CYAN}applicationFirewall${OFF};Application firewall (AUTH)
  ${CYAN}applications${OFF};Applications (AUTH)
  ${CYAN}certificates${OFF};Certificates (AUTH)
  ${CYAN}count${OFF};Count (AUTH)
  ${CYAN}desktopAndScreensaver${OFF};Desktop and Screensaver (AUTH)
  ${CYAN}deviceInformation${OFF};Device information (AUTH)
  ${CYAN}filevault${OFF};FileVault (AUTH)
  ${CYAN}gatekeeperAndXprotect${OFF};Gatekeeper and XProtect (AUTH)
  ${CYAN}getCategoryExport${OFF};Get category export (AUTH)
  ${CYAN}installedProfiles${OFF};Installed profiles (AUTH)
  ${CYAN}kernelExtensions${OFF};Kernel Extensions (AUTH)
  ${CYAN}launchAgentsAndDaemons${OFF};Launch Agents and Daemons (AUTH)
  ${CYAN}localUsers${OFF};Local users (AUTH)
  ${CYAN}requestCategoryExport${OFF};Request category export (AUTH)
  ${CYAN}startupSettings${OFF};Startup settings (AUTH)
  ${CYAN}systemExtensions${OFF};System Extensions (AUTH)
  ${CYAN}transparencyDatabase${OFF};Transparency database (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[selfService]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}listSelfServiceCategories${OFF};List Self Service Categories (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[settings]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}licensing${OFF};Licensing (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[tags]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createTag${OFF};Create Tag (AUTH)
  ${CYAN}deleteTag${OFF};Delete Tag (AUTH)
  ${CYAN}getTags${OFF};Get Tags (AUTH)
  ${CYAN}updateTag${OFF};Update Tag (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[threats]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getThreatDetails${OFF};Get Threat Details (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[users]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getUser${OFF};Get User (AUTH)
  ${CYAN}listUsers${OFF};List Users (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://&lt;sub_domain&gt;.api.kandji.io')"

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
    echo -e "License: MIT License"
    echo -e "Contact: mitchelsblake@gmail.com"
    echo ""
read -r -d '' appdescription <<EOF

<html><head></head><body><h1 id=&quot;welcome-to-the-kandji-api-documentation&quot;>Welcome to the Kandji API Documentation</h1>
<p>You can find your API URL in Settings &gt; Access. The API URL will follow the below formats.</p>
<ul>
<li><p>US - <code>https://SubDomain.api.kandji.io</code></p>
</li>
<li><p>EU - <code>https://SubDomain.api.eu.kandji.io</code></p>
 </li>
</ul>
<p>For information on how to obtain an API token, please refer to the following support article.</p>
<p><a href=&quot;https://support.kandji.io/api&quot;>https://support.kandji.io/api</a></p>
 <h4 id=&quot;rate-limit&quot;>Rate Limit</h4>
<p>The Kandji API currently has an API rate limit of 10,000 requests per hour per customer.</p>
<h4 id=&quot;request-methods&quot;>Request Methods</h4>
<p>HTTP request methods supported by the Kandji API.</p>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
</div><h4 id=&quot;response-codes&quot;>Response codes</h4>
<p>Not all response codes apply to every endpoint.</p>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
<td>&quot;Command already running&quot; - The command may already be running in a <em>Pending</em> state waiting on the device.</td>
 </tr>
<tr>
<td></td>
<td>&quot;Command is not allowed for current device&quot; - The command may not be compatible with the target device.</td>
</tr>
<tr>
 <td></td>
<td>&quot;JSON parse error - Expecting ',' delimiter: line 3 column 2 (char 65)&quot;</td>
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
 </div><h4 id=&quot;data-structure&quot;>Data structure</h4>
<p>The API returns all structured responses in JSON schema format.</p>
<h4 id=&quot;examples&quot;>Examples</h4>
 <p>Code examples using the API can be found in the Kandji support <a href=&quot;https://github.com/kandji-inc/support/tree/main/api-tools&quot;>GitHub</a>.</p>
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
# Print help for createAdeIntegration operation
#
##############################################################################
print_createAdeIntegration_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createAdeIntegration - Create ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteAdeIntegration operation
#
##############################################################################
print_deleteAdeIntegration_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteAdeIntegration - Delete ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=&quot;warning&quot;><strong>WARNING!</strong></h1>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for downloadAdePublicKey operation
#
##############################################################################
print_downloadAdePublicKey_help() {
    echo ""
    echo -e "${BOLD}${WHITE}downloadAdePublicKey - Download ADE public key${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the public key used to create an MDM server connection in Apple Business Manager.</p>
<p>The encoded information needs to be saved to a file with the <code>.pem</code> format and then uploaded to ABM.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getAdeDevice operation
#
##############################################################################
print_getAdeDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAdeDevice - Get ADE device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get information about a specific Automated Device Enrollment device." | paste -sd' ' | fold -sw 80
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
# Print help for getAdeIntegration operation
#
##############################################################################
print_getAdeIntegration_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAdeIntegration - Get ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request returns a specific ADE integration based on the <code>ade_token_id</code> passed." | paste -sd' ' | fold -sw 80
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
# Print help for listAdeDevices operation
#
##############################################################################
print_listAdeDevices_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAdeDevices - List ADE devices${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get a list of Automated Device Enrollment devices." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results &quot;containing&quot; the specified blueprint id${YELLOW} Specify as: blueprint_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - &quot;exact&quot; match on kandji user ID number${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}dep_account${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ADE token UUID${YELLOW} Specify as: dep_account=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_family${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Mac, iPhone, iPad, AppleTV, iPod${YELLOW} Specify as: device_family=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}model${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return model results &quot;containing&quot; the specified model string. - &quot;iPad (8th Generation)&quot;, &quot;MacBook Air&quot;${YELLOW} Specify as: model=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}os${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - OSX, iOS, tvOS${YELLOW} Specify as: os=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}profile_status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The automated device enrollment profile assignment status - assigned, empty, pushed, removed${YELLOW} Specify as: profile_status=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}serial_number${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.${YELLOW} Specify as: serial_number=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Use the <code>page</code> parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the <code>next</code> and <code>previous</code> key attributes in the response can be used to request the next page of results or return to the previous page.${YELLOW} Specify as: page=value${OFF}" \
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
# Print help for listAdeIntegrations operation
#
##############################################################################
print_listAdeIntegrations_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAdeIntegrations - List ADE integrations${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request returns a list of configured ADE integrations." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listDevicesAssociatedToAdeToken operation
#
##############################################################################
print_listDevicesAssociatedToAdeToken_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listDevicesAssociatedToAdeToken - List devices associated to ADE token${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices associated with a specified <code>ade_token_id</code> as well as their enrollment status.</p>
<p>When the <code>mdm_device</code> key value is <code>null</code>, this can be taken as an indication that the device is awaiting enrollment into Kandji.</p>
 <p>When data is present within the mdm_device dictionary, you can reference the <code>device_id</code> as the ID of the enrolled device record.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}ade_token_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: ade_token_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Use the <code>page</code> parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the <code>next</code> and <code>previous</code> key attributes in the response can be used to request the next page of results or return to the previous page.${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Set-Cookie${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Xss-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for renewAdeIntegration operation
#
##############################################################################
print_renewAdeIntegration_help() {
    echo ""
    echo -e "${BOLD}${WHITE}renewAdeIntegration - Renew ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for updateAdeDevice operation
#
##############################################################################
print_updateAdeDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateAdeDevice - Update ADE device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update a specific Automated Device Enrollment device's blueprint assignment, user assignment, and asset tag.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
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
# Print help for updateAdeIntegration operation
#
##############################################################################
print_updateAdeIntegration_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateAdeIntegration - Update ADE integration${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for assignLibraryItem operation
#
##############################################################################
print_assignLibraryItem_help() {
    echo ""
    echo -e "${BOLD}${WHITE}assignLibraryItem - Assign Library Item${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows assigning a library item to a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=&quot;request-body&quot;>Request Body</h3>
<ul>
<li><p><code>library_item_id</code> (string, required)</p>
 </li>
<li><p><code>assignment_node_id</code> (string, required for maps)</p>
 <ul>
<li>Note: To find the assignment_node_id, view the map in a browser. Then, on your keyboard, press and hold the Option ⌥ key. Each node ID remains fixed for the lifespan of the node on the map.</li>
</ul>
</li>
</ul>
 <h3 id=&quot;error-responses&quot;>Error responses</h3>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
<td>&quot;Library Item already exists on Blueprint&quot;</td>
</tr>
<tr>
<td></td>
<td>&quot;Library Item already exists in Assignment Node&quot;</td>
</tr>
<tr>
<td></td>
 <td>&quot;assignment_node_id cannot be provided for Classic Blueprint&quot;</td>
 </tr>
<tr>
<td></td>
<td>&quot;Must provide assignment_node_id for Assignment Map Blueprint&quot;</td>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for createBlueprint operation
#
##############################################################################
print_createBlueprint_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createBlueprint - Create Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for deleteBlueprint operation
#
##############################################################################
print_deleteBlueprint_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteBlueprint - Delete Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<h1 id=&quot;warning&quot;><strong>WARNING!</strong></h1>
<p>This is a HIGHLY destructive action.</p>
<p>Deleting a Blueprint will un-manage ALL devices assigned to the Blueprint.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
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
# Print help for getBlueprint operation
#
##############################################################################
print_getBlueprint_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getBlueprint - Get Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns information about a specific blueprint based on blueprint ID.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getBlueprintTemplates operation
#
##############################################################################
print_getBlueprintTemplates_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getBlueprintTemplates - Get Blueprint Templates${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getManualEnrollmentProfile operation
#
##############################################################################
print_getManualEnrollmentProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getManualEnrollmentProfile - Get Manual Enrollment Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the manual enrollment profile (.mobileconfig file) for a specified Blueprint.</p>
<p>This request will return the enrollment profile even if &quot;Require Authentication&quot; is configured for the Blueprint in Manual Enrollment.</p>
<p>The enrollment profile will be returned in raw form with response headers:</p>
<ul>
<li><p><code>Content-Type</code> = <code>application/x-apple-aspen-config</code></p>
</li>
<li><p><code>Content-Disposition</code> = <code>attachment;filename=kandji-enroll.mobileconfig</code></p>
</li>
 </ul>
<p>An optional query parameter <code>sso=true</code> can be used to return a URL for SSO authentication instead. If this query parameter is used for a Blueprint that does not require authentication, then the enrollment profile will be returned.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sso${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Use the <code>sso</code> query parameter, set to <code>true</code>, to return a URL instead of the manual enrollment profile. This parameter should only be used for blueprints in which &quot;Require Authentication&quot; is configured for Manual Enrollment. The returned URL must be used to authenticate via SSO to receive an enrollment profile.${YELLOW} Specify as: sso=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Disposition${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Language${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listBlueprints operation
#
##############################################################################
print_listBlueprints_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listBlueprints - List Blueprints${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request returns a list of a blueprint records in the Kandji tenant. Optional query parameters can be specified to filter the results." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Look up a specific Blueprint by its ID${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id__in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify a list of Blueprint IDs to limit the results to.  Multiple values may be separated by commas. There is a double underscore (<code>__</code>) between id and in${YELLOW} Specify as: id__in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return Blueprint names &quot;containing&quot; the specified search string.${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listLibraryItems operation
#
##############################################################################
print_listLibraryItems_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listLibraryItems - List Library Items${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This API endpoint retrieves a list of library items associated with a specific blueprint. (classic and maps). Requires that the blueprint ID is passed as a path parameter in the URL.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=&quot;response-fields&quot;>Response fields</h3>
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
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for removeLibraryItem operation
#
##############################################################################
print_removeLibraryItem_help() {
    echo ""
    echo -e "${BOLD}${WHITE}removeLibraryItem - Remove Library Item${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint allows removing a library item from a specific blueprint (classic and maps). The response will include a list of library item IDs assigned to the blueprint.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>
<h3 id=&quot;request-body&quot;>Request Body</h3>
<ul>
<li><p><code>library_item_id</code> (string, required)</p>
 </li>
<li><p><code>assignment_node_id</code> (string, required for maps)</p>
 </li>
</ul>
<h3 id=&quot;error-responses&quot;>Error responses</h3>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
<td>&quot;assignment_node_id cannot be provided for Classic Blueprint&quot;</td>
</tr>
<tr>
<td></td>
<td>&quot;Must provide assignment_node_id for Assignment Map Blueprint&quot;</td>
</tr>
<tr>
 <td></td>
<td>&quot;Library Item does not exist on Blueprint&quot;</td>
 </tr>
<tr>
<td></td>
<td>&quot;Library Item does not exist in Assignment Node&quot;</td>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateBlueprint operation
#
##############################################################################
print_updateBlueprint_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateBlueprint - Update Blueprint${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This requests allows updating of the name, icon, icon color, description, enrollment code, and active status on an existing blueprint.</p>
 <h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>blueprint_id</code> (path parameter): The unique identifier of the blueprint.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: blueprint_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for createCustomApp operation
#
##############################################################################
print_createCustomApp_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createCustomApp - Create Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteCustomApp operation
#
##############################################################################
print_deleteCustomApp_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCustomApp - Delete Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom app from the Kandji library.</p>
 <h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getCustomApp operation
#
##############################################################################
print_getCustomApp_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomApp - Get Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom app from the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listCustomApps operation
#
##############################################################################
print_listCustomApps_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCustomApps - List Custom Apps${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint makes a request to retrieve a list of custom apps from the Kandji library." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Optional page number. Used when results exceed pagination threshold. A hard upper <code>limit</code> is set at 300 device records returned per request.${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateCustomApp operation
#
##############################################################################
print_updateCustomApp_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateCustomApp - Update Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom app in the Kandji library.</p>
<p>Must have already generated a <code>file_key</code> via <code>Create custom app</code> endpoint and uploaded the file to S3 using a request similar to the <code>Upload to S3</code> example.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for uploadCustomApp operation
#
##############################################################################
print_uploadCustomApp_help() {
    echo ""
    echo -e "${BOLD}${WHITE}uploadCustomApp - Upload Custom App${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for createCustomProfile operation
#
##############################################################################
print_createCustomProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createCustomProfile - Create Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request allows you to create a custom profile in the Kandji library." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteCustomProfile operation
#
##############################################################################
print_deleteCustomProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCustomProfile - Delete Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom profile from the Kandji library.</p>
 <h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getCustomProfile operation
#
##############################################################################
print_getCustomProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomProfile - Get Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom profile from the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listCustomProfiles operation
#
##############################################################################
print_listCustomProfiles_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCustomProfiles - List Custom Profiles${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint makes a request to retrieve a list of custom profiles from the Kandji library." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Optional page number (when results exceed pagination threshold)${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateCustomProfile operation
#
##############################################################################
print_updateCustomProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateCustomProfile - Update Custom Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to update a custom profile in the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
 <p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for createCustomScript operation
#
##############################################################################
print_createCustomScript_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createCustomScript - Create Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request allows you to create a custom script in the Kandji library." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;Created${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteCustomScript operation
#
##############################################################################
print_deleteCustomScript_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCustomScript - Delete Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom scripts from the Kandji library.</p>
 <h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;No Content${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getCustomScript operation
#
##############################################################################
print_getCustomScript_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCustomScript - Get Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves details about a specific custom script from the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listCustomScripts operation
#
##############################################################################
print_listCustomScripts_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCustomScripts - List Custom Scripts${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint makes a request to retrieve a list of custom scripts from the Kandji library." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Optional page number (when results exceed pagination threshold)${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateCustomScript operation
#
##############################################################################
print_updateCustomScript_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateCustomScript - Update Custom Script${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request allows you to update a custom script in the Kandji library." | paste -sd' ' | fold -sw 80
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
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for clearPasscode operation
#
##############################################################################
print_clearPasscode_help() {
    echo ""
    echo -e "${BOLD}${WHITE}clearPasscode - Clear Passcode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to clear a device passcode. Available for iPhone and iPad." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteDevice operation
#
##############################################################################
print_deleteDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteDevice - Delete Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to delete a device. This will remove the device record from Kandji and send a Remove Management command. For macOS devices, it will also send an uninstall command to the Kandji Agent at the next agent checkin." | paste -sd' ' | fold -sw 80
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
# Print help for deleteUser operation
#
##############################################################################
print_deleteUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUser - Delete User${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for eraseDevice operation
#
##############################################################################
print_eraseDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}eraseDevice - Erase Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to erase the device.</p>
 <p>iOS 4.0+, iPadOS 4.0+, macOS 10.7+, tvOS 10.2+</p>
<p><strong>Request Body Parameters: application/json</strong></p>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
# Print help for getDeviceCommands operation
#
##############################################################################
print_getDeviceCommands_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceCommands - Get Device Commands${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends a request to get information about the commands sent to a given device ID.</p>
<h3 id=&quot;mdm-status-codes&quot;>MDM Status Codes</h3>
<ul>
<li>1 : Command is Pending</li>
<li>2 : Command is running</li>
<li>3 : Command completed</li>
<li>4 : Command failed</li>
 <li>5 : Command received &quot;Not Now&quot; response</li>
</ul>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
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
# Print help for lockDevice operation
#
##############################################################################
print_lockDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}lockDevice - Lock Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to remotely lock a device.</p>
 <p>For macOS clients, an unlock PIN will be created, and returned in the response.</p>
 <blockquote>
<p><strong>Caution !!!</strong><br /><em>For a Mac with Apple silicon running a version of macOS before 11.5 will deactivate the Mac. To reactivate, the Mac requires a network connection and authentication by a Secure Token enabled local administrator.</em></p>
</blockquote>
<p>Optionally, a JSON payload can be sent in the request to set a lock message and phone number on the target device.</p>
<p><strong>Note:</strong> For macOS, although the lock message is displayed on all types of Mac computers, the phone number is displayed only on a Mac with Apple silicon.</p>
<h4 id=&quot;response-properties&quot;>Response properties</h4>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
    code=400
    echo -e "${result_color_table[${code:0:1}]}  400;Bad Request${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for reinstallAgent operation
#
##############################################################################
print_reinstallAgent_help() {
    echo ""
    echo -e "${BOLD}${WHITE}reinstallAgent - Reinstall Agent${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command reinstall the Kandji Agent. Available for macOS devices." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for remoteDesktop operation
#
##############################################################################
print_remoteDesktop_help() {
    echo ""
    echo -e "${BOLD}${WHITE}remoteDesktop - Remote Desktop${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for renewMdmProfile operation
#
##############################################################################
print_renewMdmProfile_help() {
    echo ""
    echo -e "${BOLD}${WHITE}renewMdmProfile - Renew MDM Profile${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to re-install the existing root MDM profile for a given device ID. This command will not impact any existing configurations, apps, or profiles." | paste -sd' ' | fold -sw 80
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
# Print help for restartDevice operation
#
##############################################################################
print_restartDevice_help() {
    echo ""
    echo -e "${BOLD}${WHITE}restartDevice - Restart Device${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for sendBlankpush operation
#
##############################################################################
print_sendBlankpush_help() {
    echo ""
    echo -e "${BOLD}${WHITE}sendBlankpush - Send Blankpush${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint sends an MDM command to initiate a blank push.</p>
 <p><a href=&quot;https://support.kandji.io/what-is-a-blank-push&quot;>Using the Blank Push command</a></p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for setName operation
#
##############################################################################
print_setName_help() {
    echo ""
    echo -e "${BOLD}${WHITE}setName - Set Name${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for shutdown operation
#
##############################################################################
print_shutdown_help() {
    echo ""
    echo -e "${BOLD}${WHITE}shutdown - Shutdown${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to shutdown a device." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for unlockAccount operation
#
##############################################################################
print_unlockAccount_help() {
    echo ""
    echo -e "${BOLD}${WHITE}unlockAccount - Unlock Account${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateInventory operation
#
##############################################################################
print_updateInventory_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateInventory - Update Inventory${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to start a check-in for a device, initiating the daily MDM commands and MDM logic." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for cancelLostMode operation
#
##############################################################################
print_cancelLostMode_help() {
    echo ""
    echo -e "${BOLD}${WHITE}cancelLostMode - Cancel Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint can be used to send a cancelation request if Lost Mode is in an error state for a given iOS or iPadOS device." | paste -sd' ' | fold -sw 80
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
# Print help for getDeviceActivity operation
#
##############################################################################
print_getDeviceActivity_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceActivity - Get Device Activity${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request returns the device activity for a specified Device ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getDeviceApps operation
#
##############################################################################
print_getDeviceApps_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceApps - Get Device Apps${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Link${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Count${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Pages${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getDeviceDetails operation
#
##############################################################################
print_getDeviceDetails_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceDetails - Get Device Details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request returns the device details for a specified Device ID." | paste -sd' ' | fold -sw 80
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
# Print help for getDeviceLibraryItems operation
#
##############################################################################
print_getDeviceLibraryItems_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceLibraryItems - Get Device Library Items${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request gets all library items and their statuses for a specified Device ID</p>
<h4 id=&quot;possible-library-item-status-values&quot;>Possible library item status values</h4>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getDeviceLostModeDetails operation
#
##############################################################################
print_getDeviceLostModeDetails_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceLostModeDetails - Get Device Lost Mode details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the device lost mode details for a specified Device ID.</p>
<p><strong>Note</strong>: Lost Mode is is only available for iOS and iPadOS. For more information, please see this <a href=&quot;https://support.kandji.io/a/solutions/articles/72000573873&quot;>Kandji support artilcle</a>.</p>" | paste -sd' ' | fold -sw 80
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
# Print help for getDeviceParameters operation
#
##############################################################################
print_getDeviceParameters_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceParameters - Get Device Parameters${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the parameters and their statuses for a specified Device ID</p>
<p>This endpoint is only applicable to macOS clients.</p>
 <p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=&quot;https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations&quot;>https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>
 <p><strong>Possible parameter status values</strong></p>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getDeviceStatus operation
#
##############################################################################
print_getDeviceStatus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceStatus - Get Device Status${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the full status (parameters and library items) for a specified Device ID.</p>
<p>The parameters will be returned as a list of IDs. These IDs can be correlated with the parameter names available here: <a href=&quot;https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations&quot;>https://github.com/kandji-inc/support/wiki/Devices-API---Parameter-Correlations</a></p>
 <h4 id=&quot;possible-status-values&quot;>Possible status values</h4>
<p><strong>Library items</strong></p>
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
<div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for listDevices operation
#
##############################################################################
print_listDevices_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listDevices - List Devices${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns a list of devices in a Kandji tenant. Optionally. query parameters can be used to filter results.</p>
<p>There is a hard upper limit of 300 results per request. To return addtional results pagination must be used. Pagination examples can be found in the Kandji support <a href=&quot;https://github.com/kandji-inc/support/tree/main/api-tools/code-examples&quot;>GitHub</a>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}asset_tag${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: asset_tag=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}blueprint_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results &quot;containing&quot; the specified blueprint id${YELLOW} Specify as: blueprint_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filevault_enabled${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>Query for devices that either have FileVault on (true) or off (false). This parameter only applies to macOS. </p>
<p>An empty list <code>[]</code> will be returned if no devices are found with the given parameter value.</p>${YELLOW} Specify as: filevault_enabled=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}mac_address${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a specific device by MAC address${YELLOW} Specify as: mac_address=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}model${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return model results &quot;containing&quot; the specified model string.${YELLOW} Specify as: model=value${OFF}" \
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
    echo -e "  * ${GREEN}os_version${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return all device records with the specified OS version${YELLOW} Specify as: os_version=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}platform${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return all records matching a specific platform. Possible values:<code>Mac</code>, <code>iPad</code>, <code>iPhone</code>, <code>AppleTV</code>${YELLOW} Specify as: platform=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}serial_number${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.${YELLOW} Specify as: serial_number=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results for given tag name. Case sensitive.${YELLOW} Specify as: tag_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_name_in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results for given tag names separate by commas. Case sensitive.${YELLOW} Specify as: tag_name_in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a tag by its ID. Case sensitive.${YELLOW} Specify as: tag_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}tag_id_in${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results for given tag IDs separated by commas. Case sensitive.${YELLOW} Specify as: tag_id_in=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results &quot;containing&quot; the user name${YELLOW} Specify as: user=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results &quot;containing&quot; search on email address${YELLOW} Specify as: user_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - &quot;exact&quot; match on kandji user ID number${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return results &quot;containing&quot; the assigned user Display Name${YELLOW} Specify as: user_name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
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
# Print help for getActivationLockBypassCode operation
#
##############################################################################
print_getActivationLockBypassCode_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getActivationLockBypassCode - Get Activation Lock Bypass Code${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the Activation Lock Bypass code.</p>
<p>user_based_albc is the user-based Activation Lock bypass code for when Activation Lock is enabled using an personal Apple ID and Find My.</p>
 <p>device_based_albc is the device-based Activation Lock bypass code for when Activation Lock is enabled by the MDM server.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getFilevaultRecoveryKey operation
#
##############################################################################
print_getFilevaultRecoveryKey_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getFilevaultRecoveryKey - Get FileVault Recovery Key${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the FileVault Recovery key for a macOS device.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getRecoveryLockPassword operation
#
##############################################################################
print_getRecoveryLockPassword_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRecoveryLockPassword - Get Recovery Lock Password${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request returns the Recovery Lock password for a Mac with an Apple Silicon processor and the legacy EFI firmware password for a Mac with an Intel processor.</p>
<p>For more details on setting and managing Recovery passwords, see this <a href=&quot;https://support.kandji.io/support/solutions/articles/72000560472-configure-the-recovery-password-library-item&quot;>Kandji support article</a>.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
 <p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getUnlockPin operation
#
##############################################################################
print_getUnlockPin_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUnlockPin - Get Unlock Pin${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This request allows you to retrieve the device unlock pin for a macOS device.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
 <p><code>device_id</code> (path parameter): The unique identifier of the device.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getLibraryItemActivity operation
#
##############################################################################
print_getLibraryItemActivity_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getLibraryItemActivity - Get Library Item Activity${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the activity related to a specific library item. Activity is listed from newest to oldest.</p>
<p>To see a delta of the activity events between now and the last request, you can store the newest entry from the previous request and then look for that entry in the next request. Any entry post that will be the delta.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}activity_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter actions by this activity type. Choices are: library_item_created, library_item_edited, library_item_deleted, library_item_duplicated, library_item_assignment_changed${YELLOW} Specify as: activity_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter actions by this user (id)${YELLOW} Specify as: user_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}user_email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter actions by this user (email)${YELLOW} Specify as: user_email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getLibraryItemStatuses operation
#
##############################################################################
print_getLibraryItemStatuses_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getLibraryItemStatuses - Get Library Item Statuses${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves the statuses related to a specific library item.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
 <p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}library_item_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: library_item_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}computer_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Query for the status of one device.${YELLOW} Specify as: computer_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for disableLostMode operation
#
##############################################################################
print_disableLostMode_help() {
    echo ""
    echo -e "${BOLD}${WHITE}disableLostMode - Disable Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This command will send a request to turn off lost mode on iOS and iPadOS.</p>
<p>If the command is already pending, the message &quot;<em>Disable lost mode is already pending for this device.</em>&quot; will be in the response.</p>" | paste -sd' ' | fold -sw 80
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
# Print help for enableLostMode operation
#
##############################################################################
print_enableLostMode_help() {
    echo ""
    echo -e "${BOLD}${WHITE}enableLostMode - Enable Lost Mode${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for playLostModeSound operation
#
##############################################################################
print_playLostModeSound_help() {
    echo ""
    echo -e "${BOLD}${WHITE}playLostModeSound - Play Lost Mode Sound${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
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
# Print help for updateLocation operation
#
##############################################################################
print_updateLocation_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateLocation - Update Location${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This endpoint sends an MDM command to update the location data on iOS and iPadOS." | paste -sd' ' | fold -sw 80
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
# Print help for createDeviceNote operation
#
##############################################################################
print_createDeviceNote_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createDeviceNote - Create Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request creates a note for the specified device ID." | paste -sd' ' | fold -sw 80
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for deleteDeviceNote operation
#
##############################################################################
print_deleteDeviceNote_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteDeviceNote - Delete Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request deletes a specified note (Note ID) for the specified Device ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for getDeviceNotes operation
#
##############################################################################
print_getDeviceNotes_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getDeviceNotes - Get Device Notes${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request gets all notes for the specified Device ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Link${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Count${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Total-Pages${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for retrieveDeviceNote operation
#
##############################################################################
print_retrieveDeviceNote_help() {
    echo ""
    echo -e "${BOLD}${WHITE}retrieveDeviceNote - Retrieve Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request retrieves a specified note (Note ID) for the specified Device ID." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: device_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}note_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: note_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for updateDeviceNote operation
#
##############################################################################
print_updateDeviceNote_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateDeviceNote - Update Device Note${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This request patches a specified note (Note ID) for the specified Device ID." | paste -sd' ' | fold -sw 80
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
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Strict-Transport-Security${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-XSS-Protection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for activationLock operation
#
##############################################################################
print_activationLock_help() {
    echo ""
    echo -e "${BOLD}${WHITE}activationLock - Activation lock${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get activation lock attributes for devices." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for applicationFirewall operation
#
##############################################################################
print_applicationFirewall_help() {
    echo ""
    echo -e "${BOLD}${WHITE}applicationFirewall - Application firewall${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Application Firewall details for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for applications operation
#
##############################################################################
print_applications_help() {
    echo ""
    echo -e "${BOLD}${WHITE}applications - Applications${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get the applications installed on macOS, iOS, iPadOS, and tvOS devices." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for certificates operation
#
##############################################################################
print_certificates_help() {
    echo ""
    echo -e "${BOLD}${WHITE}certificates - Certificates${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get certificate details." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Accept-Ranges${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Via${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Cache-Hits${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Proxy-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Kong-Upstream-Latency${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Limit-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Hour${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Ratelimit-Remaining-Second${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Served-By${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Timer${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}transfer-encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for count operation
#
##############################################################################
print_count_help() {
    echo ""
    echo -e "${BOLD}${WHITE}count - Count${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get the total record count for the specified Prism category.</p>
 <p>If a category contains spaces substitute the spaces for underscores (&quot;_&quot;) when using the API query.</p>
<p>Example: <code>Device information</code> becomes <code>device_information</code>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}category${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - <p>Return the count of records for the specified category. 
 If a category contains spaces substitute the spaces for underscores (&quot;_&quot;) when using the API query.</p>
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
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for desktopAndScreensaver operation
#
##############################################################################
print_desktopAndScreensaver_help() {
    echo ""
    echo -e "${BOLD}${WHITE}desktopAndScreensaver - Desktop and Screensaver${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Desktop and Screensaver details for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for deviceInformation operation
#
##############################################################################
print_deviceInformation_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deviceInformation - Device information${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get attributes about devices." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - <p>JSON schema object containing one or more key value pairs.</p>
 <p>Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p>${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for filevault operation
#
##############################################################################
print_filevault_help() {
    echo ""
    echo -e "${BOLD}${WHITE}filevault - FileVault${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get FileVault information for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for gatekeeperAndXprotect operation
#
##############################################################################
print_gatekeeperAndXprotect_help() {
    echo ""
    echo -e "${BOLD}${WHITE}gatekeeperAndXprotect - Gatekeeper and XProtect${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Gatekeeper and XProtect attributes for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Results are limited to Mac only as Gatekeeper and XProtect are not applicable for other platfroms.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for getCategoryExport operation
#
##############################################################################
print_getCategoryExport_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCategoryExport - Get category export${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Get an export request's status. To download the export, use the <code>signed_url</code>. This will download a CSV file containing the exported category information.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p>export_id (path parameter): The unique identifier of the the export job.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}export_id${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: export_id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for installedProfiles operation
#
##############################################################################
print_installedProfiles_help() {
    echo ""
    echo -e "${BOLD}${WHITE}installedProfiles - Installed profiles${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Installed Profiles attributes for macOS, iOS, iPadOS, and tvOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for kernelExtensions operation
#
##############################################################################
print_kernelExtensions_help() {
    echo ""
    echo -e "${BOLD}${WHITE}kernelExtensions - Kernel Extensions${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Kernel Extension attributes for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - SON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for launchAgentsAndDaemons operation
#
##############################################################################
print_launchAgentsAndDaemons_help() {
    echo ""
    echo -e "${BOLD}${WHITE}launchAgentsAndDaemons - Launch Agents and Daemons${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Launch Agents and Daemons installed on macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for localUsers operation
#
##############################################################################
print_localUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}localUsers - Local users${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Local Users detials for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for requestCategoryExport operation
#
##############################################################################
print_requestCategoryExport_help() {
    echo ""
    echo -e "${BOLD}${WHITE}requestCategoryExport - Request category export${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Request export of a category. The <code>id</code> key is used when checking the export status using the <em>Request category export</em> endpoint.</p>
<p><strong>Request Body Parameters: application/json</strong></p>
 <div class=&quot;click-to-expand-wrapper is-table-wrapper&quot;><table>
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
 <td><code>[&quot;string&quot;, &quot;string&quot;, &quot;string&quot;]</code></td>
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
<td><code>[&quot;Mac&quot;, &quot;iPhone&quot;, &quot;iPad&quot;, &quot;tvOS&quot;]</code></td>
<td>List of one or more comma separted string values for device families.</td>
</tr>
<tr>
<td><code>filter</code></td>
 <td><code>object</code></td>
<td><code>{&quot;apple_silicon&quot;: {&quot;eq&quot;: true}, &quot;device__name&quot;: {&quot;like&quot;: [&quot;this&quot;, &quot;or_this&quot;]}}</code></td>
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
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for startupSettings operation
#
##############################################################################
print_startupSettings_help() {
    echo ""
    echo -e "${BOLD}${WHITE}startupSettings - Startup settings${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Startup settings for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for systemExtensions operation
#
##############################################################################
print_systemExtensions_help() {
    echo ""
    echo -e "${BOLD}${WHITE}systemExtensions - System Extensions${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get System Extension attributes for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for transparencyDatabase operation
#
##############################################################################
print_transparencyDatabase_help() {
    echo ""
    echo -e "${BOLD}${WHITE}transparencyDatabase - Transparency database${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get Transparency Database (TCC) attributes for macOS." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}blueprint_ids${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more blueprint IDs separated by commas.${YELLOW} Specify as: blueprint_ids=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_families${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter results by one or more device families separate by commas.${YELLOW} Specify as: device_families=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - JSON schema object containing one or more key value pairs.
 Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order.${YELLOW} Specify as: sort_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Access-Control-Allow-Origin${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Connection${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Limit${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Remaining${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Ratelimit-Reset${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Transfer-Encoding${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
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
# Print help for listSelfServiceCategories operation
#
##############################################################################
print_listSelfServiceCategories_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listSelfServiceCategories - List Self Service Categories${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint retrieves a list of self-service categories and their associated IDs.</p>
<p>If you are planning to make a Library item available in Self Service under a specific category, you can call this endpoint to get the category ID and then use that ID when creating or updating the library item via the Kandji API.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        echo -e "       ${BOLD}${WHITE}Response headers${OFF}"
        echo -e "       ${BLUE}Allow${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Length${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Security-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Content-Type${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Cross-Origin-Opener-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Date${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Feature-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Referrer-Policy${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Server${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}Vary${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Content-Type-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
        echo -e "       ${BLUE}X-Frame-Options${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/        /'
}
##############################################################################
#
# Print help for licensing operation
#
##############################################################################
print_licensing_help() {
    echo ""
    echo -e "${BOLD}${WHITE}licensing - Licensing${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Returns Kandji tenant licensing and utilization information." | paste -sd' ' | fold -sw 80
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
# Print help for createTag operation
#
##############################################################################
print_createTag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createTag - Create Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Create a tag. Can only create one tag per request." | paste -sd' ' | fold -sw 80
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
# Print help for deleteTag operation
#
##############################################################################
print_deleteTag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteTag - Delete Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Delete a tag.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
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
# Print help for getTags operation
#
##############################################################################
print_getTags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getTags - Get Tags${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Return configured tags." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}search${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - Return resultes containing a given tag search string.${YELLOW} Specify as: search=value${OFF}" \
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
# Print help for updateTag operation
#
##############################################################################
print_updateTag_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateTag - Update Tag${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>Update tag name.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
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
# Print help for getThreatDetails operation
#
##############################################################################
print_getThreatDetails_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getThreatDetails - Get Threat Details${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "Get threat details." | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}classification${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return all records matching a specified classification. The following classification options are available: <code>malware</code> and <code>pup</code>. Leave this parameter empty to return all classification types.${YELLOW} Specify as: classification=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}date_range${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return all records within a specified number of days. Any positive number of days may be specified. Examples: <code>7</code>, <code>30</code>, <code>60</code>, <code>90</code>, <code>180</code>, or <code>365</code>.${YELLOW} Specify as: date_range=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}device_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - ${YELLOW} Specify as: device_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}status${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return all records matching a specified status. The following status options are available: <code>quarantined</code>, <code>not_quarantined</code>, or <code>released</code>. Leave this parameter empty to return all status types.${YELLOW} Specify as: status=value${OFF}" \
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
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Specify the starting record to return${YELLOW} Specify as: offset=value${OFF}" \
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
# Print help for getUser operation
#
##############################################################################
print_getUser_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUser - Get User${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a specified user directory integration user by id.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
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
# Print help for listUsers operation
#
##############################################################################
print_listUsers_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listUsers - List Users${OFF}${BLUE}(AUTH - )${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "<p>This endpoint makes a request to retrieve a list of users from user directory integrations.</p>
<p>A maximum of 300 records are returned per request, and pagination can be performed leveraging the URLs provided in the <code>next</code> and <code>previous</code> keys in the response. If there are no more results available, the respective key will be <code>null</code>.</p>" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}email${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Returns users with email addresses containing the provided string.${YELLOW} Specify as: email=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a user matching the provided UUID value.${YELLOW} Specify as: id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}integration_id${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Search for a integration matching the provided UUID value.${YELLOW} Specify as: integration_id=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}archived${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Return only users that are either archived (true) or not archived (false). Archived users are users that appear in the Kandji Users module under the Archived tab.${YELLOW} Specify as: archived=value${OFF}" \
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
# Call createAdeIntegration operation
#
##############################################################################
call_createAdeIntegration() {
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
# Call deleteAdeIntegration operation
#
##############################################################################
call_deleteAdeIntegration() {
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
# Call downloadAdePublicKey operation
#
##############################################################################
call_downloadAdePublicKey() {
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
# Call getAdeDevice operation
#
##############################################################################
call_getAdeDevice() {
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
# Call getAdeIntegration operation
#
##############################################################################
call_getAdeIntegration() {
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
# Call listAdeDevices operation
#
##############################################################################
call_listAdeDevices() {
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
# Call listAdeIntegrations operation
#
##############################################################################
call_listAdeIntegrations() {
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
# Call listDevicesAssociatedToAdeToken operation
#
##############################################################################
call_listDevicesAssociatedToAdeToken() {
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
# Call renewAdeIntegration operation
#
##############################################################################
call_renewAdeIntegration() {
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
# Call updateAdeDevice operation
#
##############################################################################
call_updateAdeDevice() {
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
# Call updateAdeIntegration operation
#
##############################################################################
call_updateAdeIntegration() {
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
# Call assignLibraryItem operation
#
##############################################################################
call_assignLibraryItem() {
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
# Call createBlueprint operation
#
##############################################################################
call_createBlueprint() {
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
# Call deleteBlueprint operation
#
##############################################################################
call_deleteBlueprint() {
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
# Call getBlueprint operation
#
##############################################################################
call_getBlueprint() {
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
# Call getBlueprintTemplates operation
#
##############################################################################
call_getBlueprintTemplates() {
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
# Call getManualEnrollmentProfile operation
#
##############################################################################
call_getManualEnrollmentProfile() {
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
# Call listBlueprints operation
#
##############################################################################
call_listBlueprints() {
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
# Call listLibraryItems operation
#
##############################################################################
call_listLibraryItems() {
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
# Call removeLibraryItem operation
#
##############################################################################
call_removeLibraryItem() {
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
# Call updateBlueprint operation
#
##############################################################################
call_updateBlueprint() {
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
# Call createCustomApp operation
#
##############################################################################
call_createCustomApp() {
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
# Call deleteCustomApp operation
#
##############################################################################
call_deleteCustomApp() {
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
# Call getCustomApp operation
#
##############################################################################
call_getCustomApp() {
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
# Call listCustomApps operation
#
##############################################################################
call_listCustomApps() {
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
# Call updateCustomApp operation
#
##############################################################################
call_updateCustomApp() {
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
# Call uploadCustomApp operation
#
##############################################################################
call_uploadCustomApp() {
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
# Call createCustomProfile operation
#
##############################################################################
call_createCustomProfile() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
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
# Call deleteCustomProfile operation
#
##############################################################################
call_deleteCustomProfile() {
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
# Call getCustomProfile operation
#
##############################################################################
call_getCustomProfile() {
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
# Call listCustomProfiles operation
#
##############################################################################
call_listCustomProfiles() {
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
# Call updateCustomProfile operation
#
##############################################################################
call_updateCustomProfile() {
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
# Call createCustomScript operation
#
##############################################################################
call_createCustomScript() {
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
# Call deleteCustomScript operation
#
##############################################################################
call_deleteCustomScript() {
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
# Call getCustomScript operation
#
##############################################################################
call_getCustomScript() {
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
# Call listCustomScripts operation
#
##############################################################################
call_listCustomScripts() {
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
# Call updateCustomScript operation
#
##############################################################################
call_updateCustomScript() {
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
# Call clearPasscode operation
#
##############################################################################
call_clearPasscode() {
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
# Call deleteDevice operation
#
##############################################################################
call_deleteDevice() {
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
# Call deleteUser operation
#
##############################################################################
call_deleteUser() {
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
# Call eraseDevice operation
#
##############################################################################
call_eraseDevice() {
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
# Call getDeviceCommands operation
#
##############################################################################
call_getDeviceCommands() {
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
# Call lockDevice operation
#
##############################################################################
call_lockDevice() {
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
# Call reinstallAgent operation
#
##############################################################################
call_reinstallAgent() {
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
# Call remoteDesktop operation
#
##############################################################################
call_remoteDesktop() {
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
# Call renewMdmProfile operation
#
##############################################################################
call_renewMdmProfile() {
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
# Call restartDevice operation
#
##############################################################################
call_restartDevice() {
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
# Call sendBlankpush operation
#
##############################################################################
call_sendBlankpush() {
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
# Call setName operation
#
##############################################################################
call_setName() {
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
# Call shutdown operation
#
##############################################################################
call_shutdown() {
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
# Call unlockAccount operation
#
##############################################################################
call_unlockAccount() {
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
# Call updateInventory operation
#
##############################################################################
call_updateInventory() {
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
# Call cancelLostMode operation
#
##############################################################################
call_cancelLostMode() {
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
# Call getDeviceActivity operation
#
##############################################################################
call_getDeviceActivity() {
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
# Call getDeviceApps operation
#
##############################################################################
call_getDeviceApps() {
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
# Call getDeviceDetails operation
#
##############################################################################
call_getDeviceDetails() {
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
# Call getDeviceLibraryItems operation
#
##############################################################################
call_getDeviceLibraryItems() {
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
# Call getDeviceLostModeDetails operation
#
##############################################################################
call_getDeviceLostModeDetails() {
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
# Call getDeviceParameters operation
#
##############################################################################
call_getDeviceParameters() {
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
# Call getDeviceStatus operation
#
##############################################################################
call_getDeviceStatus() {
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
# Call listDevices operation
#
##############################################################################
call_listDevices() {
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
# Call getActivationLockBypassCode operation
#
##############################################################################
call_getActivationLockBypassCode() {
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
# Call getFilevaultRecoveryKey operation
#
##############################################################################
call_getFilevaultRecoveryKey() {
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
# Call getRecoveryLockPassword operation
#
##############################################################################
call_getRecoveryLockPassword() {
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
# Call getUnlockPin operation
#
##############################################################################
call_getUnlockPin() {
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
# Call getLibraryItemActivity operation
#
##############################################################################
call_getLibraryItemActivity() {
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
# Call getLibraryItemStatuses operation
#
##############################################################################
call_getLibraryItemStatuses() {
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
# Call disableLostMode operation
#
##############################################################################
call_disableLostMode() {
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
# Call enableLostMode operation
#
##############################################################################
call_enableLostMode() {
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
# Call playLostModeSound operation
#
##############################################################################
call_playLostModeSound() {
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
# Call updateLocation operation
#
##############################################################################
call_updateLocation() {
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
# Call createDeviceNote operation
#
##############################################################################
call_createDeviceNote() {
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
# Call deleteDeviceNote operation
#
##############################################################################
call_deleteDeviceNote() {
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
# Call getDeviceNotes operation
#
##############################################################################
call_getDeviceNotes() {
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
# Call retrieveDeviceNote operation
#
##############################################################################
call_retrieveDeviceNote() {
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
# Call updateDeviceNote operation
#
##############################################################################
call_updateDeviceNote() {
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
# Call activationLock operation
#
##############################################################################
call_activationLock() {
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
# Call applicationFirewall operation
#
##############################################################################
call_applicationFirewall() {
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
# Call applications operation
#
##############################################################################
call_applications() {
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
# Call certificates operation
#
##############################################################################
call_certificates() {
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
# Call count operation
#
##############################################################################
call_count() {
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
# Call desktopAndScreensaver operation
#
##############################################################################
call_desktopAndScreensaver() {
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
# Call deviceInformation operation
#
##############################################################################
call_deviceInformation() {
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
# Call filevault operation
#
##############################################################################
call_filevault() {
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
# Call gatekeeperAndXprotect operation
#
##############################################################################
call_gatekeeperAndXprotect() {
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
# Call getCategoryExport operation
#
##############################################################################
call_getCategoryExport() {
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
# Call installedProfiles operation
#
##############################################################################
call_installedProfiles() {
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
# Call kernelExtensions operation
#
##############################################################################
call_kernelExtensions() {
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
# Call launchAgentsAndDaemons operation
#
##############################################################################
call_launchAgentsAndDaemons() {
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
# Call localUsers operation
#
##############################################################################
call_localUsers() {
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
# Call requestCategoryExport operation
#
##############################################################################
call_requestCategoryExport() {
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
# Call startupSettings operation
#
##############################################################################
call_startupSettings() {
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
# Call systemExtensions operation
#
##############################################################################
call_systemExtensions() {
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
# Call transparencyDatabase operation
#
##############################################################################
call_transparencyDatabase() {
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
# Call listSelfServiceCategories operation
#
##############################################################################
call_listSelfServiceCategories() {
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
# Call licensing operation
#
##############################################################################
call_licensing() {
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
# Call createTag operation
#
##############################################################################
call_createTag() {
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
# Call deleteTag operation
#
##############################################################################
call_deleteTag() {
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
# Call getTags operation
#
##############################################################################
call_getTags() {
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
# Call updateTag operation
#
##############################################################################
call_updateTag() {
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
# Call getThreatDetails operation
#
##############################################################################
call_getThreatDetails() {
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
# Call getUser operation
#
##############################################################################
call_getUser() {
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
# Call listUsers operation
#
##############################################################################
call_listUsers() {
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
    createAdeIntegration)
    operation="createAdeIntegration"
    ;;
    deleteAdeIntegration)
    operation="deleteAdeIntegration"
    ;;
    downloadAdePublicKey)
    operation="downloadAdePublicKey"
    ;;
    getAdeDevice)
    operation="getAdeDevice"
    ;;
    getAdeIntegration)
    operation="getAdeIntegration"
    ;;
    listAdeDevices)
    operation="listAdeDevices"
    ;;
    listAdeIntegrations)
    operation="listAdeIntegrations"
    ;;
    listDevicesAssociatedToAdeToken)
    operation="listDevicesAssociatedToAdeToken"
    ;;
    renewAdeIntegration)
    operation="renewAdeIntegration"
    ;;
    updateAdeDevice)
    operation="updateAdeDevice"
    ;;
    updateAdeIntegration)
    operation="updateAdeIntegration"
    ;;
    assignLibraryItem)
    operation="assignLibraryItem"
    ;;
    createBlueprint)
    operation="createBlueprint"
    ;;
    deleteBlueprint)
    operation="deleteBlueprint"
    ;;
    getBlueprint)
    operation="getBlueprint"
    ;;
    getBlueprintTemplates)
    operation="getBlueprintTemplates"
    ;;
    getManualEnrollmentProfile)
    operation="getManualEnrollmentProfile"
    ;;
    listBlueprints)
    operation="listBlueprints"
    ;;
    listLibraryItems)
    operation="listLibraryItems"
    ;;
    removeLibraryItem)
    operation="removeLibraryItem"
    ;;
    updateBlueprint)
    operation="updateBlueprint"
    ;;
    createCustomApp)
    operation="createCustomApp"
    ;;
    deleteCustomApp)
    operation="deleteCustomApp"
    ;;
    getCustomApp)
    operation="getCustomApp"
    ;;
    listCustomApps)
    operation="listCustomApps"
    ;;
    updateCustomApp)
    operation="updateCustomApp"
    ;;
    uploadCustomApp)
    operation="uploadCustomApp"
    ;;
    createCustomProfile)
    operation="createCustomProfile"
    ;;
    deleteCustomProfile)
    operation="deleteCustomProfile"
    ;;
    getCustomProfile)
    operation="getCustomProfile"
    ;;
    listCustomProfiles)
    operation="listCustomProfiles"
    ;;
    updateCustomProfile)
    operation="updateCustomProfile"
    ;;
    createCustomScript)
    operation="createCustomScript"
    ;;
    deleteCustomScript)
    operation="deleteCustomScript"
    ;;
    getCustomScript)
    operation="getCustomScript"
    ;;
    listCustomScripts)
    operation="listCustomScripts"
    ;;
    updateCustomScript)
    operation="updateCustomScript"
    ;;
    clearPasscode)
    operation="clearPasscode"
    ;;
    deleteDevice)
    operation="deleteDevice"
    ;;
    deleteUser)
    operation="deleteUser"
    ;;
    eraseDevice)
    operation="eraseDevice"
    ;;
    getDeviceCommands)
    operation="getDeviceCommands"
    ;;
    lockDevice)
    operation="lockDevice"
    ;;
    reinstallAgent)
    operation="reinstallAgent"
    ;;
    remoteDesktop)
    operation="remoteDesktop"
    ;;
    renewMdmProfile)
    operation="renewMdmProfile"
    ;;
    restartDevice)
    operation="restartDevice"
    ;;
    sendBlankpush)
    operation="sendBlankpush"
    ;;
    setName)
    operation="setName"
    ;;
    shutdown)
    operation="shutdown"
    ;;
    unlockAccount)
    operation="unlockAccount"
    ;;
    updateInventory)
    operation="updateInventory"
    ;;
    cancelLostMode)
    operation="cancelLostMode"
    ;;
    getDeviceActivity)
    operation="getDeviceActivity"
    ;;
    getDeviceApps)
    operation="getDeviceApps"
    ;;
    getDeviceDetails)
    operation="getDeviceDetails"
    ;;
    getDeviceLibraryItems)
    operation="getDeviceLibraryItems"
    ;;
    getDeviceLostModeDetails)
    operation="getDeviceLostModeDetails"
    ;;
    getDeviceParameters)
    operation="getDeviceParameters"
    ;;
    getDeviceStatus)
    operation="getDeviceStatus"
    ;;
    listDevices)
    operation="listDevices"
    ;;
    getActivationLockBypassCode)
    operation="getActivationLockBypassCode"
    ;;
    getFilevaultRecoveryKey)
    operation="getFilevaultRecoveryKey"
    ;;
    getRecoveryLockPassword)
    operation="getRecoveryLockPassword"
    ;;
    getUnlockPin)
    operation="getUnlockPin"
    ;;
    getLibraryItemActivity)
    operation="getLibraryItemActivity"
    ;;
    getLibraryItemStatuses)
    operation="getLibraryItemStatuses"
    ;;
    disableLostMode)
    operation="disableLostMode"
    ;;
    enableLostMode)
    operation="enableLostMode"
    ;;
    playLostModeSound)
    operation="playLostModeSound"
    ;;
    updateLocation)
    operation="updateLocation"
    ;;
    createDeviceNote)
    operation="createDeviceNote"
    ;;
    deleteDeviceNote)
    operation="deleteDeviceNote"
    ;;
    getDeviceNotes)
    operation="getDeviceNotes"
    ;;
    retrieveDeviceNote)
    operation="retrieveDeviceNote"
    ;;
    updateDeviceNote)
    operation="updateDeviceNote"
    ;;
    activationLock)
    operation="activationLock"
    ;;
    applicationFirewall)
    operation="applicationFirewall"
    ;;
    applications)
    operation="applications"
    ;;
    certificates)
    operation="certificates"
    ;;
    count)
    operation="count"
    ;;
    desktopAndScreensaver)
    operation="desktopAndScreensaver"
    ;;
    deviceInformation)
    operation="deviceInformation"
    ;;
    filevault)
    operation="filevault"
    ;;
    gatekeeperAndXprotect)
    operation="gatekeeperAndXprotect"
    ;;
    getCategoryExport)
    operation="getCategoryExport"
    ;;
    installedProfiles)
    operation="installedProfiles"
    ;;
    kernelExtensions)
    operation="kernelExtensions"
    ;;
    launchAgentsAndDaemons)
    operation="launchAgentsAndDaemons"
    ;;
    localUsers)
    operation="localUsers"
    ;;
    requestCategoryExport)
    operation="requestCategoryExport"
    ;;
    startupSettings)
    operation="startupSettings"
    ;;
    systemExtensions)
    operation="systemExtensions"
    ;;
    transparencyDatabase)
    operation="transparencyDatabase"
    ;;
    listSelfServiceCategories)
    operation="listSelfServiceCategories"
    ;;
    licensing)
    operation="licensing"
    ;;
    createTag)
    operation="createTag"
    ;;
    deleteTag)
    operation="deleteTag"
    ;;
    getTags)
    operation="getTags"
    ;;
    updateTag)
    operation="updateTag"
    ;;
    getThreatDetails)
    operation="getThreatDetails"
    ;;
    getUser)
    operation="getUser"
    ;;
    listUsers)
    operation="listUsers"
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
    createAdeIntegration)
    call_createAdeIntegration
    ;;
    deleteAdeIntegration)
    call_deleteAdeIntegration
    ;;
    downloadAdePublicKey)
    call_downloadAdePublicKey
    ;;
    getAdeDevice)
    call_getAdeDevice
    ;;
    getAdeIntegration)
    call_getAdeIntegration
    ;;
    listAdeDevices)
    call_listAdeDevices
    ;;
    listAdeIntegrations)
    call_listAdeIntegrations
    ;;
    listDevicesAssociatedToAdeToken)
    call_listDevicesAssociatedToAdeToken
    ;;
    renewAdeIntegration)
    call_renewAdeIntegration
    ;;
    updateAdeDevice)
    call_updateAdeDevice
    ;;
    updateAdeIntegration)
    call_updateAdeIntegration
    ;;
    assignLibraryItem)
    call_assignLibraryItem
    ;;
    createBlueprint)
    call_createBlueprint
    ;;
    deleteBlueprint)
    call_deleteBlueprint
    ;;
    getBlueprint)
    call_getBlueprint
    ;;
    getBlueprintTemplates)
    call_getBlueprintTemplates
    ;;
    getManualEnrollmentProfile)
    call_getManualEnrollmentProfile
    ;;
    listBlueprints)
    call_listBlueprints
    ;;
    listLibraryItems)
    call_listLibraryItems
    ;;
    removeLibraryItem)
    call_removeLibraryItem
    ;;
    updateBlueprint)
    call_updateBlueprint
    ;;
    createCustomApp)
    call_createCustomApp
    ;;
    deleteCustomApp)
    call_deleteCustomApp
    ;;
    getCustomApp)
    call_getCustomApp
    ;;
    listCustomApps)
    call_listCustomApps
    ;;
    updateCustomApp)
    call_updateCustomApp
    ;;
    uploadCustomApp)
    call_uploadCustomApp
    ;;
    createCustomProfile)
    call_createCustomProfile
    ;;
    deleteCustomProfile)
    call_deleteCustomProfile
    ;;
    getCustomProfile)
    call_getCustomProfile
    ;;
    listCustomProfiles)
    call_listCustomProfiles
    ;;
    updateCustomProfile)
    call_updateCustomProfile
    ;;
    createCustomScript)
    call_createCustomScript
    ;;
    deleteCustomScript)
    call_deleteCustomScript
    ;;
    getCustomScript)
    call_getCustomScript
    ;;
    listCustomScripts)
    call_listCustomScripts
    ;;
    updateCustomScript)
    call_updateCustomScript
    ;;
    clearPasscode)
    call_clearPasscode
    ;;
    deleteDevice)
    call_deleteDevice
    ;;
    deleteUser)
    call_deleteUser
    ;;
    eraseDevice)
    call_eraseDevice
    ;;
    getDeviceCommands)
    call_getDeviceCommands
    ;;
    lockDevice)
    call_lockDevice
    ;;
    reinstallAgent)
    call_reinstallAgent
    ;;
    remoteDesktop)
    call_remoteDesktop
    ;;
    renewMdmProfile)
    call_renewMdmProfile
    ;;
    restartDevice)
    call_restartDevice
    ;;
    sendBlankpush)
    call_sendBlankpush
    ;;
    setName)
    call_setName
    ;;
    shutdown)
    call_shutdown
    ;;
    unlockAccount)
    call_unlockAccount
    ;;
    updateInventory)
    call_updateInventory
    ;;
    cancelLostMode)
    call_cancelLostMode
    ;;
    getDeviceActivity)
    call_getDeviceActivity
    ;;
    getDeviceApps)
    call_getDeviceApps
    ;;
    getDeviceDetails)
    call_getDeviceDetails
    ;;
    getDeviceLibraryItems)
    call_getDeviceLibraryItems
    ;;
    getDeviceLostModeDetails)
    call_getDeviceLostModeDetails
    ;;
    getDeviceParameters)
    call_getDeviceParameters
    ;;
    getDeviceStatus)
    call_getDeviceStatus
    ;;
    listDevices)
    call_listDevices
    ;;
    getActivationLockBypassCode)
    call_getActivationLockBypassCode
    ;;
    getFilevaultRecoveryKey)
    call_getFilevaultRecoveryKey
    ;;
    getRecoveryLockPassword)
    call_getRecoveryLockPassword
    ;;
    getUnlockPin)
    call_getUnlockPin
    ;;
    getLibraryItemActivity)
    call_getLibraryItemActivity
    ;;
    getLibraryItemStatuses)
    call_getLibraryItemStatuses
    ;;
    disableLostMode)
    call_disableLostMode
    ;;
    enableLostMode)
    call_enableLostMode
    ;;
    playLostModeSound)
    call_playLostModeSound
    ;;
    updateLocation)
    call_updateLocation
    ;;
    createDeviceNote)
    call_createDeviceNote
    ;;
    deleteDeviceNote)
    call_deleteDeviceNote
    ;;
    getDeviceNotes)
    call_getDeviceNotes
    ;;
    retrieveDeviceNote)
    call_retrieveDeviceNote
    ;;
    updateDeviceNote)
    call_updateDeviceNote
    ;;
    activationLock)
    call_activationLock
    ;;
    applicationFirewall)
    call_applicationFirewall
    ;;
    applications)
    call_applications
    ;;
    certificates)
    call_certificates
    ;;
    count)
    call_count
    ;;
    desktopAndScreensaver)
    call_desktopAndScreensaver
    ;;
    deviceInformation)
    call_deviceInformation
    ;;
    filevault)
    call_filevault
    ;;
    gatekeeperAndXprotect)
    call_gatekeeperAndXprotect
    ;;
    getCategoryExport)
    call_getCategoryExport
    ;;
    installedProfiles)
    call_installedProfiles
    ;;
    kernelExtensions)
    call_kernelExtensions
    ;;
    launchAgentsAndDaemons)
    call_launchAgentsAndDaemons
    ;;
    localUsers)
    call_localUsers
    ;;
    requestCategoryExport)
    call_requestCategoryExport
    ;;
    startupSettings)
    call_startupSettings
    ;;
    systemExtensions)
    call_systemExtensions
    ;;
    transparencyDatabase)
    call_transparencyDatabase
    ;;
    listSelfServiceCategories)
    call_listSelfServiceCategories
    ;;
    licensing)
    call_licensing
    ;;
    createTag)
    call_createTag
    ;;
    deleteTag)
    call_deleteTag
    ;;
    getTags)
    call_getTags
    ;;
    updateTag)
    call_updateTag
    ;;
    getThreatDetails)
    call_getThreatDetails
    ;;
    getUser)
    call_getUser
    ;;
    listUsers)
    call_listUsers
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
