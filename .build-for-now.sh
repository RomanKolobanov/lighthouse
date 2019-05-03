#!/usr/bin/env bash

##
# @license Copyright 2019 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
##

set -x

# now doesn't support node 10 yet
cat package.json | sed 's|"node": .*|"node": "*"|' > package.json.fixed
mv package.json.fixed package.json

yarn install

# Create dist if it's not already there
mkdir -p dist

# Generate the report and place as dist/index.html
node lighthouse-core/scripts/build-report-for-autodeployment.js