# LostModeApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**lostModeDisableLostMode**](LostModeApi.md#lostModeDisableLostMode) | **POST** /api/v1/devices/{device_id}/action/disablelostmode | Disable Lost Mode
[**lostModeEnableLostMode**](LostModeApi.md#lostModeEnableLostMode) | **POST** /api/v1/devices/{device_id}/action/enablelostmode | Enable Lost Mode
[**lostModePlayLostModeSound**](LostModeApi.md#lostModePlayLostModeSound) | **POST** /api/v1/devices/{device_id}/action/playlostmodesound | Play Lost Mode Sound
[**lostModeUpdateLocation**](LostModeApi.md#lostModeUpdateLocation) | **POST** /api/v1/devices/{device_id}/action/updatelocation | Update Location



## lostModeDisableLostMode

Disable Lost Mode

<p>This command will send a request to turn off lost mode on iOS and iPadOS.</p>
<p>If the command is already pending, the message &quot;<em>Disable lost mode is already pending for this device.</em>&quot; will be in the response.</p>

### Example

```bash
kandji lostModeDisableLostMode device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## lostModeEnableLostMode

Enable Lost Mode

<p>This endpoint sends an MDM command to remotely turn on lost mode on iOS and iPadOS.</p>
<p>Optionally, a JSON payload can be sent in the request to set a lock message, phone number, and footnote on the target device.</p>

### Example

```bash
kandji lostModeEnableLostMode device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]
 **body** | **string** |  | [optional]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## lostModePlayLostModeSound

Play Lost Mode Sound

<p>This command will tell the target iOS or iPadOS device to play the lost mode sound.</p>
<p><strong>Note</strong>: The Lost Mode sound will play for 2 minutes, even if the device is in silent mode. Anyone finding the device can silence the sound by pressing any of its side buttons.</p>

### Example

```bash
kandji lostModePlayLostModeSound device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## lostModeUpdateLocation

Update Location

This endpoint sends an MDM command to update the location data on iOS and iPadOS.

### Example

```bash
kandji lostModeUpdateLocation device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

