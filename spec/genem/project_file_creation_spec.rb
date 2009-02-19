require File.join(File.dirname(__FILE__), "/../spec_helper" )
require 'fileutils'

module Genem
  describe Project, "when creating project files for a project named supernova and a class named Star" do
    before(:all) do
        messenger = mock("messenger").as_null_object
        Project.create(messenger, 'Supernova', 'Star')
    end
  
    after(:all) do
      project_root = File.join(".", "supernova")
      FileUtils.rm_r project_root if File.exists? project_root
    end
    
    it "should create the Rakefile file under the project root directory" do
      Dir.glob("**/*").should include("supernova/Rakefile")
    end
    it "should create the autotest configuration file under the project root directory" do
      Dir.glob("**/.*").should include("supernova/.autotest")
    end
    it "should create the cucumber configuration file under the project root directory" do
      Dir.glob("**/*").should include("supernova/cucumber.yml")
    end
    it "should create the cucumber environment file under the project features/support subdirectory" do
      Dir.glob("**/*").should include("supernova/features/support/env.rb")
    end
    it "should create the step file under the project features/step_definitions subdirectory" do
      Dir.glob("**/*").should include("supernova/features/step_definitions/supernova_steps.rb")
    end
    it "should create the feature file under the project features subdirectory" do
      Dir.glob("**/*").should include("supernova/features/first_supernova.feature")
    end
    it "should create the project file under the project lib subdirectory" do
      Dir.glob("**/*").should include("supernova/lib/supernova.rb")
    end
    it "should create the project first class file under the project lib source subdirectory" do
      Dir.glob("**/*").should include("supernova/lib/supernova/star.rb")
    end
    it "should create the project spec options file under the project spec subdirectory" do
      Dir.glob("**/*").should include("supernova/spec/spec.opts")
    end
    it "should create the project spec helper file under the project spec subdirectory" do
      Dir.glob("**/*").should include("supernova/spec/spec_helper.rb")
    end
    it "should create the project first class spec file under the project spec source subdirectory" do
      Dir.glob("**/*").should include("supernova/spec/supernova/star_spec.rb")
    end
    it "should create the project executable file under the project bin subdirectory" do
      Dir.glob("**/*").should include("supernova/bin/supernova")
    end
  end
end