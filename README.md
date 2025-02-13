# Kandji API Bash client

## Overview

This is a Bash client script for accessing Kandji API service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x kandji

# Print the list of operations available on the service
$ ./kandji -h

# Print the service description
$ ./kandji --about

# Print detailed information about specific operation
$ ./kandji <operationId> -h

# Make GET request
./kandji --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
kandji -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' | kandji --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' | kandji --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$ kandji --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$ kandji --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source kandji.bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp kandji.bash-completion /etc/bash-completion.d/kandji
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_kandji` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to **

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AutomatedDeviceEnrollmentIntegrationsApi* | [**createAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#createadeintegration) | **POST** /api/v1/integrations/apple/ade/ | Create ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**deleteAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#deleteadeintegration) | **DELETE** /api/v1/integrations/apple/ade/{ade_token_id} | Delete ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**downloadAdePublicKey**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#downloadadepublickey) | **GET** /api/v1/integrations/apple/ade/public_key/ | Download ADE public key
*AutomatedDeviceEnrollmentIntegrationsApi* | [**getAdeDevice**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#getadedevice) | **GET** /api/v1/integrations/apple/ade/devices/{device_id} | Get ADE device
*AutomatedDeviceEnrollmentIntegrationsApi* | [**getAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#getadeintegration) | **GET** /api/v1/integrations/apple/ade/{ade_token_id} | Get ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**listAdeDevices**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#listadedevices) | **GET** /api/v1/integrations/apple/ade/devices | List ADE devices
*AutomatedDeviceEnrollmentIntegrationsApi* | [**listAdeIntegrations**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#listadeintegrations) | **GET** /api/v1/integrations/apple/ade | List ADE integrations
*AutomatedDeviceEnrollmentIntegrationsApi* | [**listDevicesAssociatedToAdeToken**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#listdevicesassociatedtoadetoken) | **GET** /api/v1/integrations/apple/ade/{ade_token_id}/devices | List devices associated to ADE token
*AutomatedDeviceEnrollmentIntegrationsApi* | [**renewAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#renewadeintegration) | **POST** /api/v1/integrations/apple/ade/{ade_token_id}/renew | Renew ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**updateAdeDevice**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#updateadedevice) | **PATCH** /api/v1/integrations/apple/ade/devices/{device_id} | Update ADE device
*AutomatedDeviceEnrollmentIntegrationsApi* | [**updateAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#updateadeintegration) | **PATCH** /api/v1/integrations/apple/ade/{ade_token_id} | Update ADE integration
*BlueprintsApi* | [**assignLibraryItem**](docs/BlueprintsApi.md#assignlibraryitem) | **POST** /api/v1/blueprints/{blueprint_id}/assign-library-item | Assign Library Item
*BlueprintsApi* | [**createBlueprint**](docs/BlueprintsApi.md#createblueprint) | **POST** /api/v1/blueprints | Create Blueprint
*BlueprintsApi* | [**deleteBlueprint**](docs/BlueprintsApi.md#deleteblueprint) | **DELETE** /api/v1/blueprints/{blueprint_id} | Delete Blueprint
*BlueprintsApi* | [**getBlueprint**](docs/BlueprintsApi.md#getblueprint) | **GET** /api/v1/blueprints/{blueprint_id} | Get Blueprint
*BlueprintsApi* | [**getBlueprintTemplates**](docs/BlueprintsApi.md#getblueprinttemplates) | **GET** /api/v1/blueprints/templates/ | Get Blueprint Templates
*BlueprintsApi* | [**getManualEnrollmentProfile**](docs/BlueprintsApi.md#getmanualenrollmentprofile) | **GET** /api/v1/blueprints/{blueprint_id}/ota-enrollment-profile | Get Manual Enrollment Profile
*BlueprintsApi* | [**listBlueprints**](docs/BlueprintsApi.md#listblueprints) | **GET** /api/v1/blueprints | List Blueprints
*BlueprintsApi* | [**listLibraryItems**](docs/BlueprintsApi.md#listlibraryitems) | **GET** /api/v1/blueprints/{blueprint_id}/list-library-items | List Library Items
*BlueprintsApi* | [**removeLibraryItem**](docs/BlueprintsApi.md#removelibraryitem) | **POST** /api/v1/blueprints/{blueprint_id}/remove-library-item | Remove Library Item
*BlueprintsApi* | [**updateBlueprint**](docs/BlueprintsApi.md#updateblueprint) | **PATCH** /api/v1/blueprints/{blueprint_id} | Update Blueprint
*DeviceActionsApi* | [**clearPasscode**](docs/DeviceActionsApi.md#clearpasscode) | **POST** /api/v1/devices/{device_id}/action/clearpasscode | Clear Passcode
*DeviceActionsApi* | [**deleteDevice**](docs/DeviceActionsApi.md#deletedevice) | **DELETE** /api/v1/devices/{device_id} | Delete Device
*DeviceActionsApi* | [**deleteUser**](docs/DeviceActionsApi.md#deleteuser) | **POST** /api/v1/devices/{device_id}/action/deleteuser | Delete User
*DeviceActionsApi* | [**eraseDevice**](docs/DeviceActionsApi.md#erasedevice) | **POST** /api/v1/devices/{device_id}/action/erase | Erase Device
*DeviceActionsApi* | [**getDeviceCommands**](docs/DeviceActionsApi.md#getdevicecommands) | **GET** /api/v1/devices/{device_id}/commands | Get Device Commands
*DeviceActionsApi* | [**lockDevice**](docs/DeviceActionsApi.md#lockdevice) | **POST** /api/v1/devices/{device_id}/action/lock | Lock Device
*DeviceActionsApi* | [**reinstallAgent**](docs/DeviceActionsApi.md#reinstallagent) | **POST** /api/v1/devices/{device_id}/action/reinstallagent | Reinstall Agent
*DeviceActionsApi* | [**remoteDesktop**](docs/DeviceActionsApi.md#remotedesktop) | **POST** /api/v1/devices/{device_id}/action/remotedesktop | Remote Desktop
*DeviceActionsApi* | [**renewMdmProfile**](docs/DeviceActionsApi.md#renewmdmprofile) | **POST** /api/v1/devices/{device_id}/action/renewmdmprofile | Renew MDM Profile
*DeviceActionsApi* | [**restartDevice**](docs/DeviceActionsApi.md#restartdevice) | **POST** /api/v1/devices/{device_id}/action/restart | Restart Device
*DeviceActionsApi* | [**sendBlankpush**](docs/DeviceActionsApi.md#sendblankpush) | **POST** /api/v1/devices/{device_id}/action/blankpush | Send Blankpush
*DeviceActionsApi* | [**setName**](docs/DeviceActionsApi.md#setname) | **POST** /api/v1/devices/{device_id}/action/setname | Set Name
*DeviceActionsApi* | [**shutdown**](docs/DeviceActionsApi.md#shutdown) | **POST** /api/v1/devices/{device_id}/action/shutdown | Shutdown
*DeviceActionsApi* | [**unlockAccount**](docs/DeviceActionsApi.md#unlockaccount) | **POST** /api/v1/devices/{device_id}/action/unlockaccount | Unlock Account
*DeviceActionsApi* | [**updateInventory**](docs/DeviceActionsApi.md#updateinventory) | **POST** /api/v1/devices/{device_id}/action/updateinventory | Update Inventory
*DeviceInformationApi* | [**cancelLostMode**](docs/DeviceInformationApi.md#cancellostmode) | **DELETE** /api/v1/devices/{device_id}/details/lostmode | Cancel Lost Mode
*DeviceInformationApi* | [**getDevice**](docs/DeviceInformationApi.md#getdevice) | **GET** /api/v1/devices/{device_id} | Get Device
*DeviceInformationApi* | [**getDeviceActivity**](docs/DeviceInformationApi.md#getdeviceactivity) | **GET** /api/v1/devices/{device_id}/activity | Get Device Activity
*DeviceInformationApi* | [**getDeviceApps**](docs/DeviceInformationApi.md#getdeviceapps) | **GET** /api/v1/devices/{device_id}/apps | Get Device Apps
*DeviceInformationApi* | [**getDeviceDetails**](docs/DeviceInformationApi.md#getdevicedetails) | **GET** /api/v1/devices/{device_id}/details | Get Device Details
*DeviceInformationApi* | [**getDeviceLibraryItems**](docs/DeviceInformationApi.md#getdevicelibraryitems) | **GET** /api/v1/devices/{device_id}/library-items | Get Device Library Items
*DeviceInformationApi* | [**getDeviceLostModeDetails**](docs/DeviceInformationApi.md#getdevicelostmodedetails) | **GET** /api/v1/devices/{device_id}/details/lostmode | Get Device Lost Mode details
*DeviceInformationApi* | [**getDeviceParameters**](docs/DeviceInformationApi.md#getdeviceparameters) | **GET** /api/v1/devices/{device_id}/parameters | Get Device Parameters
*DeviceInformationApi* | [**getDeviceStatus**](docs/DeviceInformationApi.md#getdevicestatus) | **GET** /api/v1/devices/{device_id}/status | Get Device Status
*DeviceInformationApi* | [**listDevices**](docs/DeviceInformationApi.md#listdevices) | **GET** /api/v1/devices | List Devices
*DeviceInformationApi* | [**updateDevice**](docs/DeviceInformationApi.md#updatedevice) | **PATCH** /api/v1/devices/{device_id} | Update Device
*DeviceSecretsApi* | [**getActivationLockBypassCode**](docs/DeviceSecretsApi.md#getactivationlockbypasscode) | **GET** /api/v1/devices/{device_id}/secrets/bypasscode | Get Activation Lock Bypass Code
*DeviceSecretsApi* | [**getFilevaultRecoveryKey**](docs/DeviceSecretsApi.md#getfilevaultrecoverykey) | **GET** /api/v1/devices/{device_id}/secrets/filevaultkey | Get FileVault Recovery Key
*DeviceSecretsApi* | [**getRecoveryLockPassword**](docs/DeviceSecretsApi.md#getrecoverylockpassword) | **GET** /api/v1/devices/{device_id}/secrets/recoverypassword | Get Recovery Lock Password
*DeviceSecretsApi* | [**getUnlockPin**](docs/DeviceSecretsApi.md#getunlockpin) | **GET** /api/v1/devices/{device_id}/secrets/unlockpin | Get Unlock Pin
*LibraryItemsApi* | [**getLibraryItemActivity**](docs/LibraryItemsApi.md#getlibraryitemactivity) | **GET** /api/v1/library/library-items/{library_item_id}/activity | Get Library Item Activity
*LibraryItemsApi* | [**getLibraryItemStatuses**](docs/LibraryItemsApi.md#getlibraryitemstatuses) | **GET** /api/v1/library/library-items/{library_item_id}/status | Get Library Item Statuses
*PrismApi* | [**activationLock**](docs/PrismApi.md#activationlock) | **GET** /api/v1/prism/activation_lock | Activation lock
*PrismApi* | [**applicationFirewall**](docs/PrismApi.md#applicationfirewall) | **GET** /api/v1/prism/application_firewall | Application firewall
*PrismApi* | [**applications**](docs/PrismApi.md#applications) | **GET** /api/v1/prism/apps | Applications
*PrismApi* | [**certificates**](docs/PrismApi.md#certificates) | **GET** /api/v1/prism/certificates | Certificates
*PrismApi* | [**count**](docs/PrismApi.md#count) | **GET** /api/v1/prism/count | Count
*PrismApi* | [**desktopAndScreensaver**](docs/PrismApi.md#desktopandscreensaver) | **GET** /api/v1/prism/desktop_and_screensaver | Desktop and Screensaver
*PrismApi* | [**deviceInformation**](docs/PrismApi.md#deviceinformation) | **GET** /api/v1/prism/device_information | Device information
*PrismApi* | [**filevault**](docs/PrismApi.md#filevault) | **GET** /api/v1/prism/filevault | FileVault
*PrismApi* | [**gatekeeperAndXprotect**](docs/PrismApi.md#gatekeeperandxprotect) | **GET** /api/v1/prism/gatekeeper_and_xprotect | Gatekeeper and XProtect
*PrismApi* | [**getCategoryExport**](docs/PrismApi.md#getcategoryexport) | **GET** /api/v1/prism/export/{export_id} | Get category export
*PrismApi* | [**installedProfiles**](docs/PrismApi.md#installedprofiles) | **GET** /api/v1/prism/installed_profiles | Installed profiles
*PrismApi* | [**kernelExtensions**](docs/PrismApi.md#kernelextensions) | **GET** /api/v1/prism/kernel_extensions | Kernel Extensions
*PrismApi* | [**launchAgentsAndDaemons**](docs/PrismApi.md#launchagentsanddaemons) | **GET** /api/v1/prism/launch_agents_and_daemons | Launch Agents and Daemons
*PrismApi* | [**localUsers**](docs/PrismApi.md#localusers) | **GET** /api/v1/prism/local_users | Local users
*PrismApi* | [**requestCategoryExport**](docs/PrismApi.md#requestcategoryexport) | **POST** /api/v1/prism/export | Request category export
*PrismApi* | [**startupSettings**](docs/PrismApi.md#startupsettings) | **GET** /api/v1/prism/startup_settings | Startup settings
*PrismApi* | [**systemExtensions**](docs/PrismApi.md#systemextensions) | **GET** /api/v1/prism/system_extensions | System Extensions
*PrismApi* | [**transparencyDatabase**](docs/PrismApi.md#transparencydatabase) | **GET** /api/v1/prism/transparency_database | Transparency database
*SettingsApi* | [**licensing**](docs/SettingsApi.md#licensing) | **GET** /api/v1/settings/licensing | Licensing
*TagsApi* | [**createTag**](docs/TagsApi.md#createtag) | **POST** /api/v1/tags | Create Tag
*TagsApi* | [**deleteTag**](docs/TagsApi.md#deletetag) | **DELETE** /api/v1/tags/{tag_id} | Delete Tag
*TagsApi* | [**getTags**](docs/TagsApi.md#gettags) | **GET** /api/v1/tags | Get Tags
*TagsApi* | [**updateTag**](docs/TagsApi.md#updatetag) | **PATCH** /api/v1/tags/{tag_id} | Update Tag
*ThreatsApi* | [**getThreatDetails**](docs/ThreatsApi.md#getthreatdetails) | **GET** /api/v1/threat-details | Get Threat Details
*UsersApi* | [**deleteUser**](docs/UsersApi.md#deleteuser) | **DELETE** /api/v1/users/{user_id} | Delete User
*UsersApi* | [**getUser**](docs/UsersApi.md#getuser) | **GET** /api/v1/users/{user_id} | Get User
*UsersApi* | [**listUsers**](docs/UsersApi.md#listusers) | **GET** /api/v1/users | List Users
*VulnerabilitiesApi* | [**getVulnerabilityDescription**](docs/VulnerabilitiesApi.md#getvulnerabilitydescription) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id} | Get Vulnerability Description
*VulnerabilitiesApi* | [**listAffectedApplications**](docs/VulnerabilitiesApi.md#listaffectedapplications) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/applications | List Affected Applications
*VulnerabilitiesApi* | [**listAffectedDevices**](docs/VulnerabilitiesApi.md#listaffecteddevices) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/devices | List Affected Devices
*VulnerabilitiesApi* | [**listDetections**](docs/VulnerabilitiesApi.md#listdetections) | **GET** /api/v1/vulnerability-management/detections | List Detections
*VulnerabilitiesApi* | [**listVulnerabilities**](docs/VulnerabilitiesApi.md#listvulnerabilities) | **GET** /api/v1/vulnerability-management/vulnerabilities | List Vulnerabilities


## Documentation For Models

 - [AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200Response](docs/AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200Response.md)
 - [AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseBlueprint](docs/AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseBlueprint.md)
 - [AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseDefaults](docs/AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseDefaults.md)
 - [AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseDeviceCounts](docs/AutomatedDeviceEnrollmentIntegrationsCreateAdeIntegration200ResponseDeviceCounts.md)
 - [AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200Response](docs/AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200Response.md)
 - [AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200ResponseDepAccount](docs/AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200ResponseDepAccount.md)
 - [AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200ResponseMdmDevice](docs/AutomatedDeviceEnrollmentIntegrationsGetAdeDevice200ResponseMdmDevice.md)
 - [AutomatedDeviceEnrollmentIntegrationsListAdeDevices200Response](docs/AutomatedDeviceEnrollmentIntegrationsListAdeDevices200Response.md)
 - [AutomatedDeviceEnrollmentIntegrationsListAdeDevices400Response](docs/AutomatedDeviceEnrollmentIntegrationsListAdeDevices400Response.md)
 - [AutomatedDeviceEnrollmentIntegrationsListDevicesAssociatedToAdeToken200Response](docs/AutomatedDeviceEnrollmentIntegrationsListDevicesAssociatedToAdeToken200Response.md)
 - [BlueprintsCreateBlueprint201Response](docs/BlueprintsCreateBlueprint201Response.md)
 - [BlueprintsCreateBlueprint201ResponseEnrollmentCode](docs/BlueprintsCreateBlueprint201ResponseEnrollmentCode.md)
 - [BlueprintsGetBlueprint200Response](docs/BlueprintsGetBlueprint200Response.md)
 - [BlueprintsUpdateBlueprint200Response](docs/BlueprintsUpdateBlueprint200Response.md)
 - [DeviceActionsGetDeviceCommands200Response](docs/DeviceActionsGetDeviceCommands200Response.md)
 - [DeviceActionsLockDevice200Response](docs/DeviceActionsLockDevice200Response.md)
 - [DeviceInformationGetDevice200Response](docs/DeviceInformationGetDevice200Response.md)
 - [DeviceInformationGetDevice200ResponseUser](docs/DeviceInformationGetDevice200ResponseUser.md)
 - [DeviceInformationGetDeviceActivity200Response](docs/DeviceInformationGetDeviceActivity200Response.md)
 - [DeviceInformationGetDeviceApps200Response](docs/DeviceInformationGetDeviceApps200Response.md)
 - [DeviceInformationGetDeviceDetails200Response](docs/DeviceInformationGetDeviceDetails200Response.md)
 - [DeviceInformationGetDeviceDetails200ResponseActivationLock](docs/DeviceInformationGetDeviceDetails200ResponseActivationLock.md)
 - [DeviceInformationGetDeviceDetails200ResponseAppleBusinessManager](docs/DeviceInformationGetDeviceDetails200ResponseAppleBusinessManager.md)
 - [DeviceInformationGetDeviceDetails200ResponseAutomatedDeviceEnrollment](docs/DeviceInformationGetDeviceDetails200ResponseAutomatedDeviceEnrollment.md)
 - [DeviceInformationGetDeviceDetails200ResponseCellular](docs/DeviceInformationGetDeviceDetails200ResponseCellular.md)
 - [DeviceInformationGetDeviceDetails200ResponseFilevault](docs/DeviceInformationGetDeviceDetails200ResponseFilevault.md)
 - [DeviceInformationGetDeviceDetails200ResponseGeneral](docs/DeviceInformationGetDeviceDetails200ResponseGeneral.md)
 - [DeviceInformationGetDeviceDetails200ResponseHardwareOverview](docs/DeviceInformationGetDeviceDetails200ResponseHardwareOverview.md)
 - [DeviceInformationGetDeviceDetails200ResponseKandjiAgent](docs/DeviceInformationGetDeviceDetails200ResponseKandjiAgent.md)
 - [DeviceInformationGetDeviceDetails200ResponseLostMode](docs/DeviceInformationGetDeviceDetails200ResponseLostMode.md)
 - [DeviceInformationGetDeviceDetails200ResponseLostModeLastLocation](docs/DeviceInformationGetDeviceDetails200ResponseLostModeLastLocation.md)
 - [DeviceInformationGetDeviceDetails200ResponseMdm](docs/DeviceInformationGetDeviceDetails200ResponseMdm.md)
 - [DeviceInformationGetDeviceDetails200ResponseRecoveryInformation](docs/DeviceInformationGetDeviceDetails200ResponseRecoveryInformation.md)
 - [DeviceInformationGetDeviceDetails200ResponseSecurityInformation](docs/DeviceInformationGetDeviceDetails200ResponseSecurityInformation.md)
 - [DeviceInformationGetDeviceDetails200ResponseUsers](docs/DeviceInformationGetDeviceDetails200ResponseUsers.md)
 - [DeviceInformationGetDeviceLibraryItems200Response](docs/DeviceInformationGetDeviceLibraryItems200Response.md)
 - [DeviceInformationGetDeviceLostModeDetails200Response](docs/DeviceInformationGetDeviceLostModeDetails200Response.md)
 - [DeviceInformationGetDeviceParameters200Response](docs/DeviceInformationGetDeviceParameters200Response.md)
 - [DeviceInformationGetDeviceStatus200Response](docs/DeviceInformationGetDeviceStatus200Response.md)
 - [DeviceInformationUpdateDevice200Response](docs/DeviceInformationUpdateDevice200Response.md)
 - [DeviceSecretsGetActivationLockBypassCode200Response](docs/DeviceSecretsGetActivationLockBypassCode200Response.md)
 - [DeviceSecretsGetFilevaultRecoveryKey200Response](docs/DeviceSecretsGetFilevaultRecoveryKey200Response.md)
 - [DeviceSecretsGetRecoveryLockPassword200Response](docs/DeviceSecretsGetRecoveryLockPassword200Response.md)
 - [DeviceSecretsGetUnlockPin200Response](docs/DeviceSecretsGetUnlockPin200Response.md)
 - [PrismActivationLock200Response](docs/PrismActivationLock200Response.md)
 - [PrismApplications200Response](docs/PrismApplications200Response.md)
 - [PrismCount200Response](docs/PrismCount200Response.md)
 - [PrismDeviceInformation200Response](docs/PrismDeviceInformation200Response.md)
 - [PrismGetCategoryExport200Response](docs/PrismGetCategoryExport200Response.md)
 - [PrismLocalUsers200Response](docs/PrismLocalUsers200Response.md)
 - [PrismRequestCategoryExport200Response](docs/PrismRequestCategoryExport200Response.md)
 - [PrismRequestCategoryExport200ResponseArgs](docs/PrismRequestCategoryExport200ResponseArgs.md)
 - [PrismRequestCategoryExport400Response](docs/PrismRequestCategoryExport400Response.md)
 - [SettingsLicensing200Response](docs/SettingsLicensing200Response.md)
 - [SettingsLicensing200ResponseCounts](docs/SettingsLicensing200ResponseCounts.md)
 - [SettingsLicensing200ResponseLimits](docs/SettingsLicensing200ResponseLimits.md)
 - [SettingsLicensing200ResponseLimitsMaxDevicesPerPlatform](docs/SettingsLicensing200ResponseLimitsMaxDevicesPerPlatform.md)
 - [TagsCreateTag201Response](docs/TagsCreateTag201Response.md)
 - [ThreatsGetThreatDetails200Response](docs/ThreatsGetThreatDetails200Response.md)
 - [UsersGetUser200Response](docs/UsersGetUser200Response.md)
 - [UsersGetUser200ResponseIntegration](docs/UsersGetUser200ResponseIntegration.md)
 - [UsersListUsers200Response](docs/UsersListUsers200Response.md)
 - [VulnerabilitiesGetVulnerabilityDescription200Response](docs/VulnerabilitiesGetVulnerabilityDescription200Response.md)
 - [VulnerabilitiesListDetections200Response](docs/VulnerabilitiesListDetections200Response.md)
 - [VulnerabilitiesListVulnerabilities200Response](docs/VulnerabilitiesListVulnerabilities200Response.md)


## Documentation For Authorization


## bearer


- **Type**: HTTP Bearer Token authentication (API Token)

