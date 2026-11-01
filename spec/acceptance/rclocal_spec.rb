# frozen_string_literal: true

require 'spec_helper_acceptance'

# EL containers have no /dev/console, so rc-local.service (StandardOutput=tty) can't start
describe 'rclocal', unless: fact('os.family') == 'RedHat' do
  it_behaves_like 'an idempotent resource' do
    let(:manifest) do
      <<~PUPPET
        include rclocal

        rclocal::script { 'touch_marker':
          priority => '10',
          content  => "#!/bin/sh\\ntouch /tmp/rclocal_marker\\n",
        }
      PUPPET
    end
  end

  describe file('/etc/rc.local') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 755 }
    its(:content) { is_expected.to match %r{/etc/rc\.local\.d/\$command} }
  end

  describe file('/etc/rc.local.d/10-touch_marker') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 755 }
    its(:content) { is_expected.to match %r{^touch /tmp/rclocal_marker$} }
  end

  describe file('/tmp/rclocal_marker') do
    it { is_expected.to be_file }
  end

  describe file('/etc/systemd/system/rc-local.service') do
    its(:content) { is_expected.to match %r{^ ExecStart=/etc/rc\.local start$} }
  end

  describe service('rc-local') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
