require File.join(File.dirname(__FILE__), "/../spec_helper" )
require 'fileutils'

module Genem
  describe Project, "when creating files content for a project named Supernova" do
    before(:each) do
        messenger = mock("messenger").as_null_object
        @project_file_content_generator = mock("project_file_content_generator").as_null_object
        @project = Project.new(messenger, @project_file_content_generator)
    end
  
    after(:each) do
      project_root = File.join(".", "supernova")
      FileUtils.rm_r project_root if File.exists? project_root
    end
    
    it "should ask the project file content generator for Rakefile content" do
      @project_file_content_generator.should_receive(:generate_rakefile_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for autotest file content" do
      @project_file_content_generator.should_receive(:generate_autotest_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for cucumber configuration file content" do
      @project_file_content_generator.should_receive(:generate_cucumber_config_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for cucumber environment file content" do
      @project_file_content_generator.should_receive(:generate_cucumber_environment_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for cucumber feature file content" do
      @project_file_content_generator.should_receive(:generate_cucumber_feature_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project file content" do
      @project_file_content_generator.should_receive(:generate_project_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project first class file content" do
      @project_file_content_generator.should_receive(:generate_project_first_class_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project spec options file content" do
      @project_file_content_generator.should_receive(:generate_project_spec_options_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project spec helper file content" do
      @project_file_content_generator.should_receive(:generate_project_spec_helper_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project first class spec file content" do
      @project_file_content_generator.should_receive(:generate_project_first_class_spec_file_content)
      @project.create('Supernova', 'Anything')
    end

    it "should ask the project file content generator for project executable file content" do
      @project_file_content_generator.should_receive(:generate_project_executable_file_content)
      @project.create('Supernova', 'Anything')
    end
  end
end