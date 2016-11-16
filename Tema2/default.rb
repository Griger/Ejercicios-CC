["nginx", "emacs"].each do |p|
  package p do
    action :install
  end
end
directory '/home/vagrant/CC'
file '/home/vagrant/CC/apuntes.md' do
  mode '0777'
end
