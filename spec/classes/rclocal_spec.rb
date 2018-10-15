require 'spec_helper'

describe 'rclocal' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile }
      it { is_expected.to contain_class('rclocal') }
      it { is_expected.to contain_file('/etc/rc.local') }
      it { is_expected.to contain_file('/etc/rc.local.d') }
    end
    context "with scripts hash set on #{os}" do
      let(:facts) do
        facts
      end
      let(:params) do
        {
          'scripts' => {
            'spec' => {
              'content' => 'spec_content',
            },
          },
        }
      end

      it { is_expected.to contain_rclocal__script('spec').with_content('spec_content') }
    end
    context "with wrong data on #{os}" do
      let(:facts) do
        facts
      end
      let(:params) do
        {
          'config_file' => 'foobar',
        }
      end

      it { is_expected.to compile.and_raise_error(%r{parameter 'config_file' expects a}) }
    end
  end
end
