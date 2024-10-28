# Kandji API Bash client

## Overview

This is a Bash client script for accessing Kandji API service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x 

# Print the list of operations available on the service
$ ./ -h

# Print the service description
$ ./ --about

# Print detailed information about specific operation
$ ./ <operationId> -h

# Make GET request
./ --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
 -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$  --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$  --host http://<hostname>:<port> --dry-run <operationid>

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
source .bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp .bash-completion /etc/bash-completion.d/
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

In Zsh, the generated `_` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to **

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**apiV1BlueprintsBlueprintIdAssignLibraryItemPost**](docs/DefaultApi.md#apiv1blueprintsblueprintidassignlibraryitempost) | **POST** /api/v1/blueprints/{blueprint_id}/assign-library-item | Assign Library Item
*DefaultApi* | [**apiV1BlueprintsBlueprintIdDelete**](docs/DefaultApi.md#apiv1blueprintsblueprintiddelete) | **DELETE** /api/v1/blueprints/{blueprint_id} | Delete Blueprint
*DefaultApi* | [**apiV1BlueprintsBlueprintIdGet**](docs/DefaultApi.md#apiv1blueprintsblueprintidget) | **GET** /api/v1/blueprints/{blueprint_id} | Get Blueprint
*DefaultApi* | [**apiV1BlueprintsBlueprintIdListLibraryItemsGet**](docs/DefaultApi.md#apiv1blueprintsblueprintidlistlibraryitemsget) | **GET** /api/v1/blueprints/{blueprint_id}/list-library-items | List Library Items
*DefaultApi* | [**apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet**](docs/DefaultApi.md#apiv1blueprintsblueprintidotaenrollmentprofileget) | **GET** /api/v1/blueprints/{blueprint_id}/ota-enrollment-profile | Get Manual Enrollment Profile
*DefaultApi* | [**apiV1BlueprintsBlueprintIdPatch**](docs/DefaultApi.md#apiv1blueprintsblueprintidpatch) | **PATCH** /api/v1/blueprints/{blueprint_id} | Update Blueprint
*DefaultApi* | [**apiV1BlueprintsBlueprintIdRemoveLibraryItemPost**](docs/DefaultApi.md#apiv1blueprintsblueprintidremovelibraryitempost) | **POST** /api/v1/blueprints/{blueprint_id}/remove-library-item | Remove Library Item
*DefaultApi* | [**apiV1BlueprintsGet**](docs/DefaultApi.md#apiv1blueprintsget) | **GET** /api/v1/blueprints | List Blueprints
*DefaultApi* | [**apiV1BlueprintsPost**](docs/DefaultApi.md#apiv1blueprintspost) | **POST** /api/v1/blueprints | Create Blueprint
*DefaultApi* | [**apiV1BlueprintsTemplatesGet**](docs/DefaultApi.md#apiv1blueprintstemplatesget) | **GET** /api/v1/blueprints/templates/ | Get Blueprint Templates
*DefaultApi* | [**apiV1DevicesDeviceIdActionBlankpushPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionblankpushpost) | **POST** /api/v1/devices/{device_id}/action/blankpush | Send Blankpush
*DefaultApi* | [**apiV1DevicesDeviceIdActionClearpasscodePost**](docs/DefaultApi.md#apiv1devicesdeviceidactionclearpasscodepost) | **POST** /api/v1/devices/{device_id}/action/clearpasscode | Clear Passcode
*DefaultApi* | [**apiV1DevicesDeviceIdActionDeleteuserPost**](docs/DefaultApi.md#apiv1devicesdeviceidactiondeleteuserpost) | **POST** /api/v1/devices/{device_id}/action/deleteuser | Delete User
*DefaultApi* | [**apiV1DevicesDeviceIdActionDisablelostmodePost**](docs/DefaultApi.md#apiv1devicesdeviceidactiondisablelostmodepost) | **POST** /api/v1/devices/{device_id}/action/disablelostmode | Disable Lost Mode
*DefaultApi* | [**apiV1DevicesDeviceIdActionEnablelostmodePost**](docs/DefaultApi.md#apiv1devicesdeviceidactionenablelostmodepost) | **POST** /api/v1/devices/{device_id}/action/enablelostmode | Enable Lost Mode
*DefaultApi* | [**apiV1DevicesDeviceIdActionErasePost**](docs/DefaultApi.md#apiv1devicesdeviceidactionerasepost) | **POST** /api/v1/devices/{device_id}/action/erase | Erase Device
*DefaultApi* | [**apiV1DevicesDeviceIdActionLockPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionlockpost) | **POST** /api/v1/devices/{device_id}/action/lock | Lock Device
*DefaultApi* | [**apiV1DevicesDeviceIdActionPlaylostmodesoundPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionplaylostmodesoundpost) | **POST** /api/v1/devices/{device_id}/action/playlostmodesound | Play Lost Mode Sound
*DefaultApi* | [**apiV1DevicesDeviceIdActionReinstallagentPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionreinstallagentpost) | **POST** /api/v1/devices/{device_id}/action/reinstallagent | Reinstall Agent
*DefaultApi* | [**apiV1DevicesDeviceIdActionRemotedesktopPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionremotedesktoppost) | **POST** /api/v1/devices/{device_id}/action/remotedesktop | Remote Desktop
*DefaultApi* | [**apiV1DevicesDeviceIdActionRenewmdmprofilePost**](docs/DefaultApi.md#apiv1devicesdeviceidactionrenewmdmprofilepost) | **POST** /api/v1/devices/{device_id}/action/renewmdmprofile | Renew MDM Profile
*DefaultApi* | [**apiV1DevicesDeviceIdActionRestartPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionrestartpost) | **POST** /api/v1/devices/{device_id}/action/restart | Restart Device
*DefaultApi* | [**apiV1DevicesDeviceIdActionSetnamePost**](docs/DefaultApi.md#apiv1devicesdeviceidactionsetnamepost) | **POST** /api/v1/devices/{device_id}/action/setname | Set Name
*DefaultApi* | [**apiV1DevicesDeviceIdActionShutdownPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionshutdownpost) | **POST** /api/v1/devices/{device_id}/action/shutdown | Shutdown
*DefaultApi* | [**apiV1DevicesDeviceIdActionUnlockaccountPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionunlockaccountpost) | **POST** /api/v1/devices/{device_id}/action/unlockaccount | Unlock Account
*DefaultApi* | [**apiV1DevicesDeviceIdActionUpdateinventoryPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionupdateinventorypost) | **POST** /api/v1/devices/{device_id}/action/updateinventory | Update Inventory
*DefaultApi* | [**apiV1DevicesDeviceIdActionUpdatelocationPost**](docs/DefaultApi.md#apiv1devicesdeviceidactionupdatelocationpost) | **POST** /api/v1/devices/{device_id}/action/updatelocation | Update Location
*DefaultApi* | [**apiV1DevicesDeviceIdActivitylimit300Get**](docs/DefaultApi.md#apiv1devicesdeviceidactivitylimit300get) | **GET** /api/v1/devices/{device_id}/activity?limit&#x3D;300 | Get Device Activity
*DefaultApi* | [**apiV1DevicesDeviceIdAppsGet**](docs/DefaultApi.md#apiv1devicesdeviceidappsget) | **GET** /api/v1/devices/{device_id}/apps | Get Device Apps
*DefaultApi* | [**apiV1DevicesDeviceIdCommandslimit300Get**](docs/DefaultApi.md#apiv1devicesdeviceidcommandslimit300get) | **GET** /api/v1/devices/{device_id}/commands?limit&#x3D;300 | Get Device Commands
*DefaultApi* | [**apiV1DevicesDeviceIdDelete**](docs/DefaultApi.md#apiv1devicesdeviceiddelete) | **DELETE** /api/v1/devices/{device_id} | Delete Device
*DefaultApi* | [**apiV1DevicesDeviceIdDetailsGet**](docs/DefaultApi.md#apiv1devicesdeviceiddetailsget) | **GET** /api/v1/devices/{device_id}/details | Get Device Details
*DefaultApi* | [**apiV1DevicesDeviceIdDetailsLostmodeDelete**](docs/DefaultApi.md#apiv1devicesdeviceiddetailslostmodedelete) | **DELETE** /api/v1/devices/{device_id}/details/lostmode | Cancel Lost Mode
*DefaultApi* | [**apiV1DevicesDeviceIdDetailsLostmodeGet**](docs/DefaultApi.md#apiv1devicesdeviceiddetailslostmodeget) | **GET** /api/v1/devices/{device_id}/details/lostmode | Get Device Lost Mode details
*DefaultApi* | [**apiV1DevicesDeviceIdGet**](docs/DefaultApi.md#apiv1devicesdeviceidget) | **GET** /api/v1/devices/{device_id} | Get Device
*DefaultApi* | [**apiV1DevicesDeviceIdLibraryItemsGet**](docs/DefaultApi.md#apiv1devicesdeviceidlibraryitemsget) | **GET** /api/v1/devices/{device_id}/library-items | Get Device Library Items
*DefaultApi* | [**apiV1DevicesDeviceIdNotesGet**](docs/DefaultApi.md#apiv1devicesdeviceidnotesget) | **GET** /api/v1/devices/{device_id}/notes | Get Device Notes
*DefaultApi* | [**apiV1DevicesDeviceIdNotesNoteIdDelete**](docs/DefaultApi.md#apiv1devicesdeviceidnotesnoteiddelete) | **DELETE** /api/v1/devices/{device_id}/notes/{note_id} | Delete Device Note
*DefaultApi* | [**apiV1DevicesDeviceIdNotesNoteIdGet**](docs/DefaultApi.md#apiv1devicesdeviceidnotesnoteidget) | **GET** /api/v1/devices/{device_id}/notes/{note_id} | Retrieve Device Note
*DefaultApi* | [**apiV1DevicesDeviceIdNotesNoteIdPatch**](docs/DefaultApi.md#apiv1devicesdeviceidnotesnoteidpatch) | **PATCH** /api/v1/devices/{device_id}/notes/{note_id} | Update Device Note
*DefaultApi* | [**apiV1DevicesDeviceIdNotesPost**](docs/DefaultApi.md#apiv1devicesdeviceidnotespost) | **POST** /api/v1/devices/{device_id}/notes | Create Device Note
*DefaultApi* | [**apiV1DevicesDeviceIdParametersGet**](docs/DefaultApi.md#apiv1devicesdeviceidparametersget) | **GET** /api/v1/devices/{device_id}/parameters | Get Device Parameters
*DefaultApi* | [**apiV1DevicesDeviceIdPatch**](docs/DefaultApi.md#apiv1devicesdeviceidpatch) | **PATCH** /api/v1/devices/{device_id} | Update Device
*DefaultApi* | [**apiV1DevicesDeviceIdSecretsBypasscodeGet**](docs/DefaultApi.md#apiv1devicesdeviceidsecretsbypasscodeget) | **GET** /api/v1/devices/{device_id}/secrets/bypasscode | Get Activation Lock Bypass Code
*DefaultApi* | [**apiV1DevicesDeviceIdSecretsFilevaultkeyGet**](docs/DefaultApi.md#apiv1devicesdeviceidsecretsfilevaultkeyget) | **GET** /api/v1/devices/{device_id}/secrets/filevaultkey | Get FileVault Recovery Key
*DefaultApi* | [**apiV1DevicesDeviceIdSecretsRecoverypasswordGet**](docs/DefaultApi.md#apiv1devicesdeviceidsecretsrecoverypasswordget) | **GET** /api/v1/devices/{device_id}/secrets/recoverypassword | Get Recovery Lock Password
*DefaultApi* | [**apiV1DevicesDeviceIdSecretsUnlockpinGet**](docs/DefaultApi.md#apiv1devicesdeviceidsecretsunlockpinget) | **GET** /api/v1/devices/{device_id}/secrets/unlockpin | Get Unlock Pin
*DefaultApi* | [**apiV1DevicesDeviceIdStatusGet**](docs/DefaultApi.md#apiv1devicesdeviceidstatusget) | **GET** /api/v1/devices/{device_id}/status | Get Device Status
*DefaultApi* | [**apiV1Deviceslimit300Get**](docs/DefaultApi.md#apiv1deviceslimit300get) | **GET** /api/v1/devices?limit&#x3D;300 | List Devices
*DefaultApi* | [**apiV1IntegrationsAppleAdeAdeTokenIdDelete**](docs/DefaultApi.md#apiv1integrationsappleadeadetokeniddelete) | **DELETE** /api/v1/integrations/apple/ade/{ade_token_id} | Delete ADE integration
*DefaultApi* | [**apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet**](docs/DefaultApi.md#apiv1integrationsappleadeadetokeniddevicesget) | **GET** /api/v1/integrations/apple/ade/{ade_token_id}/devices | List devices associated to ADE token
*DefaultApi* | [**apiV1IntegrationsAppleAdeAdeTokenIdGet**](docs/DefaultApi.md#apiv1integrationsappleadeadetokenidget) | **GET** /api/v1/integrations/apple/ade/{ade_token_id} | Get ADE integration
*DefaultApi* | [**apiV1IntegrationsAppleAdeAdeTokenIdPatch**](docs/DefaultApi.md#apiv1integrationsappleadeadetokenidpatch) | **PATCH** /api/v1/integrations/apple/ade/{ade_token_id} | Update ADE integration
*DefaultApi* | [**apiV1IntegrationsAppleAdeAdeTokenIdRenewPost**](docs/DefaultApi.md#apiv1integrationsappleadeadetokenidrenewpost) | **POST** /api/v1/integrations/apple/ade/{ade_token_id}/renew | Renew ADE integration
*DefaultApi* | [**apiV1IntegrationsAppleAdeDevicesDeviceIdGet**](docs/DefaultApi.md#apiv1integrationsappleadedevicesdeviceidget) | **GET** /api/v1/integrations/apple/ade/devices/{device_id} | Get ADE device
*DefaultApi* | [**apiV1IntegrationsAppleAdeDevicesDeviceIdPatch**](docs/DefaultApi.md#apiv1integrationsappleadedevicesdeviceidpatch) | **PATCH** /api/v1/integrations/apple/ade/devices/{device_id} | Update ADE device
*DefaultApi* | [**apiV1IntegrationsAppleAdeDevicesGet**](docs/DefaultApi.md#apiv1integrationsappleadedevicesget) | **GET** /api/v1/integrations/apple/ade/devices | List ADE devices
*DefaultApi* | [**apiV1IntegrationsAppleAdeGet**](docs/DefaultApi.md#apiv1integrationsappleadeget) | **GET** /api/v1/integrations/apple/ade | List ADE integrations
*DefaultApi* | [**apiV1IntegrationsAppleAdePost**](docs/DefaultApi.md#apiv1integrationsappleadepost) | **POST** /api/v1/integrations/apple/ade/ | Create ADE integration
*DefaultApi* | [**apiV1IntegrationsAppleAdePublicKeyGet**](docs/DefaultApi.md#apiv1integrationsappleadepublickeyget) | **GET** /api/v1/integrations/apple/ade/public_key/ | Download ADE public key
*DefaultApi* | [**apiV1LibraryCustomAppsGet**](docs/DefaultApi.md#apiv1librarycustomappsget) | **GET** /api/v1/library/custom-apps | List Custom Apps
*DefaultApi* | [**apiV1LibraryCustomAppsLibraryItemIdDelete**](docs/DefaultApi.md#apiv1librarycustomappslibraryitemiddelete) | **DELETE** /api/v1/library/custom-apps/{library_item_id} | Delete Custom App
*DefaultApi* | [**apiV1LibraryCustomAppsLibraryItemIdGet**](docs/DefaultApi.md#apiv1librarycustomappslibraryitemidget) | **GET** /api/v1/library/custom-apps/{library_item_id} | Get Custom App
*DefaultApi* | [**apiV1LibraryCustomAppsLibraryItemIdPatch**](docs/DefaultApi.md#apiv1librarycustomappslibraryitemidpatch) | **PATCH** /api/v1/library/custom-apps/{library_item_id} | Update Custom App
*DefaultApi* | [**apiV1LibraryCustomAppsPost**](docs/DefaultApi.md#apiv1librarycustomappspost) | **POST** /api/v1/library/custom-apps | Create Custom App
*DefaultApi* | [**apiV1LibraryCustomAppsUploadPost**](docs/DefaultApi.md#apiv1librarycustomappsuploadpost) | **POST** /api/v1/library/custom-apps/upload | Upload Custom App
*DefaultApi* | [**apiV1LibraryCustomProfilesGet**](docs/DefaultApi.md#apiv1librarycustomprofilesget) | **GET** /api/v1/library/custom-profiles | List Custom Profiles
*DefaultApi* | [**apiV1LibraryCustomProfilesLibraryItemIdDelete**](docs/DefaultApi.md#apiv1librarycustomprofileslibraryitemiddelete) | **DELETE** /api/v1/library/custom-profiles/{library_item_id} | Delete Custom Profile
*DefaultApi* | [**apiV1LibraryCustomProfilesLibraryItemIdGet**](docs/DefaultApi.md#apiv1librarycustomprofileslibraryitemidget) | **GET** /api/v1/library/custom-profiles/{library_item_id} | Get Custom Profile
*DefaultApi* | [**apiV1LibraryCustomProfilesLibraryItemIdPatch**](docs/DefaultApi.md#apiv1librarycustomprofileslibraryitemidpatch) | **PATCH** /api/v1/library/custom-profiles/{library_item_id} | Update Custom Profile
*DefaultApi* | [**apiV1LibraryCustomProfilesPost**](docs/DefaultApi.md#apiv1librarycustomprofilespost) | **POST** /api/v1/library/custom-profiles | Create Custom Profile
*DefaultApi* | [**apiV1LibraryCustomScriptsGet**](docs/DefaultApi.md#apiv1librarycustomscriptsget) | **GET** /api/v1/library/custom-scripts | List Custom Scripts
*DefaultApi* | [**apiV1LibraryCustomScriptsLibraryItemIdDelete**](docs/DefaultApi.md#apiv1librarycustomscriptslibraryitemiddelete) | **DELETE** /api/v1/library/custom-scripts/{library_item_id} | Delete Custom Script
*DefaultApi* | [**apiV1LibraryCustomScriptsLibraryItemIdGet**](docs/DefaultApi.md#apiv1librarycustomscriptslibraryitemidget) | **GET** /api/v1/library/custom-scripts/{library_item_id} | Get Custom Script
*DefaultApi* | [**apiV1LibraryCustomScriptsLibraryItemIdPatch**](docs/DefaultApi.md#apiv1librarycustomscriptslibraryitemidpatch) | **PATCH** /api/v1/library/custom-scripts/{library_item_id} | Update Custom Script
*DefaultApi* | [**apiV1LibraryCustomScriptsPost**](docs/DefaultApi.md#apiv1librarycustomscriptspost) | **POST** /api/v1/library/custom-scripts | Create Custom Script
*DefaultApi* | [**apiV1LibraryLibraryItemsLibraryItemIdActivityGet**](docs/DefaultApi.md#apiv1librarylibraryitemslibraryitemidactivityget) | **GET** /api/v1/library/library-items/{library_item_id}/activity | Get Library Item Activity
*DefaultApi* | [**apiV1LibraryLibraryItemsLibraryItemIdStatusGet**](docs/DefaultApi.md#apiv1librarylibraryitemslibraryitemidstatusget) | **GET** /api/v1/library/library-items/{library_item_id}/status | Get Library Item Statuses
*DefaultApi* | [**apiV1PrismActivationLockGet**](docs/DefaultApi.md#apiv1prismactivationlockget) | **GET** /api/v1/prism/activation_lock | Activation lock
*DefaultApi* | [**apiV1PrismApplicationFirewallGet**](docs/DefaultApi.md#apiv1prismapplicationfirewallget) | **GET** /api/v1/prism/application_firewall | Application firewall
*DefaultApi* | [**apiV1PrismAppsGet**](docs/DefaultApi.md#apiv1prismappsget) | **GET** /api/v1/prism/apps | Applications
*DefaultApi* | [**apiV1PrismCertificatesGet**](docs/DefaultApi.md#apiv1prismcertificatesget) | **GET** /api/v1/prism/certificates | Certificates
*DefaultApi* | [**apiV1PrismCountcategoryappsGet**](docs/DefaultApi.md#apiv1prismcountcategoryappsget) | **GET** /api/v1/prism/count?category&#x3D;apps | Count
*DefaultApi* | [**apiV1PrismDesktopAndScreensaverGet**](docs/DefaultApi.md#apiv1prismdesktopandscreensaverget) | **GET** /api/v1/prism/desktop_and_screensaver | Desktop and Screensaver
*DefaultApi* | [**apiV1PrismDeviceInformationGet**](docs/DefaultApi.md#apiv1prismdeviceinformationget) | **GET** /api/v1/prism/device_information | Device information
*DefaultApi* | [**apiV1PrismExportExportIdGet**](docs/DefaultApi.md#apiv1prismexportexportidget) | **GET** /api/v1/prism/export/{export_id} | Get category export
*DefaultApi* | [**apiV1PrismExportPost**](docs/DefaultApi.md#apiv1prismexportpost) | **POST** /api/v1/prism/export | Request category export
*DefaultApi* | [**apiV1PrismFilevaultGet**](docs/DefaultApi.md#apiv1prismfilevaultget) | **GET** /api/v1/prism/filevault | FileVault
*DefaultApi* | [**apiV1PrismGatekeeperAndXprotectGet**](docs/DefaultApi.md#apiv1prismgatekeeperandxprotectget) | **GET** /api/v1/prism/gatekeeper_and_xprotect | Gatekeeper and XProtect
*DefaultApi* | [**apiV1PrismInstalledProfilesGet**](docs/DefaultApi.md#apiv1prisminstalledprofilesget) | **GET** /api/v1/prism/installed_profiles | Installed profiles
*DefaultApi* | [**apiV1PrismKernelExtensionsGet**](docs/DefaultApi.md#apiv1prismkernelextensionsget) | **GET** /api/v1/prism/kernel_extensions | Kernel Extensions
*DefaultApi* | [**apiV1PrismLaunchAgentsAndDaemonsGet**](docs/DefaultApi.md#apiv1prismlaunchagentsanddaemonsget) | **GET** /api/v1/prism/launch_agents_and_daemons | Launch Agents and Daemons
*DefaultApi* | [**apiV1PrismLocalUsersGet**](docs/DefaultApi.md#apiv1prismlocalusersget) | **GET** /api/v1/prism/local_users | Local users
*DefaultApi* | [**apiV1PrismStartupSettingsGet**](docs/DefaultApi.md#apiv1prismstartupsettingsget) | **GET** /api/v1/prism/startup_settings | Startup settings
*DefaultApi* | [**apiV1PrismSystemExtensionsGet**](docs/DefaultApi.md#apiv1prismsystemextensionsget) | **GET** /api/v1/prism/system_extensions | System Extensions
*DefaultApi* | [**apiV1PrismTransparencyDatabaseGet**](docs/DefaultApi.md#apiv1prismtransparencydatabaseget) | **GET** /api/v1/prism/transparency_database | Transparency database
*DefaultApi* | [**apiV1SelfServiceCategoriesGet**](docs/DefaultApi.md#apiv1selfservicecategoriesget) | **GET** /api/v1/self-service/categories | List Self Service Categories
*DefaultApi* | [**apiV1SettingsLicensingGet**](docs/DefaultApi.md#apiv1settingslicensingget) | **GET** /api/v1/settings/licensing | Licensing
*DefaultApi* | [**apiV1TagsPost**](docs/DefaultApi.md#apiv1tagspost) | **POST** /api/v1/tags | Create Tag
*DefaultApi* | [**apiV1TagsTagIdDelete**](docs/DefaultApi.md#apiv1tagstagiddelete) | **DELETE** /api/v1/tags/{tag_id} | Delete Tag
*DefaultApi* | [**apiV1TagsTagIdPatch**](docs/DefaultApi.md#apiv1tagstagidpatch) | **PATCH** /api/v1/tags/{tag_id} | Update Tag
*DefaultApi* | [**apiV1TagssearchaccuhiveGet**](docs/DefaultApi.md#apiv1tagssearchaccuhiveget) | **GET** /api/v1/tags?search&#x3D;accuhive | Get Tags
*DefaultApi* | [**apiV1ThreatDetailsGet**](docs/DefaultApi.md#apiv1threatdetailsget) | **GET** /api/v1/threat-details | Get Threat Details
*DefaultApi* | [**apiV1UsersGet**](docs/DefaultApi.md#apiv1usersget) | **GET** /api/v1/users | List Users
*DefaultApi* | [**apiV1UsersUserIdGet**](docs/DefaultApi.md#apiv1usersuseridget) | **GET** /api/v1/users/{user_id} | Get User
*DefaultApi* | [**postUrlPost**](docs/DefaultApi.md#posturlpost) | **POST** /{post_url} | Upload to S3


## Documentation For Models



## Documentation For Authorization

 All endpoints do not require authorization.

