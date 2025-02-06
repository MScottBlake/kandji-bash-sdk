# PrismApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**prismActivationLock**](PrismApi.md#prismActivationLock) | **GET** /api/v1/prism/activation_lock | Activation lock
[**prismApplicationFirewall**](PrismApi.md#prismApplicationFirewall) | **GET** /api/v1/prism/application_firewall | Application firewall
[**prismApplications**](PrismApi.md#prismApplications) | **GET** /api/v1/prism/apps | Applications
[**prismCertificates**](PrismApi.md#prismCertificates) | **GET** /api/v1/prism/certificates | Certificates
[**prismCount**](PrismApi.md#prismCount) | **GET** /api/v1/prism/count | Count
[**prismDesktopAndScreensaver**](PrismApi.md#prismDesktopAndScreensaver) | **GET** /api/v1/prism/desktop_and_screensaver | Desktop and Screensaver
[**prismDeviceInformation**](PrismApi.md#prismDeviceInformation) | **GET** /api/v1/prism/device_information | Device information
[**prismFilevault**](PrismApi.md#prismFilevault) | **GET** /api/v1/prism/filevault | FileVault
[**prismGatekeeperAndXprotect**](PrismApi.md#prismGatekeeperAndXprotect) | **GET** /api/v1/prism/gatekeeper_and_xprotect | Gatekeeper and XProtect
[**prismGetCategoryExport**](PrismApi.md#prismGetCategoryExport) | **GET** /api/v1/prism/export/{export_id} | Get category export
[**prismInstalledProfiles**](PrismApi.md#prismInstalledProfiles) | **GET** /api/v1/prism/installed_profiles | Installed profiles
[**prismKernelExtensions**](PrismApi.md#prismKernelExtensions) | **GET** /api/v1/prism/kernel_extensions | Kernel Extensions
[**prismLaunchAgentsAndDaemons**](PrismApi.md#prismLaunchAgentsAndDaemons) | **GET** /api/v1/prism/launch_agents_and_daemons | Launch Agents and Daemons
[**prismLocalUsers**](PrismApi.md#prismLocalUsers) | **GET** /api/v1/prism/local_users | Local users
[**prismRequestCategoryExport**](PrismApi.md#prismRequestCategoryExport) | **POST** /api/v1/prism/export | Request category export
[**prismStartupSettings**](PrismApi.md#prismStartupSettings) | **GET** /api/v1/prism/startup_settings | Startup settings
[**prismSystemExtensions**](PrismApi.md#prismSystemExtensions) | **GET** /api/v1/prism/system_extensions | System Extensions
[**prismTransparencyDatabase**](PrismApi.md#prismTransparencyDatabase) | **GET** /api/v1/prism/transparency_database | Transparency database



## prismActivationLock

Activation lock

Get activation lock attributes for devices.

### Example

```bash
kandji_sdk prismActivationLock  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismApplicationFirewall

Application firewall

Get Application Firewall details for macOS.

### Example

```bash
kandji_sdk prismApplicationFirewall  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismApplications

Applications

Get the applications installed on macOS, iOS, iPadOS, and tvOS devices.

### Example

```bash
kandji_sdk prismApplications  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismCertificates

Certificates

Get certificate details.

### Example

```bash
kandji_sdk prismCertificates  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismCount

Count

<p>Get the total record count for the specified Prism category.</p>
<p>If a category contains spaces substitute the spaces for underscores (&quot;_&quot;) when using the API query.</p>
<p>Example: <code>Device information</code> becomes <code>device_information</code>.</p>

### Example

```bash
kandji_sdk prismCount  category=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **string** | <p>Return the count of records for the specified category. 
If a category contains spaces substitute the spaces for underscores (&quot;_&quot;) when using the API query.</p>
<p>Examples:
apps
device_information
kernel_extensions
system_extensions</p> | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismDesktopAndScreensaver

Desktop and Screensaver

Get Desktop and Screensaver details for macOS.

### Example

```bash
kandji_sdk prismDesktopAndScreensaver  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismDeviceInformation

Device information

Get attributes about devices.

### Example

```bash
kandji_sdk prismDeviceInformation  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | <p>JSON schema object containing one or more key value pairs.</p>
<p>Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.</p> | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return | [optional] [default to null]
 **body** | **string** |  | [optional]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismFilevault

FileVault

Get FileVault information for macOS.

### Example

```bash
kandji_sdk prismFilevault  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismGatekeeperAndXprotect

Gatekeeper and XProtect

Get Gatekeeper and XProtect attributes for macOS.

### Example

```bash
kandji_sdk prismGatekeeperAndXprotect  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Results are limited to Mac only as Gatekeeper and XProtect are not applicable for other platfroms. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismGetCategoryExport

Get category export

<p>Get an export request's status. To download the export, use the <code>signed_url</code>. This will download a CSV file containing the exported category information.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p>export_id (path parameter): The unique identifier of the the export job.</p>

### Example

```bash
kandji_sdk prismGetCategoryExport export_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismInstalledProfiles

Installed profiles

Get Installed Profiles attributes for macOS, iOS, iPadOS, and tvOS.

### Example

```bash
kandji_sdk prismInstalledProfiles  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismKernelExtensions

Kernel Extensions

Get Kernel Extension attributes for macOS.

### Example

```bash
kandji_sdk prismKernelExtensions  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | SON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismLaunchAgentsAndDaemons

Launch Agents and Daemons

Get Launch Agents and Daemons installed on macOS.

### Example

```bash
kandji_sdk prismLaunchAgentsAndDaemons  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismLocalUsers

Local users

Get Local Users detials for macOS.

### Example

```bash
kandji_sdk prismLocalUsers  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismRequestCategoryExport

Request category export

<p>Request export of a category. The <code>id</code> key is used when checking the export status using the <em>Request category export</em> endpoint.</p>
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
</div>

### Example

```bash
kandji_sdk prismRequestCategoryExport
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **string** |  | [optional]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismStartupSettings

Startup settings

Get Startup settings for macOS.

### Example

```bash
kandji_sdk prismStartupSettings  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismSystemExtensions

System Extensions

Get System Extension attributes for macOS.

### Example

```bash
kandji_sdk prismSystemExtensions  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## prismTransparencyDatabase

Transparency database

Get Transparency Database (TCC) attributes for macOS.

### Example

```bash
kandji_sdk prismTransparencyDatabase  blueprint_ids=value  device_families=value  filter=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **blueprintIds** | **string** | Filter results by one or more blueprint IDs separated by commas. | [optional] [default to null]
 **deviceFamilies** | **string** | Filter results by one or more device families separate by commas. | [optional] [default to null]
 **filter** | **string** | JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc. | [optional] [default to null]
 **sortBy** | **string** | Sort results by the name of a given response body key in either ascending (default behavior) or descending(<code>-</code>) order. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300 device records returned per request. If more device records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

