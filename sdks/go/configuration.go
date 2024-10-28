/*
Kandji API

<html><head></head><body><h1 id=\"welcome-to-the-kandji-api-documentation\">Welcome to the Kandji API Documentation</h1>\\n<p>You can find your API URL in Settings &gt; Access. The API URL will follow the below formats.</p>\\n<ul>\\n<li><p>US - <code>https://SubDomain.api.kandji.io</code></p>\\n</li>\\n<li><p>EU - <code>https://SubDomain.api.eu.kandji.io</code></p>\\n</li>\\n</ul>\\n<p>For information on how to obtain an API token, please refer to the following support article.</p>\\n<p><a href=\"https://support.kandji.io/api\">https://support.kandji.io/api</a></p>\\n<h4 id=\"rate-limit\">Rate Limit</h4>\\n<p>The Kandji API currently has an API rate limit of 10,000 requests per hour per customer.</p>\\n<h4 id=\"request-methods\">Request Methods</h4>\\n<p>HTTP request methods supported by the Kandji API.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Method</th>\\n<th>Definition</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>GET</td>\\n<td>The <code>GET</code> method requests a representation of the specified resource.</td>\\n</tr>\\n<tr>\\n<td>POST</td>\\n<td>The <code>POST</code> method submits an entity to the specified resource.</td>\\n</tr>\\n<tr>\\n<td>PATCH</td>\\n<td>The <code>PATCH</code> method applies partial modifications to a resource.</td>\\n</tr>\\n<tr>\\n<td>DELETE</td>\\n<td>The <code>DELETE</code> method deletes the specified resource.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"response-codes\">Response codes</h4>\\n<p>Not all response codes apply to every endpoint.</p>\\n<div class=\"click-to-expand-wrapper is-table-wrapper\"><table>\\n<thead>\\n<tr>\\n<th>Code</th>\\n<th>Response</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>200</td>\\n<td>OK</td>\\n</tr>\\n<tr>\\n<td>201</td>\\n<td>Created</td>\\n</tr>\\n<tr>\\n<td>204</td>\\n<td>No content</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Typical response when sending the DELETE method.</td>\\n</tr>\\n<tr>\\n<td>400</td>\\n<td>Bad Request</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command already running\" - The command may already be running in a <em>Pending</em> state waiting on the device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"Command is not allowed for current device\" - The command may not be compatible with the target device.</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>\"JSON parse error - Expecting ',' delimiter: line 3 column 2 (char 65)\"</td>\\n</tr>\\n<tr>\\n<td>401</td>\\n<td>Unauthorized</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if the token is incorrect, was revoked, or the token has expired.</td>\\n</tr>\\n<tr>\\n<td>403</td>\\n<td>Forbidden</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request was understood but cannot be authorized.</td>\\n</tr>\\n<tr>\\n<td>404</td>\\n<td>Not found</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>Unable to locate the resource in the Kandji tenant.</td>\\n</tr>\\n<tr>\\n<td>415</td>\\n<td>Unsupported Media Type</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>The request contains a media type which the server or resource does not support.</td>\\n</tr>\\n<tr>\\n<td>500</td>\\n<td>Internal server error</td>\\n</tr>\\n<tr>\\n<td>503</td>\\n<td>Service unavailable</td>\\n</tr>\\n<tr>\\n<td></td>\\n<td>This error can occur if a file upload is still being processed via the custom apps API.</td>\\n</tr>\\n</tbody>\\n</table>\\n</div><h4 id=\"data-structure\">Data structure</h4>\\n<p>The API returns all structured responses in JSON schema format.</p>\\n<h4 id=\"examples\">Examples</h4>\\n<p>Code examples using the API can be found in the Kandji support <a href=\"https://github.com/kandji-inc/support/tree/main/api-tools\">GitHub</a>.</p>\\n</body></html>

API version: 1.0.0
*/

// Code generated by OpenAPI Generator (https://openapi-generator.tech); DO NOT EDIT.

package openapi

import (
	"context"
	"fmt"
	"net/http"
	"strings"
)

// contextKeys are used to identify the type of value in the context.
// Since these are string, it is possible to get a short description of the
// context key for logging and debugging using key.String().

type contextKey string

func (c contextKey) String() string {
	return "auth " + string(c)
}

var (
	// ContextServerIndex uses a server configuration from the index.
	ContextServerIndex = contextKey("serverIndex")

	// ContextOperationServerIndices uses a server configuration from the index mapping.
	ContextOperationServerIndices = contextKey("serverOperationIndices")

	// ContextServerVariables overrides a server configuration variables.
	ContextServerVariables = contextKey("serverVariables")

	// ContextOperationServerVariables overrides a server configuration variables using operation specific values.
	ContextOperationServerVariables = contextKey("serverOperationVariables")
)

// BasicAuth provides basic http authentication to a request passed via context using ContextBasicAuth
type BasicAuth struct {
	UserName string `json:"userName,omitempty"`
	Password string `json:"password,omitempty"`
}

// APIKey provides API key based authentication to a request passed via context using ContextAPIKey
type APIKey struct {
	Key    string
	Prefix string
}

// ServerVariable stores the information about a server variable
type ServerVariable struct {
	Description  string
	DefaultValue string
	EnumValues   []string
}

// ServerConfiguration stores the information about a server
type ServerConfiguration struct {
	URL string
	Description string
	Variables map[string]ServerVariable
}

// ServerConfigurations stores multiple ServerConfiguration items
type ServerConfigurations []ServerConfiguration

// Configuration stores the configuration of the API client
type Configuration struct {
	Host             string            `json:"host,omitempty"`
	Scheme           string            `json:"scheme,omitempty"`
	DefaultHeader    map[string]string `json:"defaultHeader,omitempty"`
	UserAgent        string            `json:"userAgent,omitempty"`
	Debug            bool              `json:"debug,omitempty"`
	Servers          ServerConfigurations
	OperationServers map[string]ServerConfigurations
	HTTPClient       *http.Client
}

// NewConfiguration returns a new Configuration object
func NewConfiguration() *Configuration {
	cfg := &Configuration{
		DefaultHeader:    make(map[string]string),
		UserAgent:        "OpenAPI-Generator/1.0.0/go",
		Debug:            false,
		Servers:          ServerConfigurations{
			{
				URL: "",
				Description: "No description provided",
			},
		},
		OperationServers: map[string]ServerConfigurations{
		},
	}
	return cfg
}

// AddDefaultHeader adds a new HTTP header to the default header in the request
func (c *Configuration) AddDefaultHeader(key string, value string) {
	c.DefaultHeader[key] = value
}

// URL formats template on a index using given variables
func (sc ServerConfigurations) URL(index int, variables map[string]string) (string, error) {
	if index < 0 || len(sc) <= index {
		return "", fmt.Errorf("index %v out of range %v", index, len(sc)-1)
	}
	server := sc[index]
	url := server.URL

	// go through variables and replace placeholders
	for name, variable := range server.Variables {
		if value, ok := variables[name]; ok {
			found := bool(len(variable.EnumValues) == 0)
			for _, enumValue := range variable.EnumValues {
				if value == enumValue {
					found = true
				}
			}
			if !found {
				return "", fmt.Errorf("the variable %s in the server URL has invalid value %v. Must be %v", name, value, variable.EnumValues)
			}
			url = strings.Replace(url, "{"+name+"}", value, -1)
		} else {
			url = strings.Replace(url, "{"+name+"}", variable.DefaultValue, -1)
		}
	}
	return url, nil
}

// ServerURL returns URL based on server settings
func (c *Configuration) ServerURL(index int, variables map[string]string) (string, error) {
	return c.Servers.URL(index, variables)
}

func getServerIndex(ctx context.Context) (int, error) {
	si := ctx.Value(ContextServerIndex)
	if si != nil {
		if index, ok := si.(int); ok {
			return index, nil
		}
		return 0, reportError("Invalid type %T should be int", si)
	}
	return 0, nil
}

func getServerOperationIndex(ctx context.Context, endpoint string) (int, error) {
	osi := ctx.Value(ContextOperationServerIndices)
	if osi != nil {
		if operationIndices, ok := osi.(map[string]int); !ok {
			return 0, reportError("Invalid type %T should be map[string]int", osi)
		} else {
			index, ok := operationIndices[endpoint]
			if ok {
				return index, nil
			}
		}
	}
	return getServerIndex(ctx)
}

func getServerVariables(ctx context.Context) (map[string]string, error) {
	sv := ctx.Value(ContextServerVariables)
	if sv != nil {
		if variables, ok := sv.(map[string]string); ok {
			return variables, nil
		}
		return nil, reportError("ctx value of ContextServerVariables has invalid type %T should be map[string]string", sv)
	}
	return nil, nil
}

func getServerOperationVariables(ctx context.Context, endpoint string) (map[string]string, error) {
	osv := ctx.Value(ContextOperationServerVariables)
	if osv != nil {
		if operationVariables, ok := osv.(map[string]map[string]string); !ok {
			return nil, reportError("ctx value of ContextOperationServerVariables has invalid type %T should be map[string]map[string]string", osv)
		} else {
			variables, ok := operationVariables[endpoint]
			if ok {
				return variables, nil
			}
		}
	}
	return getServerVariables(ctx)
}

// ServerURLWithContext returns a new server URL given an endpoint
func (c *Configuration) ServerURLWithContext(ctx context.Context, endpoint string) (string, error) {
	sc, ok := c.OperationServers[endpoint]
	if !ok {
		sc = c.Servers
	}

	if ctx == nil {
		return sc.URL(0, nil)
	}

	index, err := getServerOperationIndex(ctx, endpoint)
	if err != nil {
		return "", err
	}

	variables, err := getServerOperationVariables(ctx, endpoint)
	if err != nil {
		return "", err
	}

	return sc.URL(index, variables)
}
