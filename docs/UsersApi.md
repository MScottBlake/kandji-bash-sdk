# UsersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersDeleteUser**](UsersApi.md#usersDeleteUser) | **DELETE** /api/v1/users/{user_id} | Delete User
[**usersGetUser**](UsersApi.md#usersGetUser) | **GET** /api/v1/users/{user_id} | Get User
[**usersListUsers**](UsersApi.md#usersListUsers) | **GET** /api/v1/users | List Users



## usersDeleteUser

Delete User

<p>This endpoint makes a request to delete a specified user directory integration user by id (uuid).</p>
<h3 id=&quot;user-still-assigned-to-device&quot;>User still assigned to device</h3>
<p>You will see the following response (400 bad request), if a user is still assigned to one or more devices in Kandji. The user will need to be unassigned from the device either manually through the Kandji tenant or programatically using the Update device API endpoint.</p>
<pre class=&quot;click-to-expand-wrapper is-snippet-wrapper&quot;><code class=&quot;language-json&quot;>{
    &quot;detail&quot;: &quot;User still assigned to one or more devices.&quot;
}

</code></pre>

### Example

```bash
kandji usersDeleteUser user_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## usersGetUser

Get User

This endpoint makes a request to retrieve a specified user directory integration user by id.

### Example

```bash
kandji usersGetUser user_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## usersListUsers

List Users

<p>This endpoint makes a request to retrieve a list of users from user directory integrations.</p>
<p>A maximum of 300 records are returned per request, and pagination can be performed leveraging the URLs provided in the <code>next</code> and <code>previous</code> keys in the response. If there are no more results available, the respective key will be <code>null</code>.</p>

### Example

```bash
kandji usersListUsers  email=value  id=value  integration_id=value  archived=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Returns users with email addresses containing the provided string. | [optional] [default to null]
 **id** | **string** | Search for a user matching the provided UUID value. | [optional] [default to null]
 **integrationId** | **string** | Search for a integration matching the provided UUID value. | [optional] [default to null]
 **archived** | **string** | Return only users that are either archived (true) or not archived (false). Archived users are users that appear in the Kandji Users module under the Archived tab. | [optional] [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

