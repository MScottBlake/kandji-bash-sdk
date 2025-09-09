# VulnerabilitiesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getVulnerabilityDescription**](VulnerabilitiesApi.md#getVulnerabilityDescription) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id} | Get Vulnerability Description
[**listAffectedDevices**](VulnerabilitiesApi.md#listAffectedDevices) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/devices | List Affected Devices
[**listAffectedSoftware**](VulnerabilitiesApi.md#listAffectedSoftware) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/software | List Affected Software
[**listDetections**](VulnerabilitiesApi.md#listDetections) | **GET** /api/v1/vulnerability-management/detections | List Detections
[**listVulnerabilities**](VulnerabilitiesApi.md#listVulnerabilities) | **GET** /api/v1/vulnerability-management/vulnerabilities | List Vulnerabilities



## getVulnerabilityDescription

Get Vulnerability Description

Retrieve information about a CVE.

### Example

```bash
kandji getVulnerabilityDescription cve_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cveId** | **string** |  | [default to null]

### Return type

[**VulnerabilitiesGetVulnerabilityDescription200Response**](VulnerabilitiesGetVulnerabilityDescription200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAffectedDevices

List Affected Devices

Retrieve a list of devices impacted by a specified <code>cve_id</code> vulnerability for a tenants fleet.

### Example

```bash
kandji listAffectedDevices cve_id=value  page=value  size=value  sort_by=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cveId** | **string** |  | [default to null]
 **page** | **string** | The page number of the response. | [optional] [default to null]
 **size** | **string** | A hard upper limit is set at 50  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **sortBy** | **string** | <p>Field to sort by.</p>
<ul>
<li>name (device name)</li>
<li>detection_datetime</li>
</ul> | [optional] [default to null]
 **filter** | **string** | <p>Filterable columns:</p>
<ul>
<li>name</li>
<li>detection_datetime</li>
</ul> | [optional] [default to null]

### Return type

[**VulnerabilitiesListAffectedDevices200Response**](VulnerabilitiesListAffectedDevices200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAffectedSoftware

List Affected Software

This endpoint makes a request to retrieve a list of software impacted by a specified <code>cve_id</code> vulnerability for a tenant's fleet.

### Example

```bash
kandji listAffectedSoftware cve_id=value  page=value  size=value  sort_by=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cveId** | **string** |  | [default to null]
 **page** | **string** | The page number of the response. | [optional] [default to null]
 **size** | **string** | A hard upper limit is set at 50  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **sortBy** | **string** | <p>Field to sort by.</p>
<ul>
<li>software (software name)</li>
<li>detection_datetime</li>
</ul> | [optional] [default to null]
 **filter** | **string** | <p>Filter results. Similar to prism filters.
Filterable columns</p>
<ul>
<li>blueprint_id</li>
<li>detection_datetime</li>
</ul> | [optional] [default to null]

### Return type

[**VulnerabilitiesListAffectedDevices200Response**](VulnerabilitiesListAffectedDevices200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listDetections

List Detections

Retrieve a list of all vulnerability detections across the device fleet.

### Example

```bash
kandji listDetections  after=value  size=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **after** | **string** | Cursor token. | [optional] [default to null]
 **size** | **string** | A hard upper <code>limit</code> is set at 300  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **filter** | **string** | <p>Filter on any key attribute within the response.</p>
<ul>
<li>device_id</li>
<li>device_name</li>
<li>device_serial_number</li>
<li>device_model</li>
<li>device_os_version</li>
<li>blueprint_id</li>
<li>blueprint_name</li>
<li>name</li>
<li>path</li>
<li>version</li>
<li>bundle_id</li>
<li>cve_id</li>
<li>cve_description</li>
<li>cve_link</li>
<li>cvss_score</li>
<li>cvss_severity</li>
<li>detection_datetime</li>
<li>cve_published_at</li>
<li>cve_modified_at</li>
</ul> | [optional] [default to null]

### Return type

[**VulnerabilitiesListDetections200Response**](VulnerabilitiesListDetections200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listVulnerabilities

List Vulnerabilities

Retrieve a list of all vulnerabilities grouped by CVE.

### Example

```bash
kandji listVulnerabilities  page=value  size=value  sort_by=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **string** | The page number of the response. | [optional] [default to null]
 **size** | **string** | A hard upper limit is set at 50  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **sortBy** | **string** | <p>Field to sort by.</p>
<ul>
<li><p>age</p>
</li>
<li><p>cve_id</p>
</li>
<li><p>cvss_score</p>
</li>
<li><p>device_count</p>
</li>
<li><p>known_exploit</p>
</li>
<li><p>software (software name)</p>
</li>
<li><p>severity</p>
</li>
<li><p>status</p>
</li>
</ul> | [optional] [default to null]
 **filter** | **string** | <p>Filter results. Similar to prism filters.
Filterable columns</p>
<ul>
<li>cve_id</li>
<li>software</li>
<li>severity</li>
<li>first_detection_date</li>
<li>status</li>
</ul> | [optional] [default to null]

### Return type

[**VulnerabilitiesListVulnerabilities200Response**](VulnerabilitiesListVulnerabilities200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

