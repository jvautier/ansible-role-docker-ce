describe package('docker-ce') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('0.0.0.0', 2375) do
  it { should be_listening }
  its('protocols') { should cmp 'tcp' }
  its('processes') { should include 'dockerd' }
end

describe port('0.0.0.0', 9999) do
  it { should be_listening }
  its('protocols') { should cmp 'tcp' }
  its('processes') { should include 'dockerd' }
end

describe file('/usr/local/bin/docker-compose') do
  it { should exist }
  it { should be_executable }
end

describe command('docker-compose --version') do
  its('stdout') { should match ('1.23.1') }
end

describe file('/usr/local/bin/docker-machine') do
  it { should exist }
  it { should be_executable }
end

describe command('docker-machine --version') do
  its('stdout') { should match ('0.16.0') }
end

describe file('/usr/local/bin/docker-app') do
  it { should exist }
  it { should be_executable }
end

describe command('docker-app --version') do
  its('stdout') { should match ('0.6.0') }
end