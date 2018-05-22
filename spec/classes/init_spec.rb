require 'spec_helper'
describe 'ood' do

  context 'with defaults for all parameters' do
    it { should contain_class('ood') }
  end
end
