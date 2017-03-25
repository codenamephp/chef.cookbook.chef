apt_repository 'virtualbox' do
  uri        'http://download.virtualbox.org/virtualbox/debian'
  repo_name 'virtualbox'
  distribution 'jessie'
  components ['contrib']
  key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
end

package 'Install virtualbox' do
  package_name 'virtualbox-4.3' #TODO make version configurable
end