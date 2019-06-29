require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end


describe command('curl -sSq http://localhost:8000/eager | tee /tmp/sketchy-root.out') do
  its(:stdout) { should_not match /<title>404 Not Found<\/title>/ }
  its(:stdout) { should match /URL cannot be blank/ }
  its(:exit_status) { should eq 0 }
end

# Ubuntu 18.04: blocks on '/usr/local/bin/phantomjs --ssl-protocol=any --ignore-ssl-errors=yes /var/sketchy/git/sketchy/assets/capture.js http://google.com /var/sketchy/git/files/google.com'
describe command('curl -sSq "http://localhost:8000/eager?url=http://google.com&type=html" | tee /tmp/sketchy-capture.out'), :if => os[:family] == 'ubuntu' && os[:release] != '18.04' do
  its(:stdout) { should match /<title>Google<\/title>/ }
  its(:stderr) { should_not match /Empty reply from server/ }
  its(:exit_status) { should eq 0 }
end
