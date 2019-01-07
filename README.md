# Time Zone Configuration Plugin for Vagrant

[![Gem Version](https://badge.fury.io/rb/vagrant-timezone.png)][gem]
[![Build Status](https://travis-ci.org/tmatilai/vagrant-timezone.png?branch=master)][travis]

[gem]: https://rubygems.org/gems/vagrant-timezone
[travis]: https://travis-ci.org/tmatilai/vagrant-timezone

A [Vagrant](http://www.vagrantup.com/) plugin that configures the time zone of a virtual machines.

If you want to use a specific time zone in a Vagrant VM, or if a third party base box comes with a non-standard time zone, this plugin is to the rescue. The configuration is done on `vagrant up` and `vagrant reload` actions. Note that no services are restarted automatically so they may keep using the old time zone information.

## Usage

Install the plugin:

```sh
vagrant plugin install vagrant-timezone
```

To configure time zone for all Vagrant VMs, add the following to _$HOME/.vagrant.d/Vagrantfile_ (or to a project specific _Vagrantfile_):

```ruby
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "UTC"
  end
  # ... other stuff
end
```

The value can be anything that the [tz database supports](http://en.wikipedia.org/wiki/List_of_tz_database_time_zones) (the "TZ" column). For example "UTC" or "Europe/Helsinki".

For Windows guests the value can be a name in [this table](https://msdn.microsoft.com/en-us/library/ms912391(v=winembedded.11).aspx), or "Etc/GMT`<offset>`" (like with the `:host` value, see the next chapter).

### Matching the Host Timezone

If the special symbol `:host` is passed at the parameter (`config.timezone.value = :host`), the plugin will attempt to set the guest timezone offset to match the current offset of the host. Because of limitations in Ruby's ability to get the named timezone from the host, it will instead convert the host's timezone offset to a calculated offset from UTC. So for example, on the west coast of the USA the calculated timezone might be `Etc/GMT+8`. After a change in the host's timezone (including a change due to Daylight Savings Time taking effect), the next time the Vagrantfile is run the guest clock will be updated to match. Note that this functionality has only been tested with an OS X host and Linux guest.

## Compatibility

This plugin requires Vagrant 1.2 or newer ([downloads](https://www.vagrantup.com/downloads)).

The plugin is supposed to be compatible with all Vagrant providers and other plugins. Please file an [issue](https://github.com/tmatilai/vagrant-timezone/issues) if this is not the case.

At the moment the supported platforms include:

- All Linux guests. Confirmed at least:
    * Arch
    * CoreOS
    * Debian (and derivatives)
    * Gentoo
    * RedHat (and derivatives)

- All BSD guests:
    * FreeBSD
    * NetBSD
    * OpenBSD
    * OS X

- Windows

## Development

As Vagrant bundles Ruby, the same version should be used when developing this plugin. For example Vagrant 1.9 comes with Ruby 2.2.
