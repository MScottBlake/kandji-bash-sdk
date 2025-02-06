# DeviceSecretsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deviceSecretsGetActivationLockBypassCode**](DeviceSecretsApi.md#deviceSecretsGetActivationLockBypassCode) | **GET** /api/v1/devices/{device_id}/secrets/bypasscode | Get Activation Lock Bypass Code
[**deviceSecretsGetFilevaultRecoveryKey**](DeviceSecretsApi.md#deviceSecretsGetFilevaultRecoveryKey) | **GET** /api/v1/devices/{device_id}/secrets/filevaultkey | Get FileVault Recovery Key
[**deviceSecretsGetRecoveryLockPassword**](DeviceSecretsApi.md#deviceSecretsGetRecoveryLockPassword) | **GET** /api/v1/devices/{device_id}/secrets/recoverypassword | Get Recovery Lock Password
[**deviceSecretsGetUnlockPin**](DeviceSecretsApi.md#deviceSecretsGetUnlockPin) | **GET** /api/v1/devices/{device_id}/secrets/unlockpin | Get Unlock Pin



## deviceSecretsGetActivationLockBypassCode

Get Activation Lock Bypass Code

<p>This request allows you to retrieve the Activation Lock Bypass code.</p>
<p>user_based_albc is the user-based Activation Lock bypass code for when Activation Lock is enabled using an personal Apple ID and Find My.</p>
<p>device_based_albc is the device-based Activation Lock bypass code for when Activation Lock is enabled by the MDM server.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>

### Example

```bash
kandji_sdk deviceSecretsGetActivationLockBypassCode device_id=value
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


## deviceSecretsGetFilevaultRecoveryKey

Get FileVault Recovery Key

<p>This request allows you to retrieve the FileVault Recovery key for a macOS device.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>

### Example

```bash
kandji_sdk deviceSecretsGetFilevaultRecoveryKey device_id=value
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


## deviceSecretsGetRecoveryLockPassword

Get Recovery Lock Password

<p>This request returns the Recovery Lock password for a Mac with an Apple Silicon processor and the legacy EFI firmware password for a Mac with an Intel processor.</p>
<p>For more details on setting and managing Recovery passwords, see this <a href=&quot;https://support.kandji.io/support/solutions/articles/72000560472-configure-the-recovery-password-library-item&quot;>Kandji support article</a>.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>

### Example

```bash
kandji_sdk deviceSecretsGetRecoveryLockPassword device_id=value
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


## deviceSecretsGetUnlockPin

Get Unlock Pin

<p>This request allows you to retrieve the device unlock pin for a macOS device.</p>
<h3 id=&quot;request-parameters&quot;>Request Parameters</h3>
<p><code>device_id</code> (path parameter): The unique identifier of the device.</p>

### Example

```bash
kandji_sdk deviceSecretsGetUnlockPin device_id=value
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

