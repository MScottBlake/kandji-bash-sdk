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
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsCreateAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationscreateadeintegration) | **POST** /api/v1/integrations/apple/ade/ | Create ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsDeleteAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsdeleteadeintegration) | **DELETE** /api/v1/integrations/apple/ade/{ade_token_id} | Delete ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsDownloadAdePublicKey**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsdownloadadepublickey) | **GET** /api/v1/integrations/apple/ade/public_key/ | Download ADE public key
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsGetAdeDevice**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsgetadedevice) | **GET** /api/v1/integrations/apple/ade/devices/{device_id} | Get ADE device
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsGetAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsgetadeintegration) | **GET** /api/v1/integrations/apple/ade/{ade_token_id} | Get ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsListAdeDevices**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationslistadedevices) | **GET** /api/v1/integrations/apple/ade/devices | List ADE devices
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsListAdeIntegrations**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationslistadeintegrations) | **GET** /api/v1/integrations/apple/ade | List ADE integrations
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsListDevicesAssociatedToAdeToken**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationslistdevicesassociatedtoadetoken) | **GET** /api/v1/integrations/apple/ade/{ade_token_id}/devices | List devices associated to ADE token
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsRenewAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsrenewadeintegration) | **POST** /api/v1/integrations/apple/ade/{ade_token_id}/renew | Renew ADE integration
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsUpdateAdeDevice**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsupdateadedevice) | **PATCH** /api/v1/integrations/apple/ade/devices/{device_id} | Update ADE device
*AutomatedDeviceEnrollmentIntegrationsApi* | [**automatedDeviceEnrollmentIntegrationsUpdateAdeIntegration**](docs/AutomatedDeviceEnrollmentIntegrationsApi.md#automateddeviceenrollmentintegrationsupdateadeintegration) | **PATCH** /api/v1/integrations/apple/ade/{ade_token_id} | Update ADE integration
*BlueprintsApi* | [**blueprintsAssignLibraryItem**](docs/BlueprintsApi.md#blueprintsassignlibraryitem) | **POST** /api/v1/blueprints/{blueprint_id}/assign-library-item | Assign Library Item
*BlueprintsApi* | [**blueprintsCreateBlueprint**](docs/BlueprintsApi.md#blueprintscreateblueprint) | **POST** /api/v1/blueprints | Create Blueprint
*BlueprintsApi* | [**blueprintsDeleteBlueprint**](docs/BlueprintsApi.md#blueprintsdeleteblueprint) | **DELETE** /api/v1/blueprints/{blueprint_id} | Delete Blueprint
*BlueprintsApi* | [**blueprintsGetBlueprint**](docs/BlueprintsApi.md#blueprintsgetblueprint) | **GET** /api/v1/blueprints/{blueprint_id} | Get Blueprint
*BlueprintsApi* | [**blueprintsGetBlueprintTemplates**](docs/BlueprintsApi.md#blueprintsgetblueprinttemplates) | **GET** /api/v1/blueprints/templates/ | Get Blueprint Templates
*BlueprintsApi* | [**blueprintsGetManualEnrollmentProfile**](docs/BlueprintsApi.md#blueprintsgetmanualenrollmentprofile) | **GET** /api/v1/blueprints/{blueprint_id}/ota-enrollment-profile | Get Manual Enrollment Profile
*BlueprintsApi* | [**blueprintsListBlueprints**](docs/BlueprintsApi.md#blueprintslistblueprints) | **GET** /api/v1/blueprints | List Blueprints
*BlueprintsApi* | [**blueprintsListLibraryItems**](docs/BlueprintsApi.md#blueprintslistlibraryitems) | **GET** /api/v1/blueprints/{blueprint_id}/list-library-items | List Library Items
*BlueprintsApi* | [**blueprintsRemoveLibraryItem**](docs/BlueprintsApi.md#blueprintsremovelibraryitem) | **POST** /api/v1/blueprints/{blueprint_id}/remove-library-item | Remove Library Item
*BlueprintsApi* | [**blueprintsUpdateBlueprint**](docs/BlueprintsApi.md#blueprintsupdateblueprint) | **PATCH** /api/v1/blueprints/{blueprint_id} | Update Blueprint
*CustomAppsApi* | [**customAppsCreateCustomApp**](docs/CustomAppsApi.md#customappscreatecustomapp) | **POST** /api/v1/library/custom-apps | Create Custom App
*CustomAppsApi* | [**customAppsDeleteCustomApp**](docs/CustomAppsApi.md#customappsdeletecustomapp) | **DELETE** /api/v1/library/custom-apps/{library_item_id} | Delete Custom App
*CustomAppsApi* | [**customAppsGetCustomApp**](docs/CustomAppsApi.md#customappsgetcustomapp) | **GET** /api/v1/library/custom-apps/{library_item_id} | Get Custom App
*CustomAppsApi* | [**customAppsListCustomApps**](docs/CustomAppsApi.md#customappslistcustomapps) | **GET** /api/v1/library/custom-apps | List Custom Apps
*CustomAppsApi* | [**customAppsUpdateCustomApp**](docs/CustomAppsApi.md#customappsupdatecustomapp) | **PATCH** /api/v1/library/custom-apps/{library_item_id} | Update Custom App
*CustomAppsApi* | [**customAppsUploadCustomApp**](docs/CustomAppsApi.md#customappsuploadcustomapp) | **POST** /api/v1/library/custom-apps/upload | Upload Custom App
*CustomProfilesApi* | [**customProfilesCreateCustomProfile**](docs/CustomProfilesApi.md#customprofilescreatecustomprofile) | **POST** /api/v1/library/custom-profiles | Create Custom Profile
*CustomProfilesApi* | [**customProfilesDeleteCustomProfile**](docs/CustomProfilesApi.md#customprofilesdeletecustomprofile) | **DELETE** /api/v1/library/custom-profiles/{library_item_id} | Delete Custom Profile
*CustomProfilesApi* | [**customProfilesGetCustomProfile**](docs/CustomProfilesApi.md#customprofilesgetcustomprofile) | **GET** /api/v1/library/custom-profiles/{library_item_id} | Get Custom Profile
*CustomProfilesApi* | [**customProfilesListCustomProfiles**](docs/CustomProfilesApi.md#customprofileslistcustomprofiles) | **GET** /api/v1/library/custom-profiles | List Custom Profiles
*CustomProfilesApi* | [**customProfilesUpdateCustomProfile**](docs/CustomProfilesApi.md#customprofilesupdatecustomprofile) | **PATCH** /api/v1/library/custom-profiles/{library_item_id} | Update Custom Profile
*CustomScriptsApi* | [**customScriptsCreateCustomScript**](docs/CustomScriptsApi.md#customscriptscreatecustomscript) | **POST** /api/v1/library/custom-scripts | Create Custom Script
*CustomScriptsApi* | [**customScriptsDeleteCustomScript**](docs/CustomScriptsApi.md#customscriptsdeletecustomscript) | **DELETE** /api/v1/library/custom-scripts/{library_item_id} | Delete Custom Script
*CustomScriptsApi* | [**customScriptsGetCustomScript**](docs/CustomScriptsApi.md#customscriptsgetcustomscript) | **GET** /api/v1/library/custom-scripts/{library_item_id} | Get Custom Script
*CustomScriptsApi* | [**customScriptsListCustomScripts**](docs/CustomScriptsApi.md#customscriptslistcustomscripts) | **GET** /api/v1/library/custom-scripts | List Custom Scripts
*CustomScriptsApi* | [**customScriptsUpdateCustomScript**](docs/CustomScriptsApi.md#customscriptsupdatecustomscript) | **PATCH** /api/v1/library/custom-scripts/{library_item_id} | Update Custom Script
*DeviceActionsApi* | [**deviceActionsClearPasscode**](docs/DeviceActionsApi.md#deviceactionsclearpasscode) | **POST** /api/v1/devices/{device_id}/action/clearpasscode | Clear Passcode
*DeviceActionsApi* | [**deviceActionsDeleteDevice**](docs/DeviceActionsApi.md#deviceactionsdeletedevice) | **DELETE** /api/v1/devices/{device_id} | Delete Device
*DeviceActionsApi* | [**deviceActionsDeleteUser**](docs/DeviceActionsApi.md#deviceactionsdeleteuser) | **POST** /api/v1/devices/{device_id}/action/deleteuser | Delete User
*DeviceActionsApi* | [**deviceActionsEraseDevice**](docs/DeviceActionsApi.md#deviceactionserasedevice) | **POST** /api/v1/devices/{device_id}/action/erase | Erase Device
*DeviceActionsApi* | [**deviceActionsGetDeviceCommands**](docs/DeviceActionsApi.md#deviceactionsgetdevicecommands) | **GET** /api/v1/devices/{device_id}/commands | Get Device Commands
*DeviceActionsApi* | [**deviceActionsLockDevice**](docs/DeviceActionsApi.md#deviceactionslockdevice) | **POST** /api/v1/devices/{device_id}/action/lock | Lock Device
*DeviceActionsApi* | [**deviceActionsReinstallAgent**](docs/DeviceActionsApi.md#deviceactionsreinstallagent) | **POST** /api/v1/devices/{device_id}/action/reinstallagent | Reinstall Agent
*DeviceActionsApi* | [**deviceActionsRemoteDesktop**](docs/DeviceActionsApi.md#deviceactionsremotedesktop) | **POST** /api/v1/devices/{device_id}/action/remotedesktop | Remote Desktop
*DeviceActionsApi* | [**deviceActionsRenewMdmProfile**](docs/DeviceActionsApi.md#deviceactionsrenewmdmprofile) | **POST** /api/v1/devices/{device_id}/action/renewmdmprofile | Renew MDM Profile
*DeviceActionsApi* | [**deviceActionsRestartDevice**](docs/DeviceActionsApi.md#deviceactionsrestartdevice) | **POST** /api/v1/devices/{device_id}/action/restart | Restart Device
*DeviceActionsApi* | [**deviceActionsSendBlankpush**](docs/DeviceActionsApi.md#deviceactionssendblankpush) | **POST** /api/v1/devices/{device_id}/action/blankpush | Send Blankpush
*DeviceActionsApi* | [**deviceActionsSetName**](docs/DeviceActionsApi.md#deviceactionssetname) | **POST** /api/v1/devices/{device_id}/action/setname | Set Name
*DeviceActionsApi* | [**deviceActionsShutdown**](docs/DeviceActionsApi.md#deviceactionsshutdown) | **POST** /api/v1/devices/{device_id}/action/shutdown | Shutdown
*DeviceActionsApi* | [**deviceActionsUnlockAccount**](docs/DeviceActionsApi.md#deviceactionsunlockaccount) | **POST** /api/v1/devices/{device_id}/action/unlockaccount | Unlock Account
*DeviceActionsApi* | [**deviceActionsUpdateInventory**](docs/DeviceActionsApi.md#deviceactionsupdateinventory) | **POST** /api/v1/devices/{device_id}/action/updateinventory | Update Inventory
*DeviceInformationApi* | [**deviceInformationCancelLostMode**](docs/DeviceInformationApi.md#deviceinformationcancellostmode) | **DELETE** /api/v1/devices/{device_id}/details/lostmode | Cancel Lost Mode
*DeviceInformationApi* | [**deviceInformationGetDeviceActivity**](docs/DeviceInformationApi.md#deviceinformationgetdeviceactivity) | **GET** /api/v1/devices/{device_id}/activity | Get Device Activity
*DeviceInformationApi* | [**deviceInformationGetDeviceApps**](docs/DeviceInformationApi.md#deviceinformationgetdeviceapps) | **GET** /api/v1/devices/{device_id}/apps | Get Device Apps
*DeviceInformationApi* | [**deviceInformationGetDeviceDetails**](docs/DeviceInformationApi.md#deviceinformationgetdevicedetails) | **GET** /api/v1/devices/{device_id}/details | Get Device Details
*DeviceInformationApi* | [**deviceInformationGetDeviceLibraryItems**](docs/DeviceInformationApi.md#deviceinformationgetdevicelibraryitems) | **GET** /api/v1/devices/{device_id}/library-items | Get Device Library Items
*DeviceInformationApi* | [**deviceInformationGetDeviceLostModeDetails**](docs/DeviceInformationApi.md#deviceinformationgetdevicelostmodedetails) | **GET** /api/v1/devices/{device_id}/details/lostmode | Get Device Lost Mode details
*DeviceInformationApi* | [**deviceInformationGetDeviceParameters**](docs/DeviceInformationApi.md#deviceinformationgetdeviceparameters) | **GET** /api/v1/devices/{device_id}/parameters | Get Device Parameters
*DeviceInformationApi* | [**deviceInformationGetDeviceStatus**](docs/DeviceInformationApi.md#deviceinformationgetdevicestatus) | **GET** /api/v1/devices/{device_id}/status | Get Device Status
*DeviceInformationApi* | [**deviceInformationListDevices**](docs/DeviceInformationApi.md#deviceinformationlistdevices) | **GET** /api/v1/devices | List Devices
*DeviceSecretsApi* | [**deviceSecretsGetActivationLockBypassCode**](docs/DeviceSecretsApi.md#devicesecretsgetactivationlockbypasscode) | **GET** /api/v1/devices/{device_id}/secrets/bypasscode | Get Activation Lock Bypass Code
*DeviceSecretsApi* | [**deviceSecretsGetFilevaultRecoveryKey**](docs/DeviceSecretsApi.md#devicesecretsgetfilevaultrecoverykey) | **GET** /api/v1/devices/{device_id}/secrets/filevaultkey | Get FileVault Recovery Key
*DeviceSecretsApi* | [**deviceSecretsGetRecoveryLockPassword**](docs/DeviceSecretsApi.md#devicesecretsgetrecoverylockpassword) | **GET** /api/v1/devices/{device_id}/secrets/recoverypassword | Get Recovery Lock Password
*DeviceSecretsApi* | [**deviceSecretsGetUnlockPin**](docs/DeviceSecretsApi.md#devicesecretsgetunlockpin) | **GET** /api/v1/devices/{device_id}/secrets/unlockpin | Get Unlock Pin
*InHouseAppsApi* | [**inHouseAppsCreateInhouseApp**](docs/InHouseAppsApi.md#inhouseappscreateinhouseapp) | **POST** /api/v1/library/ipa-apps | Create In-House App
*InHouseAppsApi* | [**inHouseAppsDeleteInhouseApp**](docs/InHouseAppsApi.md#inhouseappsdeleteinhouseapp) | **DELETE** /api/v1/library/ipa-apps/{library_item_id} | Delete In-House App
*InHouseAppsApi* | [**inHouseAppsGetInhouseApp**](docs/InHouseAppsApi.md#inhouseappsgetinhouseapp) | **GET** /api/v1/library/ipa-apps/{library_item_id} | Get In-House App
*InHouseAppsApi* | [**inHouseAppsListInhouseApps**](docs/InHouseAppsApi.md#inhouseappslistinhouseapps) | **GET** /api/v1/library/ipa-apps | List In-House Apps
*InHouseAppsApi* | [**inHouseAppsUpdateInhouseApp**](docs/InHouseAppsApi.md#inhouseappsupdateinhouseapp) | **PATCH** /api/v1/library/ipa-apps/{library_item_id} | Update In-House App
*InHouseAppsApi* | [**inHouseAppsUploadInhouseApp**](docs/InHouseAppsApi.md#inhouseappsuploadinhouseapp) | **POST** /api/v1/library/ipa-apps/upload | Upload In-House App
*InHouseAppsApi* | [**inHouseAppsUploadInhouseAppStatus**](docs/InHouseAppsApi.md#inhouseappsuploadinhouseappstatus) | **GET** /api/v1/library/ipa-apps/upload/{pending_upload_id}/status | Upload In-House App Status
*LibraryItemsApi* | [**libraryItemsGetLibraryItemActivity**](docs/LibraryItemsApi.md#libraryitemsgetlibraryitemactivity) | **GET** /api/v1/library/library-items/{library_item_id}/activity | Get Library Item Activity
*LibraryItemsApi* | [**libraryItemsGetLibraryItemStatuses**](docs/LibraryItemsApi.md#libraryitemsgetlibraryitemstatuses) | **GET** /api/v1/library/library-items/{library_item_id}/status | Get Library Item Statuses
*LostModeApi* | [**lostModeDisableLostMode**](docs/LostModeApi.md#lostmodedisablelostmode) | **POST** /api/v1/devices/{device_id}/action/disablelostmode | Disable Lost Mode
*LostModeApi* | [**lostModeEnableLostMode**](docs/LostModeApi.md#lostmodeenablelostmode) | **POST** /api/v1/devices/{device_id}/action/enablelostmode | Enable Lost Mode
*LostModeApi* | [**lostModePlayLostModeSound**](docs/LostModeApi.md#lostmodeplaylostmodesound) | **POST** /api/v1/devices/{device_id}/action/playlostmodesound | Play Lost Mode Sound
*LostModeApi* | [**lostModeUpdateLocation**](docs/LostModeApi.md#lostmodeupdatelocation) | **POST** /api/v1/devices/{device_id}/action/updatelocation | Update Location
*NotesApi* | [**notesCreateDeviceNote**](docs/NotesApi.md#notescreatedevicenote) | **POST** /api/v1/devices/{device_id}/notes | Create Device Note
*NotesApi* | [**notesDeleteDeviceNote**](docs/NotesApi.md#notesdeletedevicenote) | **DELETE** /api/v1/devices/{device_id}/notes/{note_id} | Delete Device Note
*NotesApi* | [**notesGetDeviceNotes**](docs/NotesApi.md#notesgetdevicenotes) | **GET** /api/v1/devices/{device_id}/notes | Get Device Notes
*NotesApi* | [**notesRetrieveDeviceNote**](docs/NotesApi.md#notesretrievedevicenote) | **GET** /api/v1/devices/{device_id}/notes/{note_id} | Retrieve Device Note
*NotesApi* | [**notesUpdateDeviceNote**](docs/NotesApi.md#notesupdatedevicenote) | **PATCH** /api/v1/devices/{device_id}/notes/{note_id} | Update Device Note
*PrismApi* | [**prismActivationLock**](docs/PrismApi.md#prismactivationlock) | **GET** /api/v1/prism/activation_lock | Activation lock
*PrismApi* | [**prismApplicationFirewall**](docs/PrismApi.md#prismapplicationfirewall) | **GET** /api/v1/prism/application_firewall | Application firewall
*PrismApi* | [**prismApplications**](docs/PrismApi.md#prismapplications) | **GET** /api/v1/prism/apps | Applications
*PrismApi* | [**prismCertificates**](docs/PrismApi.md#prismcertificates) | **GET** /api/v1/prism/certificates | Certificates
*PrismApi* | [**prismCount**](docs/PrismApi.md#prismcount) | **GET** /api/v1/prism/count | Count
*PrismApi* | [**prismDesktopAndScreensaver**](docs/PrismApi.md#prismdesktopandscreensaver) | **GET** /api/v1/prism/desktop_and_screensaver | Desktop and Screensaver
*PrismApi* | [**prismDeviceInformation**](docs/PrismApi.md#prismdeviceinformation) | **GET** /api/v1/prism/device_information | Device information
*PrismApi* | [**prismFilevault**](docs/PrismApi.md#prismfilevault) | **GET** /api/v1/prism/filevault | FileVault
*PrismApi* | [**prismGatekeeperAndXprotect**](docs/PrismApi.md#prismgatekeeperandxprotect) | **GET** /api/v1/prism/gatekeeper_and_xprotect | Gatekeeper and XProtect
*PrismApi* | [**prismGetCategoryExport**](docs/PrismApi.md#prismgetcategoryexport) | **GET** /api/v1/prism/export/{export_id} | Get category export
*PrismApi* | [**prismInstalledProfiles**](docs/PrismApi.md#prisminstalledprofiles) | **GET** /api/v1/prism/installed_profiles | Installed profiles
*PrismApi* | [**prismKernelExtensions**](docs/PrismApi.md#prismkernelextensions) | **GET** /api/v1/prism/kernel_extensions | Kernel Extensions
*PrismApi* | [**prismLaunchAgentsAndDaemons**](docs/PrismApi.md#prismlaunchagentsanddaemons) | **GET** /api/v1/prism/launch_agents_and_daemons | Launch Agents and Daemons
*PrismApi* | [**prismLocalUsers**](docs/PrismApi.md#prismlocalusers) | **GET** /api/v1/prism/local_users | Local users
*PrismApi* | [**prismRequestCategoryExport**](docs/PrismApi.md#prismrequestcategoryexport) | **POST** /api/v1/prism/export | Request category export
*PrismApi* | [**prismStartupSettings**](docs/PrismApi.md#prismstartupsettings) | **GET** /api/v1/prism/startup_settings | Startup settings
*PrismApi* | [**prismSystemExtensions**](docs/PrismApi.md#prismsystemextensions) | **GET** /api/v1/prism/system_extensions | System Extensions
*PrismApi* | [**prismTransparencyDatabase**](docs/PrismApi.md#prismtransparencydatabase) | **GET** /api/v1/prism/transparency_database | Transparency database
*SelfServiceApi* | [**selfServiceListSelfServiceCategories**](docs/SelfServiceApi.md#selfservicelistselfservicecategories) | **GET** /api/v1/self-service/categories | List Self Service Categories
*SettingsApi* | [**settingsLicensing**](docs/SettingsApi.md#settingslicensing) | **GET** /api/v1/settings/licensing | Licensing
*TagsApi* | [**tagsCreateTag**](docs/TagsApi.md#tagscreatetag) | **POST** /api/v1/tags | Create Tag
*TagsApi* | [**tagsDeleteTag**](docs/TagsApi.md#tagsdeletetag) | **DELETE** /api/v1/tags/{tag_id} | Delete Tag
*TagsApi* | [**tagsGetTags**](docs/TagsApi.md#tagsgettags) | **GET** /api/v1/tags | Get Tags
*TagsApi* | [**tagsUpdateTag**](docs/TagsApi.md#tagsupdatetag) | **PATCH** /api/v1/tags/{tag_id} | Update Tag
*ThreatsApi* | [**threatsGetThreatDetails**](docs/ThreatsApi.md#threatsgetthreatdetails) | **GET** /api/v1/threat-details | Get Threat Details
*UsersApi* | [**usersDeleteUser**](docs/UsersApi.md#usersdeleteuser) | **DELETE** /api/v1/users/{user_id} | Delete User
*UsersApi* | [**usersGetUser**](docs/UsersApi.md#usersgetuser) | **GET** /api/v1/users/{user_id} | Get User
*UsersApi* | [**usersListUsers**](docs/UsersApi.md#userslistusers) | **GET** /api/v1/users | List Users


## Documentation For Models



## Documentation For Authorization


## bearer


- **Type**: HTTP Bearer Token authentication (API Token)

