# AuditLogApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**listAuditEvents**](AuditLogApi.md#listAuditEvents) | **GET** /api/v1/audit/events | List audit events



## listAuditEvents

List audit events

<p>List audit log events from the Activity module.</p>
<p>Returns events related to</p>
<ul>
<li><p>Blueprint and Library Item creation, updates, and deletions (Create, Update, Delete)</p>
</li>
<li><p>Access to sensitive data (such as FileVault keys and recovery keys)</p>
</li>
<li><p>Device lifecycle events (enrollment, deletion, MDM removal, blueprint changes)</p>
</li>
<li><p>User directory events (including directory user deletions)</p>
</li>
<li><p>Administrative actions (tenant owner updates, API token management (Create, Update, Delete))</p>
</li>
<li><p>Admin user management activities</p>
</li>
<li><p>Vulnerability management events for detections and remediations (for customers with this feature)</p>
</li>
<li><p>Endpoint Detection and Response events for detections, remediations, and admin actions (for customers with this feature)</p>
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

