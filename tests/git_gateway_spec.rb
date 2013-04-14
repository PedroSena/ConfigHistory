require_relative 'spec_helper'
require 'git_gateway'

describe GitGateway do

  path = '/test'

  after(:each) do
    system "rm -rf /test/.git"
  end

  it "should create a valid empty git repo" do
    @gateway = GitGateway.new(path)
    @gateway.new_repository
    File.directory?(path + '/.git').should be_true
    path += '/.git/'
    ['branches','hooks','info','objects', 'refs'].each do |git_generated_dirs|
      File.directory?(path + git_generated_dirs).should be_true
    end
  end


end