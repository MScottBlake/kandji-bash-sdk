# SelfServiceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**selfServiceListSelfServiceCategories**](SelfServiceApi.md#selfServiceListSelfServiceCategories) | **GET** /api/v1/self-service/categories | List Self Service Categories



## selfServiceListSelfServiceCategories

List Self Service Categories

<p>This endpoint retrieves a list of self-service categories and their associated IDs.</p>
<p>If you are planning to make a Library item available in Self Service under a specific category, you can call this endpoint to get the category ID and then use that ID when creating or updating the library item via the Kandji API.</p>

### Example

```bash
kandji_sdk selfServiceListSelfServiceCategories
```

### Parameters

This endpoint does not need any parameter.

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

