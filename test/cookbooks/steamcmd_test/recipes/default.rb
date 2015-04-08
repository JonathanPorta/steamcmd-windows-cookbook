include_recipe 'steamcmd::install'

steamcmd '258550' do
  path 'c:/rust/'
  beta '111'
end
