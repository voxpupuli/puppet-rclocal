require 'spec_helper'

describe 'rclocal::script' do
  on_supported_os.each do |os, facts|
    context "with default data on #{os}" do
      let(:facts) do
        facts
      end
      let(:title) do
        'spec'
      end

      it { is_expected.to contain_file('rclocal_50_spec') }
    end
    context "with default data and unsafe title  on #{os}" do
      let(:facts) do
        facts
      end
      let(:title) do
        'spec/test'
      end

      it { is_expected.to contain_file('rclocal_50_spec_test') }
    end
    context "with data set on #{os}" do
      let(:facts) do
        facts
      end
      let(:title) do
        'spec'
      end
      let(:params) do
        {
          'ensure' => 'present',
          'priority' => '99',
          'autoexec' => true,
          'content' => 'spec_content',
        }
      end

      it { is_expected.to contain_file('rclocal_99_spec').with_content('spec_content') }
      it { is_expected.to contain_exec('rclocal_99_spec') }
    end
  end
end
