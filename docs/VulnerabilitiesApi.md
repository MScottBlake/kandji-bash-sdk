# VulnerabilitiesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getVulnerabilityDescription**](VulnerabilitiesApi.md#getVulnerabilityDescription) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id} | Get Vulnerability Description
[**listAffectedApplications**](VulnerabilitiesApi.md#listAffectedApplications) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/applications | List Affected Applications
[**listAffectedDevices**](VulnerabilitiesApi.md#listAffectedDevices) | **GET** /api/v1/vulnerability-management/vulnerabilities/{cve_id}/devices | List Affected Devices
[**listDetections**](VulnerabilitiesApi.md#listDetections) | **GET** /api/v1/vulnerability-management/detections | List Detections
[**listVulnerabilities**](VulnerabilitiesApi.md#listVulnerabilities) | **GET** /api/v1/vulnerability-management/vulnerabilities | List Vulnerabilities



## getVulnerabilityDescription

Get Vulnerability Description

This endpoint makes a request to retrieve information about a cve and summary information about detections for a tenants fleet.

### Example

```bash
kandji getVulnerabilityDescription cve_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cveId** | **string** |  | [default to null]

### Return type

[**InlineObject35**](InlineObject35.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAffectedApplications

List Affected Applications

This endpoint makes a request to retrieve a list of applications impacted by a specified <code>cve_id</code> vulnerability for a tenants fleet.

### Example

```bash
kandji listAffectedApplications cve_id=value  page=value  size=value  sort_by=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cveId** | **string** |  | [default to null]
 **page** | **string** | The page number of the response. | [optional] [default to null]
 **size** | **string** | A hard upper limit is set at 50  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **sortBy** | **string** | Field to sort by. Example: sort_by=app_name. | [optional] [default to null]
 **filter** | **string** | Filterable columns:
blueprint_id
updated_at | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAffectedDevices

List Affected Devices

This endpoint makes a request to retrieve a list of devices impacted by a specified <code>cve_id</code> vulnerability for a tenants fleet.

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
 **sortBy** | **string** | Field to sort by. Example: sort_by=app_name. | [optional] [default to null]
 **filter** | **string** | Filterable columns:
blueprint_id
updated_at | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listDetections

List Detections

This endpoint makes a request to retrieve a list of all vulnerability detections across the device fleet.

### Example

```bash
kandji listDetections  after=value  limit=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **after** | **string** | Cursor token. | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 300  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **filter** | **string** | Can filter on any key attribute within the response. | [optional] [default to null]

### Return type

[**InlineObject33**](InlineObject33.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listVulnerabilities

List Vulnerabilities

This endpoint makes a request to retrieve a list of all vulnerabilities grouped by cve.

### Example

```bash
kandji listVulnerabilities  page=value  size=value  sort_by=value  filter=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **string** | The page number of the response. | [optional] [default to null]
 **size** | **string** | A hard upper limit is set at 50  records returned per request. If more records are expected, pagination should be used using the URL value returned in the next attribute. Additionally, filters can be added to a request to limit the results. | [optional] [default to null]
 **sortBy** | **string** | Field to sort by. Example: sort_by=cve_id. | [optional] [default to null]
 **filter** | **string** | <p>Filterable columns:</p>
<p>cve_id
app_name
severity
first_detection_date
latest_detection_date</p> | [optional] [default to null]

### Return type

[**InlineObject34**](InlineObject34.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

