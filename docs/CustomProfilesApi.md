# CustomProfilesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**customProfilesCreateCustomProfile**](CustomProfilesApi.md#customProfilesCreateCustomProfile) | **POST** /api/v1/library/custom-profiles | Create Custom Profile
[**customProfilesDeleteCustomProfile**](CustomProfilesApi.md#customProfilesDeleteCustomProfile) | **DELETE** /api/v1/library/custom-profiles/{library_item_id} | Delete Custom Profile
[**customProfilesGetCustomProfile**](CustomProfilesApi.md#customProfilesGetCustomProfile) | **GET** /api/v1/library/custom-profiles/{library_item_id} | Get Custom Profile
[**customProfilesListCustomProfiles**](CustomProfilesApi.md#customProfilesListCustomProfiles) | **GET** /api/v1/library/custom-profiles | List Custom Profiles
[**customProfilesUpdateCustomProfile**](CustomProfilesApi.md#customProfilesUpdateCustomProfile) | **PATCH** /api/v1/library/custom-profiles/{library_item_id} | Update Custom Profile



## customProfilesCreateCustomProfile

Create Custom Profile

This request allows you to create a custom profile in the Kandji library.

### Example

```bash
kandji_sdk customProfilesCreateCustomProfile
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | (Required) The profile name | [default to null]
 **file** | **binary** | (Required) The path to the profile's .mobileconfig file | [default to null]
 **active** | **string** | (Optional, default=true) Whether this library item is active | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customProfilesDeleteCustomProfile

Delete Custom Profile

<p>NOTICE: This is permanent so be careful.</p>
<p>This endpoint sends a request to delete a specific custom profile from the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>

### Example

```bash
kandji_sdk customProfilesDeleteCustomProfile library_item_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryItemId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: text/html; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customProfilesGetCustomProfile

Get Custom Profile

<p>This endpoint retrieves details about a specific custom profile from the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>

### Example

```bash
kandji_sdk customProfilesGetCustomProfile library_item_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryItemId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customProfilesListCustomProfiles

List Custom Profiles

This endpoint makes a request to retrieve a list of custom profiles from the Kandji library.

### Example

```bash
kandji_sdk customProfilesListCustomProfiles  page=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **string** | Optional page number. Used when results exceed pagination threshold. A hard upper limit is set at 300 device records returned per request. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## customProfilesUpdateCustomProfile

Update Custom Profile

<p>This request allows you to update a custom profile in the Kandji library.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>library_item_id</code> (path parameter): The unique identifier of the library item.</p>

### Example

```bash
kandji_sdk customProfilesUpdateCustomProfile library_item_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryItemId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

