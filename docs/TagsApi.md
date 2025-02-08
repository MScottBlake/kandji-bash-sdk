# TagsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**tagsCreateTag**](TagsApi.md#tagsCreateTag) | **POST** /api/v1/tags | Create Tag
[**tagsDeleteTag**](TagsApi.md#tagsDeleteTag) | **DELETE** /api/v1/tags/{tag_id} | Delete Tag
[**tagsGetTags**](TagsApi.md#tagsGetTags) | **GET** /api/v1/tags | Get Tags
[**tagsUpdateTag**](TagsApi.md#tagsUpdateTag) | **PATCH** /api/v1/tags/{tag_id} | Update Tag



## tagsCreateTag

Create Tag

Create a tag. Can only create one tag per request.

### Example

```bash
kandji tagsCreateTag
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


## tagsDeleteTag

Delete Tag

<p>Delete a tag.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>

### Example

```bash
kandji tagsDeleteTag tag_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## tagsGetTags

Get Tags

Return configured tags.

### Example

```bash
kandji tagsGetTags  search=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string** | Return resultes containing a given tag search string. | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## tagsUpdateTag

Update Tag

<p>Update tag name.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>tag_id</code> (path parameter): The unique identifier of the tag.</p>

### Example

```bash
kandji tagsUpdateTag tag_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **string** |  | [default to null]
 **body** | **string** |  | [optional]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

