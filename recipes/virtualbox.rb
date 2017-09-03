apt_repository 'virtualbox' do
  uri        'http://download.virtualbox.org/virtualbox/debian'
  repo_name 'virtualbox'
  distribution 'stretch'
  components ['contrib']
  key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
end

package 'Install virtualbox' do
  package_name 'virtualbox-5.1' #TODO make version configurable
end