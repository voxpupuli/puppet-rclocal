require 'spec_helper'

describe 'rclocal' do
  context 'should compile' do
    it { should compile }
    it { should contain_class('rclocal') }
  end
end
