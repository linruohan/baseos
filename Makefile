# encoding: UTF-8
#
# Author:    Stefano Harding <riddopic@gmail.com>
# License:   Apache License, Version 2.0
# Copyright: (C) 2014-2015 Stefano Harding
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

.PHONY: all alpine default centos-6 centos-7 ubuntu

default: all

all: alpine centos chef-server docker fedora ubuntu

alpine:
	$(MAKE) -C alpine-3 build tag

centos:
	$(MAKE) -C centos-6 build tag
	$(MAKE) -C centos-6-sshd build tag
	$(MAKE) -C centos-7 build tag
	$(MAKE) -C centos-7-sshd build tag

chef-server: ubuntu
	$(MAKE) -C chef-server build tag

docker: ubuntu
	$(MAKE) -C docker build tag

fedora:
	$(MAKE) -C fedora-21 build tag
	$(MAKE) -C fedora-21-sshd build tag

ubuntu:
	$(MAKE) -C ubuntu-12.04 build tag
	$(MAKE) -C ubuntu-12.04-sshd build tag
	$(MAKE) -C ubuntu-14.04 build tag
	$(MAKE) -C ubuntu-14.04-sshd build tag

clean: clean-alpine clean-centos clean-chef-server clean-docker clean-fedora \
			 clean-ubuntu

clean-alpine:
	$(MAKE) -C alpine-3 clean

clean-centos:
	$(MAKE) -C centos-6 clean
	$(MAKE) -C centos-6-sshd clean
	$(MAKE) -C centos-7 clean
	$(MAKE) -C centos-7-sshd clean

clean-chef-server:
	$(MAKE) -C chef-server clean

clean-docker:
	$(MAKE) -C docker clean

clean-fedora:
	$(MAKE) -C fedora-21 clean
	$(MAKE) -C fedora-21-sshd clean

clean-ubuntu:
	$(MAKE) -C ubuntu-12.04 clean
	$(MAKE) -C ubuntu-12.04-sshd clean
	$(MAKE) -C ubuntu-14.04 clean
	$(MAKE) -C ubuntu-14.04-sshd clean
