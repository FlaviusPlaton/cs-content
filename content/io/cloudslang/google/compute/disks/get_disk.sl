#   (c) Copyright 2017 Hewlett-Packard Enterprise Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
########################################################################################################################
#!!
#! @description: This operation can be used to retrieve a Disk resource, as JSON object.
#!
#! @input project_id: Google Cloud project name.
#!                    Example: 'example-project-a'
#! @input zone: The name of the zone in which the instance lives.
#!              Examples: 'us-central1-a', 'us-central1-b', 'us-central1-c'
#! @input disk_name: Name of the Disk resource to get.
#!                   Example: 'disk-1'
#! @input access_token: The access token from get_access_token.
#! @input proxy_host: Optional - Proxy server used to access the provider services.
#! @input proxy_port: Optional - Proxy server port used to access the provider services.
#!                    Default: '8080'
#! @input proxy_username: Optional - Proxy server user name.
#! @input proxy_password: Optional - Proxy server password associated with the <proxy_username> input value.
#! @input pretty_print: Optional - Whether to format the resulting JSON.
#!                      Valid values: 'true', 'false'
#!                      Default: 'true'
#!
#! @output return_result: A JSON containing the Disk resource information.
#! @output return_code: '0' if operation was successfully executed, '-1' otherwise.
#! @output exception: Exception if there was an error when executing, empty otherwise.
#!
#! @result SUCCESS: The Disk was found and successfully retrieved.
#! @result FAILURE: The Disk was not found or some inputs were given incorrectly
#!
#!!#
########################################################################################################################

namespace: io.cloudslang.google.compute.disks
operation:
  name: get_disk
  inputs:
    - project_id
    - projectId:
        default: ${get('project_id', '')}
        required: false
        private: true
    - zone
    - disk_name
    - diskName:
        default: ${get('disk_name', '')}
        private: true
        required: false
    - access_token:
        sensitive: true
    - accessToken:
        default: ${get('access_token', '')}
        required: false
        private: true
        sensitive: true
    - proxy_host:
        default: ''
        required: false
    - proxyHost:
        default: ${get('proxy_host', '')}
        required: false
        private: true
    - proxy_port:
        default: '8080'
        required: false
    - proxyPort:
        default: ${get('proxy_port', '')}
        required: false
        private: true
    - proxy_username:
        default: ''
        required: false
    - proxyUsername:
        default: ${get('proxy_username', '')}
        required: false
        private: true
    - proxy_password:
        default: ''
        required: false
        sensitive: true
    - proxyPassword:
        default: ${get('proxy_password', '')}
        required: false
        private: true
        sensitive: true
    - pretty_print:
        default: 'true'
        required: false
    - prettyPrint:
        default: ${get('pretty_print', '')}
        required: false
        private: true

  java_action:
    gav: 'io.cloudslang.content:cs-google-cloud:0.0.1'
    method_name: execute
    class_name: io.cloudslang.content.gcloud.actions.compute.disks.DisksGet

  outputs:
    - return_code: ${returnCode}
    - return_result: ${returnResult}
    - exception: ${get('exception', '')}

  results:
    - SUCCESS: ${returnCode=='0'}
    - FAILURE
