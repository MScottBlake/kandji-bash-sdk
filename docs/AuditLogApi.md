# AuditLogApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**listAuditEvents**](AuditLogApi.md#listAuditEvents) | **GET** /api/v1/audit/events | List audit events



## listAuditEvents

List audit events

<p>List Audit log events from the Kandji Activity module.</p>
<p>Returns events related to</p>
<ul>
<li><p>Blueprint CUD, Library Item CUD</p>
</li>
<li><p>When some sensitive data is viewed (e.g., FileVault keys, recovery keys)</p>
</li>
<li><p>Device deleted, enrolled, mdm removed, changed blueprint</p>
</li>
<li><p>User directory events (e.g., directory user deletions)</p>
</li>
<li><p>API actions, Kandji tenant owner updates, API token CUD, Kandji admin user management CUD</p>
</li>
<li><p>Vulnerability management customers can see events detections and remediations.</p>
</li>
</ul>

### Example

```bash
kandji listAuditEvents  limit=value  sort_by=value  start_date=value  end_date=value  cursor=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **string** | A max upper <code>limit</code> is set at 500 records returned per request. Pagination should be used using the cursor in the <code>next</code> key to request more results. Additionally, parameter queries can be added to a request to filter the results. | [default to null]
 **sortBy** | **string** | Sort results by <code>occurred_at</code>, <code>id</code> either ascending (default behavior) or descending(-) order. | [default to null]
 **startDate** | **string** | Filter by start date in datetime or year-month-day (2024-11-26) formats | [optional] [default to null]
 **endDate** | **string** | Filter by start date in datetime or year-month-day (2024-12-06) formats | [optional] [default to null]
 **cursor** | **string** | You can pass the next cursor as a parameter or use the URL in the next key to get the next page of results or to start from where you left off last. | [optional] [default to null]

### Return type

[**AuditLogListAuditEvents200Response**](AuditLogListAuditEvents200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

