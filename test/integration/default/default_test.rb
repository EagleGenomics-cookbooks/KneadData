# Tests to check if the infrastructure we expect is available

# Check that Java was installed
describe command('which java') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/java} }
end

# Check that we have the correct version of Java
describe command('java -version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/1.8/) }
end

# Check that the KneadData installation directory was created successfully
describe file('/usr/local/kneaddata_v0.5.1') do
  it { should be_directory }
end

# Check that the KneadData setup file is where it should be
describe file('/usr/local/kneaddata_v0.5.1/setup.py') do
  it { should be_file }
end

# Check that KneadData was installed
describe command('which kneaddata') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/kneaddata} }
end

describe command('which kneaddata_database') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match %r{/kneaddata_database} }
end

describe command('kneaddata --version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/v0.5.1/) }
end

# Check that the python version is 2.7
describe command('python2.7 --version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match(/2.7/) }
end
