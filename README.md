# Puppet rclocal module

![Build Status](https://github.com/voxpupuli/puppet-rclocal/actions/workflows/ci.yml/badge.svg?branch=master)

#### Table of Contents
1. [Module Description](#module-description)
1. [Setup](#setup)
1. [Usage](#usage)
1. [Parameters](#parameters)
1. [Development](#development)
1. [Author](#author)

## Module description
This module manages rc.local entries in /etc/rc.local file directory.

## Setup

This module uses Data Types from puppetlabs-stdlib!

Systemd based systems will need [puppet/systemd](https://forge.puppet.com/puppet/systemd).

## Usage

To only manage the content of rc.local file:

    class { 'rclocal':
      # config_file - OS specific, set via hiera data in module
      # config_dir  - OS specific, set via hiera data in module
      # template    - name a template to fill rc.local file, defaults to module template
      # scripts     - a hash of rc.local.d snippets to add
    }
or
    include rclocal

Main usage is via a defined resource tye:

    rclocal::script { 'name':
      ensure   => 'present',
      content  => "content for rc_local snippet\n",
      priority => '44',
      autoexec => true,
    }

Or by defining hiera data for main class `scripts` parameter:

    ---
    rclocal::scripts:
      'name':
        'ensure': 'present'
        'content': "content for rc_local snippet\n"
        'priority': '44'
        'autoexec': true

and then consume the data in your profile:

    lookup('rclocal::scripts').each |$key, $params| {
      rclocal::script { $key:
        * => $params,
      }
    }

## Parameters

- ensure: set to 'present' or 'absent'
- content: the content you want to add
- priority: manages the order where the content appears
- autoexec: true or false - should puppet execute the code snippet from content - if set to false code will get executed on next reboot

## Development

If you encounter problems, please [open an issue](https://github.com/voxpupuli/puppet-rclocal/issues/new), if you miss functionality, we are happy to review [Pull Requests](https://github.com/voxpupuli/puppet-rclocal/pulls)

## Author

This module was maintained and created by [example42 GmbH](https://example42.com) (c) 2012-2021
Module is transferred to [Vox Pupuli](https://voxpupuli.org) on Nov 11th 2021.


