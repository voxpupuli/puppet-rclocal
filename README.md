# Puppet rclocal module

[![Build Status](https://travis-ci.org/example42/puppet-rclocal.png?branch=master)](https://travis-ci.org/example42/puppet-rclocal)

This module manages rc.local entries in /etc/rc.local file directory.

## Usage

Main usage is via a defined resource tye:

    rclocal::script { 'name':
      ensure   => 'present',
      content  => "content for rc_local\n",
      priority => '44',
      autoexec => true,
    }

## Parameters

- ensure: set to 'present' or 'absent'
- content: the content you want to add
- priority: manages the order where the content appears
- autoexec: true or false - should puppet execute the code snippet from content - if set to false code will get executed on next reboot

## Author

example42 GmbH (c) 2018

