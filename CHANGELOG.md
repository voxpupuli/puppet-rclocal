# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v6.0.0](https://github.com/voxpupuli/puppet-rclocal/tree/v6.0.0) (2025-12-20)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v5.0.0...v6.0.0)

**Breaking changes:**

- Drop puppet, update openvox minimum version to 8.19 [\#64](https://github.com/voxpupuli/puppet-rclocal/pull/64) ([TheMeier](https://github.com/TheMeier))

**Implemented enhancements:**

- Add support for Debian 12 [\#66](https://github.com/voxpupuli/puppet-rclocal/pull/66) ([smortex](https://github.com/smortex))
- metadata.json: Add OpenVox [\#60](https://github.com/voxpupuli/puppet-rclocal/pull/60) ([jstraw](https://github.com/jstraw))

## [v5.0.0](https://github.com/voxpupuli/puppet-rclocal/tree/v5.0.0) (2023-11-30)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v4.0.0...v5.0.0)

**Breaking changes:**

- Drop Puppet 6 support [\#43](https://github.com/voxpupuli/puppet-rclocal/pull/43) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add Puppet 8 support [\#46](https://github.com/voxpupuli/puppet-rclocal/pull/46) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#45](https://github.com/voxpupuli/puppet-rclocal/pull/45) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Fix broken Apache-2 license [\#41](https://github.com/voxpupuli/puppet-rclocal/pull/41) ([bastelfreak](https://github.com/bastelfreak))
- Make content parameter optional [\#39](https://github.com/voxpupuli/puppet-rclocal/pull/39) ([smortex](https://github.com/smortex))

## [v4.0.0](https://github.com/voxpupuli/puppet-rclocal/tree/v4.0.0) (2021-11-11)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.3.1...v4.0.0)

**Breaking changes:**

- Use puppet/systemd for rc-local.service/drop non-systemd support [\#36](https://github.com/voxpupuli/puppet-rclocal/pull/36) ([bastelfreak](https://github.com/bastelfreak))
- Ubuntu: Drop EoL 16.04 support; add 20.04 support [\#34](https://github.com/voxpupuli/puppet-rclocal/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- Debian: Drop Eol 8/9 support; add 11 support [\#33](https://github.com/voxpupuli/puppet-rclocal/pull/33) ([bastelfreak](https://github.com/bastelfreak))
- Drop Puppet 4/5 support; require puppet 6.1 or newer [\#31](https://github.com/voxpupuli/puppet-rclocal/pull/31) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Debian uses rc-local.service, not rc.local.service [\#28](https://github.com/voxpupuli/puppet-rclocal/pull/28) ([martijndegouw](https://github.com/martijndegouw))

**Closed issues:**

- Debian's rclocal service name is rc-local.service not rc.local.service [\#27](https://github.com/voxpupuli/puppet-rclocal/issues/27)

**Merged pull requests:**

- cleanup .fixtures.yml [\#35](https://github.com/voxpupuli/puppet-rclocal/pull/35) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 8.x [\#32](https://github.com/voxpupuli/puppet-rclocal/pull/32) ([bastelfreak](https://github.com/bastelfreak))
- Transfer module to Vox Pupuli [\#29](https://github.com/voxpupuli/puppet-rclocal/pull/29) ([tuxmea](https://github.com/tuxmea))

## [v3.3.1](https://github.com/voxpupuli/puppet-rclocal/tree/v3.3.1) (2021-05-03)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.3.0...v3.3.1)

## [v3.3.0](https://github.com/voxpupuli/puppet-rclocal/tree/v3.3.0) (2021-03-16)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.1.0...v3.3.0)

**Merged pull requests:**

- PDK update, update Puppet version, bump minor version [\#26](https://github.com/voxpupuli/puppet-rclocal/pull/26) ([tuxmea](https://github.com/tuxmea))

## [v3.1.0](https://github.com/voxpupuli/puppet-rclocal/tree/v3.1.0) (2020-09-04)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.0.5...v3.1.0)

**Closed issues:**

- SysVStartPriority= has been removed and it is ignored [\#24](https://github.com/voxpupuli/puppet-rclocal/issues/24)

**Merged pull requests:**

- Debian has rc.local.servcie [\#25](https://github.com/voxpupuli/puppet-rclocal/pull/25) ([tuxmea](https://github.com/tuxmea))
- Add more lint tests [\#23](https://github.com/voxpupuli/puppet-rclocal/pull/23) ([tuxmea](https://github.com/tuxmea))
- new release [\#22](https://github.com/voxpupuli/puppet-rclocal/pull/22) ([tuxmea](https://github.com/tuxmea))

## [v3.0.5](https://github.com/voxpupuli/puppet-rclocal/tree/v3.0.5) (2019-10-21)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.0.6...v3.0.5)

## [v3.0.6](https://github.com/voxpupuli/puppet-rclocal/tree/v3.0.6) (2019-10-21)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.0.4...v3.0.6)

**Merged pull requests:**

- PDK Update, Support Ubuntu 18 [\#21](https://github.com/voxpupuli/puppet-rclocal/pull/21) ([tuxmea](https://github.com/tuxmea))

## [v3.0.4](https://github.com/voxpupuli/puppet-rclocal/tree/v3.0.4) (2019-07-21)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v3.0.0...v3.0.4)

**Merged pull requests:**

- Updates: [\#18](https://github.com/voxpupuli/puppet-rclocal/pull/18) ([tuxmea](https://github.com/tuxmea))
- Add systemd rc-local support [\#17](https://github.com/voxpupuli/puppet-rclocal/pull/17) ([tuxmea](https://github.com/tuxmea))
- Update documentation [\#16](https://github.com/voxpupuli/puppet-rclocal/pull/16) ([tuxmea](https://github.com/tuxmea))
- add more unit tests [\#15](https://github.com/voxpupuli/puppet-rclocal/pull/15) ([tuxmea](https://github.com/tuxmea))
- fixes for MODULES\_8017 [\#14](https://github.com/voxpupuli/puppet-rclocal/pull/14) ([tuxmea](https://github.com/tuxmea))

## [v3.0.0](https://github.com/voxpupuli/puppet-rclocal/tree/v3.0.0) (2018-07-03)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.8...v3.0.0)

**Closed issues:**

- Incompatibility issue with Puppet v5 [\#12](https://github.com/voxpupuli/puppet-rclocal/issues/12)
- Module does not run on puppet version 5.x  [\#10](https://github.com/voxpupuli/puppet-rclocal/issues/10)
- metadata.json permissions changed between v2.0.5 and v2.0.7 [\#9](https://github.com/voxpupuli/puppet-rclocal/issues/9)

**Merged pull requests:**

- many improvements [\#13](https://github.com/voxpupuli/puppet-rclocal/pull/13) ([tuxmea](https://github.com/tuxmea))

## [v2.0.8](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.8) (2015-10-12)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.9...v2.0.8)

## [v2.0.9](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.9) (2015-10-12)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.7...v2.0.9)

**Merged pull requests:**

- Add support for OpenBSD [\#8](https://github.com/voxpupuli/puppet-rclocal/pull/8) ([buzzdeee](https://github.com/buzzdeee))

## [v2.0.7](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.7) (2015-08-10)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.6...v2.0.7)

## [v2.0.6](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.6) (2015-02-05)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.5...v2.0.6)

**Closed issues:**

- Cannot guidelines on how to use this module? [\#4](https://github.com/voxpupuli/puppet-rclocal/issues/4)

**Merged pull requests:**

- added support for simple integration with hiera [\#7](https://github.com/voxpupuli/puppet-rclocal/pull/7) ([mburger](https://github.com/mburger))
- Added removal of rc.local scripts \(ensure =\> absent\) [\#6](https://github.com/voxpupuli/puppet-rclocal/pull/6) ([rainopik](https://github.com/rainopik))

## [v2.0.5](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.5) (2013-10-25)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.4...v2.0.5)

## [v2.0.4](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.4) (2013-10-25)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.3...v2.0.4)

## [v2.0.3](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.3) (2013-10-24)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.2...v2.0.3)

**Merged pull requests:**

- allow 'external' template file for rc.local [\#3](https://github.com/voxpupuli/puppet-rclocal/pull/3) ([BlackIkeEagle](https://github.com/BlackIkeEagle))

## [v2.0.2](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.2) (2013-09-24)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/voxpupuli/puppet-rclocal/tree/v2.0.1) (2013-03-08)

[Full Changelog](https://github.com/voxpupuli/puppet-rclocal/compare/702a9d5a312c5c7d9eafc1cbf48610b450830524...v2.0.1)

**Closed issues:**

- Example? [\#1](https://github.com/voxpupuli/puppet-rclocal/issues/1)

**Merged pull requests:**

- Add geppetto infrastructure; fix Modulefile dependencies; update .gitign... [\#2](https://github.com/voxpupuli/puppet-rclocal/pull/2) ([DavidS](https://github.com/DavidS))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
