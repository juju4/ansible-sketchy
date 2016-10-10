require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end


describe command('curl -sSq "http://localhost:8000/eager?url=http://google.com&type=html" | tee /tmp/sketchy-capture.out') do
  its(:stdout) { should match /<title>Google<\/title>/ }
  its(:exit_status) { should eq 0 }
end

