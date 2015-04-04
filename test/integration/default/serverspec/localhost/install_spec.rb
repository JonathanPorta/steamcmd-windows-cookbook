require 'spec_helper'

describe 'steamcmd::install' do
  describe file('c:/steamcmd/') do
    it { should be_directory }
  end

  describe file('c:/steamcmd/steamcmd.exe') do
    it { should be_file }
  end
end
