#compdef 

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# ! Generator version: 7.10.0-SNAPSHOT
# !
# !
# ! Installation:
# !
# ! Copy the _ file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "apiV1BlueprintsBlueprintIdAssignLibraryItemPost[Assign Library Item]" \
            "apiV1BlueprintsBlueprintIdDelete[Delete Blueprint]" \
            "apiV1BlueprintsBlueprintIdGet[Get Blueprint]" \
            "apiV1BlueprintsBlueprintIdListLibraryItemsGet[List Library Items]" \
            "apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet[Get Manual Enrollment Profile]" \
            "apiV1BlueprintsBlueprintIdPatch[Update Blueprint]" \
            "apiV1BlueprintsBlueprintIdRemoveLibraryItemPost[Remove Library Item]" \
            "apiV1BlueprintsGet[List Blueprints]" \
            "apiV1BlueprintsPost[Create Blueprint]" \
            "apiV1BlueprintsTemplatesGet[Get Blueprint Templates]" \
            "apiV1DevicesDeviceIdActionBlankpushPost[Send Blankpush]" \
            "apiV1DevicesDeviceIdActionClearpasscodePost[Clear Passcode]" \
            "apiV1DevicesDeviceIdActionDeleteuserPost[Delete User]" \
            "apiV1DevicesDeviceIdActionDisablelostmodePost[Disable Lost Mode]" \
            "apiV1DevicesDeviceIdActionEnablelostmodePost[Enable Lost Mode]" \
            "apiV1DevicesDeviceIdActionErasePost[Erase Device]" \
            "apiV1DevicesDeviceIdActionLockPost[Lock Device]" \
            "apiV1DevicesDeviceIdActionPlaylostmodesoundPost[Play Lost Mode Sound]" \
            "apiV1DevicesDeviceIdActionReinstallagentPost[Reinstall Agent]" \
            "apiV1DevicesDeviceIdActionRemotedesktopPost[Remote Desktop]" \
            "apiV1DevicesDeviceIdActionRenewmdmprofilePost[Renew MDM Profile]" \
            "apiV1DevicesDeviceIdActionRestartPost[Restart Device]" \
            "apiV1DevicesDeviceIdActionSetnamePost[Set Name]" \
            "apiV1DevicesDeviceIdActionShutdownPost[Shutdown]" \
            "apiV1DevicesDeviceIdActionUnlockaccountPost[Unlock Account]" \
            "apiV1DevicesDeviceIdActionUpdateinventoryPost[Update Inventory]" \
            "apiV1DevicesDeviceIdActionUpdatelocationPost[Update Location]" \
            "apiV1DevicesDeviceIdActivityGet[Get Device Activity]" \
            "apiV1DevicesDeviceIdAppsGet[Get Device Apps]" \
            "apiV1DevicesDeviceIdCommandsGet[Get Device Commands]" \
            "apiV1DevicesDeviceIdDelete[Delete Device]" \
            "apiV1DevicesDeviceIdDetailsGet[Get Device Details]" \
            "apiV1DevicesDeviceIdDetailsLostmodeDelete[Cancel Lost Mode]" \
            "apiV1DevicesDeviceIdDetailsLostmodeGet[Get Device Lost Mode details]" \
            "apiV1DevicesDeviceIdGet[Get Device]" \
            "apiV1DevicesDeviceIdLibraryItemsGet[Get Device Library Items]" \
            "apiV1DevicesDeviceIdNotesGet[Get Device Notes]" \
            "apiV1DevicesDeviceIdNotesNoteIdDelete[Delete Device Note]" \
            "apiV1DevicesDeviceIdNotesNoteIdGet[Retrieve Device Note]" \
            "apiV1DevicesDeviceIdNotesNoteIdPatch[Update Device Note]" \
            "apiV1DevicesDeviceIdNotesPost[Create Device Note]" \
            "apiV1DevicesDeviceIdParametersGet[Get Device Parameters]" \
            "apiV1DevicesDeviceIdPatch[Update Device]" \
            "apiV1DevicesDeviceIdSecretsBypasscodeGet[Get Activation Lock Bypass Code]" \
            "apiV1DevicesDeviceIdSecretsFilevaultkeyGet[Get FileVault Recovery Key]" \
            "apiV1DevicesDeviceIdSecretsRecoverypasswordGet[Get Recovery Lock Password]" \
            "apiV1DevicesDeviceIdSecretsUnlockpinGet[Get Unlock Pin]" \
            "apiV1DevicesDeviceIdStatusGet[Get Device Status]" \
            "apiV1DevicesGet[List Devices]" \
            "apiV1IntegrationsAppleAdeAdeTokenIdDelete[Delete ADE integration]" \
            "apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet[List devices associated to ADE token]" \
            "apiV1IntegrationsAppleAdeAdeTokenIdGet[Get ADE integration]" \
            "apiV1IntegrationsAppleAdeAdeTokenIdPatch[Update ADE integration]" \
            "apiV1IntegrationsAppleAdeAdeTokenIdRenewPost[Renew ADE integration]" \
            "apiV1IntegrationsAppleAdeDevicesDeviceIdGet[Get ADE device]" \
            "apiV1IntegrationsAppleAdeDevicesDeviceIdPatch[Update ADE device]" \
            "apiV1IntegrationsAppleAdeDevicesGet[List ADE devices]" \
            "apiV1IntegrationsAppleAdeGet[List ADE integrations]" \
            "apiV1IntegrationsAppleAdePost[Create ADE integration]" \
            "apiV1IntegrationsAppleAdePublicKeyGet[Download ADE public key]" \
            "apiV1LibraryCustomAppsGet[List Custom Apps]" \
            "apiV1LibraryCustomAppsLibraryItemIdDelete[Delete Custom App]" \
            "apiV1LibraryCustomAppsLibraryItemIdGet[Get Custom App]" \
            "apiV1LibraryCustomAppsLibraryItemIdPatch[Update Custom App]" \
            "apiV1LibraryCustomAppsPost[Create Custom App]" \
            "apiV1LibraryCustomAppsUploadPost[Upload Custom App]" \
            "apiV1LibraryCustomProfilesGet[List Custom Profiles]" \
            "apiV1LibraryCustomProfilesLibraryItemIdDelete[Delete Custom Profile]" \
            "apiV1LibraryCustomProfilesLibraryItemIdGet[Get Custom Profile]" \
            "apiV1LibraryCustomProfilesLibraryItemIdPatch[Update Custom Profile]" \
            "apiV1LibraryCustomProfilesPost[Create Custom Profile]" \
            "apiV1LibraryCustomScriptsGet[List Custom Scripts]" \
            "apiV1LibraryCustomScriptsLibraryItemIdDelete[Delete Custom Script]" \
            "apiV1LibraryCustomScriptsLibraryItemIdGet[Get Custom Script]" \
            "apiV1LibraryCustomScriptsLibraryItemIdPatch[Update Custom Script]" \
            "apiV1LibraryCustomScriptsPost[Create Custom Script]" \
            "apiV1LibraryLibraryItemsLibraryItemIdActivityGet[Get Library Item Activity]" \
            "apiV1LibraryLibraryItemsLibraryItemIdStatusGet[Get Library Item Statuses]" \
            "apiV1PrismActivationLockGet[Activation lock]" \
            "apiV1PrismApplicationFirewallGet[Application firewall]" \
            "apiV1PrismAppsGet[Applications]" \
            "apiV1PrismCertificatesGet[Certificates]" \
            "apiV1PrismCountGet[Count]" \
            "apiV1PrismDesktopAndScreensaverGet[Desktop and Screensaver]" \
            "apiV1PrismDeviceInformationGet[Device information]" \
            "apiV1PrismExportExportIdGet[Get category export]" \
            "apiV1PrismExportPost[Request category export]" \
            "apiV1PrismFilevaultGet[FileVault]" \
            "apiV1PrismGatekeeperAndXprotectGet[Gatekeeper and XProtect]" \
            "apiV1PrismInstalledProfilesGet[Installed profiles]" \
            "apiV1PrismKernelExtensionsGet[Kernel Extensions]" \
            "apiV1PrismLaunchAgentsAndDaemonsGet[Launch Agents and Daemons]" \
            "apiV1PrismLocalUsersGet[Local users]" \
            "apiV1PrismStartupSettingsGet[Startup settings]" \
            "apiV1PrismSystemExtensionsGet[System Extensions]" \
            "apiV1PrismTransparencyDatabaseGet[Transparency database]" \
            "apiV1SelfServiceCategoriesGet[List Self Service Categories]" \
            "apiV1SettingsLicensingGet[Licensing]" \
            "apiV1TagsGet[Get Tags]" \
            "apiV1TagsPost[Create Tag]" \
            "apiV1TagsTagIdDelete[Delete Tag]" \
            "apiV1TagsTagIdPatch[Update Tag]" \
            "apiV1ThreatDetailsGet[Get Threat Details]" \
            "apiV1UsersGet[List Users]" \
            "apiV1UsersUserIdGet[Get User]" \
            "rootPost[Upload to S3]" \

    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      apiV1BlueprintsBlueprintIdAssignLibraryItemPost)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdListLibraryItemsGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
          "sso=:[QUERY] &lt;p&gt;Use the &lt;code&gt;sso&lt;/code&gt; query parameter, set to &lt;code&gt;true&lt;/code&gt;, to return a URL instead of the manual enrollment profile. This parameter should only be used for blueprints in which \&quot;Require Authentication\&quot; is configured for Manual Enrollment. The returned URL must be used to authenticate via SSO to receive an enrollment profile. &lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdRemoveLibraryItemPost)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsGet)
        local -a _op_arguments
        _op_arguments=(
                    "id=:[QUERY] &lt;p&gt;Look up a specific Blueprint by its ID&lt;/p&gt;"
"id__in=:[QUERY] &lt;p&gt;Specify a list of Blueprint IDs to limit the results to.  Multiple values may be separated by commas. There is a double underscore (&lt;code&gt;__&lt;/code&gt;) between id and in&lt;/p&gt;"
"name=:[QUERY] &lt;p&gt;Return Blueprint names \&quot;containing\&quot; the specified search string.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;Number of results to return per page.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;The initial index from which to return the results.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsTemplatesGet)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] &lt;p&gt;Number of results to return per page.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;The initial index from which to return the results.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionBlankpushPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionClearpasscodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionDeleteuserPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionDisablelostmodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionEnablelostmodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionErasePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionLockPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionPlaylostmodesoundPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionReinstallagentPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRemotedesktopPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRenewmdmprofilePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRestartPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionSetnamePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionShutdownPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUnlockaccountPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUpdateinventoryPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUpdatelocationPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActivityGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
          "limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdAppsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdCommandsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
          "limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsLostmodeDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsLostmodeGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdLibraryItemsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
"note_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
"note_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
"note_id=:[PATH] "
                    "Authorization\::[HEADER] "
"Content-Type\::[HEADER] "
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdParametersGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsBypasscodeGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsFilevaultkeyGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsRecoverypasswordGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsUnlockpinGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdStatusGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesGet)
        local -a _op_arguments
        _op_arguments=(
                    "asset_tag=:[QUERY] "
"blueprint_id=:[QUERY] &lt;p&gt;Return results \&quot;containing\&quot; the specified blueprint id&lt;/p&gt;"
"device_id=:[QUERY] "
"device_name=:[QUERY] "
"filevault_enabled=:[QUERY] &lt;p&gt;Query for devices that either have FileVault on (true) or off (false). This parameter only applies to macOS. &lt;/p&gt;
&lt;p&gt;An empty list &lt;code&gt;[]&lt;/code&gt; will be returned if no devices are found with the given parameter value.&lt;/p&gt;"
"mac_address=:[QUERY] &lt;p&gt;Search for a specific device by MAC address &lt;/p&gt;"
"model=:[QUERY] &lt;p&gt;Return model results \&quot;containing\&quot; the specified model string.&lt;/p&gt;"
"ordering=:[QUERY] &lt;p&gt;The &lt;code&gt;ordering&lt;/code&gt; parameter can be used to define how the device records are ordered in the response. Prepending a dash (-) to the parameter value will reverse the order of the returned results.&lt;/p&gt;
&lt;p&gt;&lt;code&gt;?ordering&#x3D;-serial_number&lt;/code&gt; will order the response by serial_number in descending order.&lt;/p&gt;
&lt;p&gt;&lt;strong&gt;Possible values&lt;/strong&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;code&gt;asset_tag&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;blueprint_id&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;device_id&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;device_name&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;last_check_in&lt;/code&gt; - agent checkin&lt;/li&gt;
&lt;li&gt;&lt;code&gt;model&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;platform&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;os_version&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;serial_number&lt;/code&gt;&lt;/li&gt;
&lt;li&gt;&lt;code&gt;user&lt;/code&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Additionally, multiple values can be combined in a comma separated list to further customize the ordering of the response.&lt;/p&gt;
&lt;p&gt;&lt;code&gt;?ordering&#x3D;serial_number,platform&lt;/code&gt;&lt;/p&gt;"
"os_version=:[QUERY] &lt;p&gt;Return all device records with the specified OS version&lt;/p&gt;"
"platform=:[QUERY] &lt;p&gt;Return all records matching a specific platform. Possible values:&lt;code&gt;Mac&lt;/code&gt;, &lt;code&gt;iPad&lt;/code&gt;, &lt;code&gt;iPhone&lt;/code&gt;, &lt;code&gt;AppleTV&lt;/code&gt;&lt;/p&gt;"
"serial_number=:[QUERY] &lt;p&gt;Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.&lt;/p&gt;"
"tag_name=:[QUERY] &lt;p&gt;Return results for given tag name. Case sensitive.&lt;/p&gt;"
"tag_name_in=:[QUERY] &lt;p&gt;Return results for given tag names separate by commas. Case sensitive.&lt;/p&gt;"
"tag_id=:[QUERY] &lt;p&gt;Search for a tag by its ID. Case sensitive.&lt;/p&gt;"
"tag_id_in=:[QUERY] &lt;p&gt;Return results for given tag IDs separated by commas. Case sensitive.&lt;/p&gt;"
"user=:[QUERY] &lt;p&gt;Return results \&quot;containing\&quot; the user name&lt;/p&gt;"
"user_email=:[QUERY] &lt;p&gt;Return results \&quot;containing\&quot; search on email address&lt;/p&gt;"
"user_id=:[QUERY] &lt;p&gt;\&quot;exact\&quot; match on kandji user ID number&lt;/p&gt;"
"user_name=:[QUERY] &lt;p&gt;Return results \&quot;containing\&quot; the assigned user Display Name&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] "
          "page=:[QUERY] &lt;p&gt;Use the &lt;code&gt;page&lt;/code&gt; parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the &lt;code&gt;next&lt;/code&gt; and &lt;code&gt;previous&lt;/code&gt; key attributes in the response can be used to request the next page of results or return to the previous page.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdGet)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdRenewPost)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesDeviceIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesDeviceIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_id=:[QUERY] &lt;p&gt;Return results \&quot;containing\&quot; the specified blueprint id&lt;/p&gt;"
"user_id=:[QUERY] &lt;p&gt;\&quot;exact\&quot; match on kandji user ID number&lt;/p&gt;"
"dep_account=:[QUERY] &lt;p&gt;The ADE token UUID&lt;/p&gt;"
"device_family=:[QUERY] &lt;p&gt;Mac, iPhone, iPad, AppleTV, iPod&lt;/p&gt;"
"model=:[QUERY] &lt;p&gt;Return model results \&quot;containing\&quot; the specified model string. - \&quot;iPad (8th Generation)\&quot;, \&quot;MacBook Air\&quot;&lt;/p&gt;"
"os=:[QUERY] &lt;p&gt;OSX, iOS, tvOS&lt;/p&gt;"
"profile_status=:[QUERY] &lt;p&gt;The automated device enrollment profile assignment status - assigned, empty, pushed, removed&lt;/p&gt;"
"serial_number=:[QUERY] &lt;p&gt;Search for a specific device by Serial Number. If partial serial number is provided in the query, all device containing the partial string will be returned.&lt;/p&gt;"
"page=:[QUERY] &lt;p&gt;Use the &lt;code&gt;page&lt;/code&gt; parameter to page through results or to request a specific page. By default, if a page is not specified, page 1 is returned. Note: 300 device records are returned per page of results. Alternatively, the &lt;code&gt;next&lt;/code&gt; and &lt;code&gt;previous&lt;/code&gt; key attributes in the response can be used to request the next page of results or return to the previous page.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdePost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdePublicKeyGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsGet)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] &lt;p&gt;Optional page number. Used when results exceed pagination threshold. A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsUploadPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesGet)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] &lt;p&gt;Optional page number (when results exceed pagination threshold)&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
          "runs_on_mac=:[QUERY] "
"runs_on_iphone=:[QUERY] "
"runs_on_ipad=:[QUERY] "
"runs_on_tv=:[QUERY] "
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesPost)
        local -a _op_arguments
        _op_arguments=(
                    "runs_on_mac=:[QUERY] "
"runs_on_iphone=:[QUERY] "
"runs_on_ipad=:[QUERY] "
"runs_on_tv=:[QUERY] "
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsGet)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] &lt;p&gt;Optional page number (when results exceed pagination threshold)&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryLibraryItemsLibraryItemIdActivityGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
          "activity_type=:[QUERY] &lt;p&gt;Filter actions by this activity type. Choices are: library_item_created, library_item_edited, library_item_deleted, library_item_duplicated, library_item_assignment_changed&lt;/p&gt;"
"user_id=:[QUERY] &lt;p&gt;Filter actions by this user (id)&lt;/p&gt;"
"user_email=:[QUERY] &lt;p&gt;Filter actions by this user (email)&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryLibraryItemsLibraryItemIdStatusGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] "
          "computer_id=:[QUERY] &lt;p&gt;Query for the status of one device.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismActivationLockGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] "
"device_families=:[QUERY] "
"filter=:[QUERY] "
"sort_by=:[QUERY] "
"limit=:[QUERY] "
"offset=:[QUERY] "
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismApplicationFirewallGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismAppsGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismCertificatesGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismCountGet)
        local -a _op_arguments
        _op_arguments=(
                    "category=:[QUERY] &lt;p&gt;Return the count of records for the specified category. 
If a category contains spaces substitute the spaces for underscores (\&quot;_\&quot;) when using the API query.&lt;/p&gt;
&lt;p&gt;Examples:
apps
device_information
kernel_extensions
system_extensions&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismDesktopAndScreensaverGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismDeviceInformationGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.&lt;/p&gt;
&lt;p&gt;Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismExportExportIdGet)
        local -a _op_arguments
        _op_arguments=(
          "export_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismExportPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismFilevaultGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismGatekeeperAndXprotectGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Results are limited to Mac only as Gatekeeper and XProtect are not applicable for other platfroms.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismInstalledProfilesGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismKernelExtensionsGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;SON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismLaunchAgentsAndDaemonsGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismLocalUsersGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismStartupSettingsGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismSystemExtensionsGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismTransparencyDatabaseGet)
        local -a _op_arguments
        _op_arguments=(
                    "blueprint_ids=:[QUERY] &lt;p&gt;Filter results by one or more blueprint IDs separated by commas.&lt;/p&gt;"
"device_families=:[QUERY] &lt;p&gt;Filter results by one or more device families separate by commas.&lt;/p&gt;"
"filter=:[QUERY] &lt;p&gt;JSON schema object containing one or more key value pairs.
Note: For detailed information on fiters, see the Filters section at the begining of the Visibility API endpoints in this doc.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Sort results by the name of a given response body key in either ascending (default behavior) or descending(&lt;code&gt;-&lt;/code&gt;) order.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 300 device records returned per request. If more device records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1SelfServiceCategoriesGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1SettingsLicensingGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsGet)
        local -a _op_arguments
        _op_arguments=(
                    "search=:[QUERY] &lt;p&gt;Return resultes containing a given tag search string.&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsTagIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "tag_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsTagIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "tag_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1ThreatDetailsGet)
        local -a _op_arguments
        _op_arguments=(
                    "classification=:[QUERY] &lt;p&gt;Return all records matching a specified classification. The following classification options are available: &lt;code&gt;malware&lt;/code&gt; and &lt;code&gt;pup&lt;/code&gt;. Leave this parameter empty to return all classification types.&lt;/p&gt;"
"date_range=:[QUERY] &lt;p&gt;Return all records within a specified number of days. Any positive number of days may be specified. Examples: &lt;code&gt;7&lt;/code&gt;, &lt;code&gt;30&lt;/code&gt;, &lt;code&gt;60&lt;/code&gt;, &lt;code&gt;90&lt;/code&gt;, &lt;code&gt;180&lt;/code&gt;, or &lt;code&gt;365&lt;/code&gt;.&lt;/p&gt;"
"device_id=:[QUERY] "
"status=:[QUERY] &lt;p&gt;Return all records matching a specified status. The following status options are available: &lt;code&gt;quarantined&lt;/code&gt;, &lt;code&gt;not_quarantined&lt;/code&gt;, or &lt;code&gt;released&lt;/code&gt;. Leave this parameter empty to return all status types.&lt;/p&gt;"
"sort_by=:[QUERY] &lt;p&gt;Results can be sorted with the following options: &lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;threat_name&lt;/li&gt;
&lt;li&gt;classification&lt;/li&gt;
&lt;li&gt;device_name&lt;/li&gt;
&lt;li&gt;process_name&lt;/li&gt;
&lt;li&gt;process_owner&lt;/li&gt;
&lt;li&gt;detection_date&lt;/li&gt;
&lt;li&gt;status&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Prepending a dash (-) to the parameter value will reverse the order of the returned results.&lt;/p&gt;
&lt;p&gt;&lt;code&gt;?sort_by&#x3D;-device_name&lt;/code&gt; will order the response by device_name in descending order.&lt;/p&gt;"
"term=:[QUERY] &lt;p&gt;Search term to filter threat results.&lt;/p&gt;
&lt;p&gt;The response will include anything matching the following fields: &lt;code&gt;device_name&lt;/code&gt;, &lt;code&gt;file_hash&lt;/code&gt;, and &lt;code&gt;file_path&lt;/code&gt;.&lt;/p&gt;
&lt;p&gt;So if you search for &lt;code&gt;bad file&lt;/code&gt;, the results will include anywhere &lt;code&gt;bad file&lt;/code&gt; exists in the three fields above.&lt;/p&gt;"
"limit=:[QUERY] &lt;p&gt;A hard upper &lt;code&gt;limit&lt;/code&gt; is set at 1000 records returned per request. If more records are expected, pagination should be used using the &lt;code&gt;limit&lt;/code&gt; and &lt;code&gt;offset&lt;/code&gt; parameters. &lt;/p&gt;
&lt;p&gt;Additionally, parameter queries can be added to a request to limit the results.&lt;/p&gt;"
"offset=:[QUERY] &lt;p&gt;Specify the starting record to return&lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1UsersGet)
        local -a _op_arguments
        _op_arguments=(
                    "email=:[QUERY] &lt;p&gt;Returns users with email addresses containing the provided string.&lt;/p&gt;"
"id=:[QUERY] &lt;p&gt;Search for a user matching the provided UUID value.&lt;/p&gt;"
"integration_id=:[QUERY] &lt;p&gt;Search for a integration matching the provided UUID value.&lt;/p&gt;"
"archived=:[QUERY] &lt;p&gt;Return only users that are either archived (true) or not archived (false). Archived users are users that appear in the Kandji Users module under the Archived tab. &lt;/p&gt;"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1UsersUserIdGet)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      rootPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
