#
# Author:: Matt Ray <matt@@chef.io>
# Cookbook Name:: chrony
# Attributes:: default
# Copyright:: 2011-2018 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# hash of default servers in the chrony.conf from Ubuntu
default['chrony']['servers'] = {}

# The syntax of this directive is similar to that for the server directive,
# except that it is used to specify a pool of NTP servers rather than a single
# NTP server. The pool name is expected to resolve to multiple addresses which
# might change over time.
default['chrony']['pools'] = {
  '0.debian.pool.ntp.org' => 'offline minpoll 8',
  '1.debian.pool.ntp.org' => 'offline minpoll 8',
  '2.debian.pool.ntp.org' => 'offline minpoll 8',
  '3.debian.pool.ntp.org' => 'offline minpoll 8',
}

default['chrony']['server_options'] = 'offline minpoll 8'

# set in the client & master recipes
default['chrony']['allow'] = ['allow']

# set in the client & master recipes
default['chrony']['initstepslew'] = ''

default['chrony']['discover_chrony_servers'] = true

# internal attributes
default['chrony']['package'] = 'chrony'
default['chrony']['service'] = 'chrony'
default['chrony']['conffile'] = '/etc/chrony/chrony.conf'

# overrides on a platform-by-platform basis
case node['platform_family']
when 'amazon'
  default['chrony']['service'] = 'chronyd'
  default['chrony']['conffile'] = '/etc/chrony.conf'
end
