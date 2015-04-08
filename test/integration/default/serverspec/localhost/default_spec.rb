require 'spec_helper'

describe 'steamcmd' do
  describe file('c:/steamcmd/') do
    it { should be_directory }
  end

  describe file('c:/steamcmd/steamcmd.exe') do
    it { should be_file }
  end
end

describe 'rust' do
  describe file('c:/rust') do
    it { should be_directory }
  end
end
