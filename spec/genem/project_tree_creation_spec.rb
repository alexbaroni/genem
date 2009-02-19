require File.join(File.dirname(__FILE__), "/../spec_helper" )
require 'fileutils'

module Genem
  describe Project, "when creating project tree for a project name Supernova" do
    before(:all) do
        messenger = mock("messenger").as_null_object
        Project.create(messenger, 'Supernova', 'Anything')
    end
  
    after(:all) do
      project_root = File.join(".", "supernova")
      FileUtils.rm_r project_root if File.exists? project_root
    end
    
    it "should create the project root directory" do
      Dir.entries(".").should include("supernova")
    end
    it "should create the project features directory" do
      Dir.glob("**/*").should include("supernova/features")
    end
    it "should create the project spec directory" do
      Dir.glob("**/*").should include("supernova/spec")
    end
    it "should create the project lib directory" do
      Dir.glob("**/*").should include("supernova/lib")
    end
    it "should create the project bin directory" do
      Dir.glob("**/*").should include("supernova/bin")
    end
    it "should create the project features/step_definitions directory" do
      Dir.glob("**/*").should include("supernova/features/step_definitions")
    end
    it "should create the project features/support directory" do
      Dir.glob("**/*").should include("supernova/features/support")
    end
    it "should create the project lib source directory" do
      Dir.glob("**/*").should include("supernova/lib/supernova")
    end
    it "should create the project spec source directory" do
      Dir.glob("**/*").should include("supernova/spec/supernova")
    end
  end
end