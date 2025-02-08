# NotesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**notesCreateDeviceNote**](NotesApi.md#notesCreateDeviceNote) | **POST** /api/v1/devices/{device_id}/notes | Create Device Note
[**notesDeleteDeviceNote**](NotesApi.md#notesDeleteDeviceNote) | **DELETE** /api/v1/devices/{device_id}/notes/{note_id} | Delete Device Note
[**notesGetDeviceNotes**](NotesApi.md#notesGetDeviceNotes) | **GET** /api/v1/devices/{device_id}/notes | Get Device Notes
[**notesRetrieveDeviceNote**](NotesApi.md#notesRetrieveDeviceNote) | **GET** /api/v1/devices/{device_id}/notes/{note_id} | Retrieve Device Note
[**notesUpdateDeviceNote**](NotesApi.md#notesUpdateDeviceNote) | **PATCH** /api/v1/devices/{device_id}/notes/{note_id} | Update Device Note



## notesCreateDeviceNote

Create Device Note

This request creates a note for the specified device ID.

### Example

```bash
kandji notesCreateDeviceNote device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]
 **body** | **string** |  | [optional]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## notesDeleteDeviceNote

Delete Device Note

This request deletes a specified note (Note ID) for the specified Device ID.

### Example

```bash
kandji notesDeleteDeviceNote device_id=value note_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]
 **noteId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## notesGetDeviceNotes

Get Device Notes

This request gets all notes for the specified Device ID.

### Example

```bash
kandji notesGetDeviceNotes device_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## notesRetrieveDeviceNote

Retrieve Device Note

This request retrieves a specified note (Note ID) for the specified Device ID.

### Example

```bash
kandji notesRetrieveDeviceNote device_id=value note_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]
 **noteId** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## notesUpdateDeviceNote

Update Device Note

This request patches a specified note (Note ID) for the specified Device ID.

### Example

```bash
kandji notesUpdateDeviceNote device_id=value note_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **string** |  | [default to null]
 **noteId** | **string** |  | [default to null]
 **body** | **string** |  | [optional]

### Return type

**map**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

