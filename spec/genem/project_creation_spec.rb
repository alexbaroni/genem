require File.join(File.dirname(__FILE__), "/../spec_helper" )
require 'fileutils'

module Genem
  describe Project, "when successfully create a project named Supernova" do
    after(:each) do
      project_root = File.join(".", "supernova")
      FileUtils.rm_r project_root if File.exists? project_root
    end
    
    it "should print the successfully creation message" do
      messenger = mock("messenger")
      messenger.should_receive(:puts).with("Project Supernova created")
      Project.create(messenger, 'Supernova', 'Anything')
    end
  end

  describe Project, "when a project named Supernova already exists" do
    before(:each) do
        Dir.mkdir File.join(".", 'supernova')
    end
  
    after(:each) do
      project_root = File.join(".", "supernova")
      FileUtils.rm_r project_root if File.exists? project_root
    end
    
    it "should print the project already existing message" do
      messenger = mock("messenger")
      messenger.should_receive(:puts).with("Project Supernova already exists")
      Project.create(messenger, 'Supernova', 'Anything')
    end
  end
end