require_relative 'spec_helper'
require 'git_gateway'

describe GitGateway do

  path = '/test'

  before(:each) do
    @gateway = GitGateway.new(path)
    @gateway.new_repository
  end

  after(:each) do
    `rm -rf /test/.git`
  end

  it "should create a valid empty git repo" do
    File.directory?(path + '/.git').should be_true
    git_path = path + '/.git/'
    ['branches','hooks','info','objects', 'refs'].each do |git_generated_dirs|
      File.directory?(git_path + git_generated_dirs).should be_true
    end
  end

  it "should add and commit a new file" do
    File.open(path + '/test.txt', 'w+') { |f| f.write('something') }
    @gateway.commit
    output = @gateway.run("ls-files #{path}/test.txt --error-unmatch 2>&1")
    output.include?('is outside repository').should be_false
  end


end