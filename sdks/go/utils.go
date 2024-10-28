/*
Kandji API

<html><head></head><body><h1 id=\"welcome-to-the-kandji-api-documentation\">Welcome to the Kandji API Documentation</h1>\\n<p>You can find your API URL in Settings &gt; Access. The API URL will follow the below formats.</p>\\n<ul>\\n<li><p>US - <code>https://SubDomain.api.kandji.io</code></p>\\n</li>\\n<li><p>EU - <code>https://SubDomain.api.eu.kandji.io</code></p>\\n</li>\\n</ul>\\n<p>For information on how to obtain an API token, please refer to the following support article.</p>\\n<p><a href=\"https://support.kandji.io/api\">https://support.kandji.io/api</a></p>\\n<h4 id=\"rate-limit\">Rate Limit</h4>\\n<p>The Kandji API currently has an API rate limit of 10,000 requests per hour per customer.</p>\\n<h4 id=\"request-methods\">Request Methods</h4>\\n<p>HTTP request methods supported by the Kandji API.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Method</th>\\n<th>Definition</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>GET</td>\\n<td>The <code>GET</code> method requests a representation of the specified resource.</td>\\n</tr>\\n<tr>\\n<td>POST</td>\\n<td>The <code>POST</code> method submits an entity to the specified resource.</td>\\n</tr>\\n<tr>\\n<td>PATCH</td>\\n<td>The <code>PATCH</code> method applies partial modifications to a resource.</td>\\n</tr>\\n<tr>\\n<td>DELETE</td>\\n<td>The <code>DELETE</code> method deletes the specified resource.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"response-codes\">Response codes</h4>\\n<p>Not all response codes apply to every endpoint.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Code</th>\\n<th>Response</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>200</td>\\n<td>OK</td>\\n</tr>\\n<tr>\\n<td>201</td>\\n<td>Created</td>\\n</tr>\\n<tr>\\n<td>204</td>\\n<td>No content</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Typical response when sending the DELETE method.</td>\\n</tr>\\n<tr>\\n<td>400</td>\\n<td>Bad Request</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command already running\" - The command may already be running in a <em>Pending</em> state waiting on the device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command is not allowed for current device\" - The command may not be compatible with the target device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"JSON parse error - Expecting ',' delimiter: line 3 column 2 (char 65)\"</td>\\n</tr>\\n<tr>\\n<td>401</td>\\n<td>Unauthorized</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if the token is incorrect, was revoked, or the token has expired.</td>\\n</tr>\\n<tr>\\n<td>403</td>\\n<td>Forbidden</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request was understood but cannot be authorized.</td>\\n</tr>\\n<tr>\\n<td>404</td>\\n<td>Not found</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Unable to locate the resource in the Kandji tenant.</td>\\n</tr>\\n<tr>\\n<td>415</td>\\n<td>Unsupported Media Type</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request contains a media type which the server or resource does not support.</td>\\n</tr>\\n<tr>\\n<td>500</td>\\n<td>Internal server error</td>\\n</tr>\\n<tr>\\n<td>503</td>\\n<td>Service unavailable</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if a file upload is still being processed via the custom apps API.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"data-structure\">Data structure</h4>\\n<p>The API returns all structured responses in JSON schema format.</p>\\n<h4 id=\"examples\">Examples</h4>\\n<p>Code examples using the API can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools\">GitHub</a>.</p>\\n</body></html>

API version: 1.0.0
*/

// Code generated by OpenAPI Generator (https://openapi-generator.tech); DO NOT EDIT.

package openapi

import (
	"bytes"
	"encoding/json"
	"fmt"
	"reflect"
	"time"
)

// PtrBool is a helper routine that returns a pointer to given boolean value.
func PtrBool(v bool) *bool { return &v }

// PtrInt is a helper routine that returns a pointer to given integer value.
func PtrInt(v int) *int { return &v }

// PtrInt32 is a helper routine that returns a pointer to given integer value.
func PtrInt32(v int32) *int32 { return &v }

// PtrInt64 is a helper routine that returns a pointer to given integer value.
func PtrInt64(v int64) *int64 { return &v }

// PtrFloat32 is a helper routine that returns a pointer to given float value.
func PtrFloat32(v float32) *float32 { return &v }

// PtrFloat64 is a helper routine that returns a pointer to given float value.
func PtrFloat64(v float64) *float64 { return &v }

// PtrString is a helper routine that returns a pointer to given string value.
func PtrString(v string) *string { return &v }

// PtrTime is helper routine that returns a pointer to given Time value.
func PtrTime(v time.Time) *time.Time { return &v }

type NullableBool struct {
	value *bool
	isSet bool
}

func (v NullableBool) Get() *bool {
	return v.value
}

func (v *NullableBool) Set(val *bool) {
	v.value = val
	v.isSet = true
}

func (v NullableBool) IsSet() bool {
	return v.isSet
}

func (v *NullableBool) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableBool(val *bool) *NullableBool {
	return &NullableBool{value: val, isSet: true}
}

func (v NullableBool) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableBool) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableInt struct {
	value *int
	isSet bool
}

func (v NullableInt) Get() *int {
	return v.value
}

func (v *NullableInt) Set(val *int) {
	v.value = val
	v.isSet = true
}

func (v NullableInt) IsSet() bool {
	return v.isSet
}

func (v *NullableInt) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableInt(val *int) *NullableInt {
	return &NullableInt{value: val, isSet: true}
}

func (v NullableInt) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableInt) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableInt32 struct {
	value *int32
	isSet bool
}

func (v NullableInt32) Get() *int32 {
	return v.value
}

func (v *NullableInt32) Set(val *int32) {
	v.value = val
	v.isSet = true
}

func (v NullableInt32) IsSet() bool {
	return v.isSet
}

func (v *NullableInt32) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableInt32(val *int32) *NullableInt32 {
	return &NullableInt32{value: val, isSet: true}
}

func (v NullableInt32) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableInt32) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableInt64 struct {
	value *int64
	isSet bool
}

func (v NullableInt64) Get() *int64 {
	return v.value
}

func (v *NullableInt64) Set(val *int64) {
	v.value = val
	v.isSet = true
}

func (v NullableInt64) IsSet() bool {
	return v.isSet
}

func (v *NullableInt64) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableInt64(val *int64) *NullableInt64 {
	return &NullableInt64{value: val, isSet: true}
}

func (v NullableInt64) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableInt64) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableFloat32 struct {
	value *float32
	isSet bool
}

func (v NullableFloat32) Get() *float32 {
	return v.value
}

func (v *NullableFloat32) Set(val *float32) {
	v.value = val
	v.isSet = true
}

func (v NullableFloat32) IsSet() bool {
	return v.isSet
}

func (v *NullableFloat32) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableFloat32(val *float32) *NullableFloat32 {
	return &NullableFloat32{value: val, isSet: true}
}

func (v NullableFloat32) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableFloat32) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableFloat64 struct {
	value *float64
	isSet bool
}

func (v NullableFloat64) Get() *float64 {
	return v.value
}

func (v *NullableFloat64) Set(val *float64) {
	v.value = val
	v.isSet = true
}

func (v NullableFloat64) IsSet() bool {
	return v.isSet
}

func (v *NullableFloat64) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableFloat64(val *float64) *NullableFloat64 {
	return &NullableFloat64{value: val, isSet: true}
}

func (v NullableFloat64) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableFloat64) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableString struct {
	value *string
	isSet bool
}

func (v NullableString) Get() *string {
	return v.value
}

func (v *NullableString) Set(val *string) {
	v.value = val
	v.isSet = true
}

func (v NullableString) IsSet() bool {
	return v.isSet
}

func (v *NullableString) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableString(val *string) *NullableString {
	return &NullableString{value: val, isSet: true}
}

func (v NullableString) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableString) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

type NullableTime struct {
	value *time.Time
	isSet bool
}

func (v NullableTime) Get() *time.Time {
	return v.value
}

func (v *NullableTime) Set(val *time.Time) {
	v.value = val
	v.isSet = true
}

func (v NullableTime) IsSet() bool {
	return v.isSet
}

func (v *NullableTime) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableTime(val *time.Time) *NullableTime {
	return &NullableTime{value: val, isSet: true}
}

func (v NullableTime) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableTime) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}

// IsNil checks if an input is nil
func IsNil(i interface{}) bool {
	if i == nil {
		return true
	}
	switch reflect.TypeOf(i).Kind() {
	case reflect.Chan, reflect.Func, reflect.Map, reflect.Ptr, reflect.UnsafePointer, reflect.Interface, reflect.Slice:
		return reflect.ValueOf(i).IsNil()
	case reflect.Array:
		return reflect.ValueOf(i).IsZero()
	}
	return false
}

type MappedNullable interface {
	ToMap() (map[string]interface{}, error)
}

// A wrapper for strict JSON decoding
func newStrictDecoder(data []byte) *json.Decoder {
	dec := json.NewDecoder(bytes.NewBuffer(data))
	dec.DisallowUnknownFields()
	return dec
}

// Prevent trying to import "fmt"
func reportError(format string, a ...interface{}) error {
	return fmt.Errorf(format, a...)
}