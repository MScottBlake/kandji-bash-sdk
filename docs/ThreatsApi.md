# ThreatsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBehavioralDetections**](ThreatsApi.md#getBehavioralDetections) | **GET** /api/v1/behavioral-detections | Get Behavioral Detections
[**getThreatDetails**](ThreatsApi.md#getThreatDetails) | **GET** /api/v1/threat-details | Get Threat Details



## getBehavioralDetections

Get Behavioral Detections

Get Behavioral Detections.

### Example

```bash
kandji getBehavioralDetections  threat_id=value  classification=value  status=value  date_range=value  detection_date=value  device_id=value  malware_family=value  parent_process_name=value  target_process_name=value  informational_tags=value  term=value  sort_by=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threatId** | **string** | Filter by a specific threat ID (threat_id=Kandji_BD_0096). | [optional] [default to null]
 **classification** | **string** | Filter by threat classification (classification=malicious). | [optional] [default to null]
 **status** | **string** | Filter by threat status (threat_status=blocked) | [optional] [default to null]
 **dateRange** | **string** | Return all records within a specified number of days (Int) | [optional] [default to null]
 **detectionDate** | **string** | two query params detection_date_from and detection_date_to | [optional] [default to null]
 **deviceId** | **string** | Search for a specific device by the device id (uuid). | [optional] [default to null]
 **malwareFamily** | **string** | Filter by malware family (malware_family=TrickBot). | [optional] [default to null]
 **parentProcessName** | **string** | Filter by parent process (parent_process_name=bash). | [optional] [default to null]
 **targetProcessName** | **string** | Filter by target process (target_process_name=python). | [optional] [default to null]
 **informationalTags** | **string** | Filter by tags (informational_tags=exploit,privilege_escalation). | [optional] [default to null]
 **term** | **string** | Search term to filter threat results. Device name, file hash, image path | [optional] [default to null]
 **sortBy** | **string** | <p>Detections can be sorted by any of the following keys. Prepending a dash (-) to the parameter value will reverse the order of the returned results. ?sort_by=-device_name will order the response by device_name in descending order.</p>
<ul>
<li>threat_id</li>
<li>classification</li>
<li>device_name</li>
<li>parent_process_name</li>
<li>target_process_name</li>
<li>detection_date</li>
<li>status</li>
</ul> | [optional] [default to null]
 **limit** | **string** | A hard upper <code>limit</code> is set at 1000 records returned per request. If more records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. 
Additionally, parameter queries can be added to a request to limit the results. | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return. | [optional] [default to null]

### Return type

[**ThreatsGetBehavioralDetections200Response**](ThreatsGetBehavioralDetections200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getThreatDetails

Get Threat Details

Get threat details.

### Example

```bash
kandji getThreatDetails  classification=value  date_range=value  device_id=value  status=value  sort_by=value  term=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **classification** | **string** | Return all records matching a specified classification. The following classification options are available: <code>malware</code> and <code>pup</code>. Leave this parameter empty to return all classification types. | [optional] [default to null]
 **dateRange** | **string** | Return all records within a specified number of days. Any positive number of days may be specified. Examples: <code>7</code>, <code>30</code>, <code>60</code>, <code>90</code>, <code>180</code>, or <code>365</code>. | [optional] [default to null]
 **deviceId** | **string** |  | [optional] [default to null]
 **status** | **string** | Return all records matching a specified status. The following status options are available: <code>quarantined</code>, <code>not_quarantined</code>, or <code>released</code>. Leave this parameter empty to return all status types. | [optional] [default to null]
 **sortBy** | **string** | <p>Results can be sorted with the following options: </p>
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
<p><code>?sort_by=-device_name</code> will order the response by device_name in descending order.</p> | [optional] [default to null]
 **term** | **string** | <p>Search term to filter threat results.</p>
<p>The response will include anything matching the following fields: <code>device_name</code>, <code>file_hash</code>, and <code>file_path</code>.</p>
<p>So if you search for <code>bad file</code>, the results will include anywhere <code>bad file</code> exists in the three fields above.</p> | [optional] [default to null]
 **limit** | **string** | <p>A hard upper <code>limit</code> is set at 1000 records returned per request. If more records are expected, pagination should be used using the <code>limit</code> and <code>offset</code> parameters. </p>
<p>Additionally, parameter queries can be added to a request to limit the results.</p> | [optional] [default to null]
 **offset** | **string** | Specify the starting record to return | [optional] [default to null]

### Return type

[**ThreatsGetThreatDetails200Response**](ThreatsGetThreatDetails200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

