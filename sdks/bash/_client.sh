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
            "apiV1DevicesDeviceIdActivitylimit300Get[Get Device Activity]" \
            "apiV1DevicesDeviceIdAppsGet[Get Device Apps]" \
            "apiV1DevicesDeviceIdCommandslimit300Get[Get Device Commands]" \
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
            "apiV1Deviceslimit300Get[List Devices]" \
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
            "apiV1PrismCountcategoryappsGet[Count]" \
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
            "apiV1TagsPost[Create Tag]" \
            "apiV1TagsTagIdDelete[Delete Tag]" \
            "apiV1TagsTagIdPatch[Update Tag]" \
            "apiV1TagssearchaccuhiveGet[Get Tags]" \
            "apiV1ThreatDetailsGet[Get Threat Details]" \
            "apiV1UsersGet[List Users]" \
            "apiV1UsersUserIdGet[Get User]" \
            "postUrlPost[Upload to S3]" \

    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      apiV1BlueprintsBlueprintIdAssignLibraryItemPost)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdListLibraryItemsGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdOtaEnrollmentProfileGet)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsBlueprintIdRemoveLibraryItemPost)
        local -a _op_arguments
        _op_arguments=(
          "blueprint_id=:[PATH] Path parameter &#39;blueprint_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1BlueprintsGet)
        local -a _op_arguments
        _op_arguments=(
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
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionBlankpushPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionClearpasscodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionDeleteuserPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionDisablelostmodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionEnablelostmodePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionErasePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionLockPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionPlaylostmodesoundPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionReinstallagentPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRemotedesktopPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRenewmdmprofilePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionRestartPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionSetnamePost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionShutdownPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUnlockaccountPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUpdateinventoryPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActionUpdatelocationPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdActivitylimit300Get)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdAppsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdCommandslimit300Get)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsLostmodeDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdDetailsLostmodeGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdLibraryItemsGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
"note_id=:[PATH] Path parameter &#39;note_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
"note_id=:[PATH] Path parameter &#39;note_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesNoteIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
"note_id=:[PATH] Path parameter &#39;note_id&#39;"
                    "Authorization\::[HEADER] "
"Content-Type\::[HEADER] "
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdNotesPost)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdParametersGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsBypasscodeGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsFilevaultkeyGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsRecoverypasswordGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdSecretsUnlockpinGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1DevicesDeviceIdStatusGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1Deviceslimit300Get)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] Path parameter &#39;ade_token_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdDevicesGet)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] Path parameter &#39;ade_token_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdGet)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] Path parameter &#39;ade_token_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] Path parameter &#39;ade_token_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeAdeTokenIdRenewPost)
        local -a _op_arguments
        _op_arguments=(
          "ade_token_id=:[PATH] Path parameter &#39;ade_token_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesDeviceIdGet)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesDeviceIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "device_id=:[PATH] Path parameter &#39;device_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1IntegrationsAppleAdeDevicesGet)
        local -a _op_arguments
        _op_arguments=(
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
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomAppsLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
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
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomProfilesPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryCustomScriptsLibraryItemIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
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
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1LibraryLibraryItemsLibraryItemIdStatusGet)
        local -a _op_arguments
        _op_arguments=(
          "library_item_id=:[PATH] Path parameter &#39;library_item_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismActivationLockGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismApplicationFirewallGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismAppsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismCertificatesGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismCountcategoryappsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismDesktopAndScreensaverGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismDeviceInformationGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismExportExportIdGet)
        local -a _op_arguments
        _op_arguments=(
          "export_id=:[PATH] Path parameter &#39;export_id&#39;"
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
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismGatekeeperAndXprotectGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismInstalledProfilesGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismKernelExtensionsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismLaunchAgentsAndDaemonsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismLocalUsersGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismStartupSettingsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismSystemExtensionsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1PrismTransparencyDatabaseGet)
        local -a _op_arguments
        _op_arguments=(
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
      apiV1TagsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsTagIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "tag_id=:[PATH] Path parameter &#39;tag_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagsTagIdPatch)
        local -a _op_arguments
        _op_arguments=(
          "tag_id=:[PATH] Path parameter &#39;tag_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1TagssearchaccuhiveGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1ThreatDetailsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1UsersGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      apiV1UsersUserIdGet)
        local -a _op_arguments
        _op_arguments=(
          "user_id=:[PATH] Path parameter &#39;user_id&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postUrlPost)
        local -a _op_arguments
        _op_arguments=(
          "post_url=:[PATH] Path parameter &#39;post_url&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
