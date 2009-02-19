require File.join(File.dirname(__FILE__), "/../spec_helper" )

module Genem
  describe ProjectFileContentGenerator do
    context "when creating Rakefile content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_rakefile_content
      end

      it "should require rubygems" do
        @file_content.should match(/require 'rubygems'/)
      end

      it "should require rake" do
        @file_content.should match(/require 'rake'/)
      end

      it "should require spec/rake/spectask" do
        @file_content.should match(/require 'spec\/rake\/spectask'/)
      end

      it "should require cucumber/rake/task" do
        @file_content.should match(/require 'cucumber\/rake\/task'/)
      end
      
      it "should create the run all specs task" do
        @file_content.should match(/desc "Run all specs"/)
        @file_content.should match(/Spec::Rake::SpecTask\.new\(:specs\) do \|t\|/)
        @file_content.should match(/\tt\.spec_opts = \["--color", "--format specdoc", "--diff"\]/)
        @file_content.should match(/\tt\.warning = true\nend/)
      end

      it "should create the run all specs with RCov task" do
        @file_content.should match(/desc "Run all specs with RCov"/)
        @file_content.should match(/Spec::Rake::SpecTask\.new\(:specs_with_rcov\) do \|t\|/)
        @file_content.should match(/\tt\.rcov = true/)
        @file_content.should match(/\tt\.rcov_opts = \['--exclude', 'spec'\]\nend/)
      end

      it "should create the run all specs with html output task" do
        @file_content.should match(/desc "Run all specs with html output"/)
        @file_content.should match(/Spec::Rake::SpecTask\.new\(:specs_with_html\) do \|t\|/)
        @file_content.should match(/\thtml = 'spec\/specs\.html'/)
        @file_content.should match(/\tt\.spec_opts = \["--color", "--format specdoc", "--format html:#\{html\}", "--diff"\]/)
        @file_content.should match(/\tt\.warning = true\nend/)
      end

      it "should create the run all features task" do
        @file_content.should match(/desc "Run all features"/)
        @file_content.should match(/Cucumber::Rake::Task\.new\(:features\) do \|t\|/)
        @file_content.should match(/\tt\.cucumber_opts = "--format pretty --color"\nend/)
      end
      
      it "should create the run all features with RCov task" do
        @file_content.should match(/desc "Run all features with RCov"/)
        @file_content.should match(/Cucumber::Rake::Task\.new\(:features_with_rcov\) do \|t\|/)
        @file_content.should match(/\tt\.cucumber_opts = "--format pretty --color"/)
        @file_content.should match(/\tt\.rcov = true\nend/)
      end
      
      it "should create the run all features with html output task" do
        @file_content.should match(/desc "Run all features with html output"/)
        @file_content.should match(/Cucumber::Rake::Task\.new\(:features_with_html\) do \|t\|/)
        @file_content.should match(/\thtml = 'features\/features\.html'/)
        @file_content.should match(/\tt\.cucumber_opts = "--format pretty --format html --out #\{html\} --color"\nend/)
      end
    end

    context "when creating autotest file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_autotest_file_content
      end

      it "should require timestamp plugin" do
        @file_content.should match(/require 'autotest\/timestamp'/)
      end
      
      it "should put a commented require win32console" do
        @file_content.should match(/#require 'win32console' #uncomment for colored output on windows/)
      end
    end

    context "when creating cucumber config file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_cucumber_config_file_content
      end

      it "should create the default profile" do
        @file_content.should match(/default: --format progress features/)
      end
      
      it "should create the autotest profile" do
        @file_content.should match(/autotest: --format pretty --color features/)
      end
      
      it "should create the autotest-all profile" do
        @file_content.should match(/autotest-all: --format pretty --color features/)
      end
    end

    context "when creating cucumber environment file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_cucumber_environment_file_content
      end
      
      it "should add the project source dir to LOAD_PATH" do
        @file_content.should match(/\$: << File\.join\(File\.dirname\(__FILE__\), "\/\.\.\/\.\.\/lib"\)/)
      end
      
      it "should require rubygems" do
        @file_content.should match(/require 'rubygems'/)
      end

      it "should require spec/expectations" do
        @file_content.should match(/require 'spec\/expectations'/)
      end

      it "should require supernova" do
        @file_content.should match(/require 'supernova'/)
      end
    end

    context "when creating cucumber feature file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_cucumber_feature_file_content
      end
      
      it "should add the first feature description" do
        @file_content.should match(/Feature:/)
        @file_content.should match(/As a/)
        @file_content.should match(/I want/)
        @file_content.should match(/So that/)
      end
      
      it "should add the first scenario description" do
        @file_content.should match(/Scenario:/)
        @file_content.should match(/Given/)
        @file_content.should match(/When/)
        @file_content.should match(/Then/)
      end
    end
    
    context "when creating project file content for a project named Supernova and a class named Star" do
      it "should require the first project class" do
        project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        file_content = project_file_content_generator.generate_project_file_content
        file_content.should match(/require 'supernova\/star'/)
      end 
    end

    context "when creating project first class file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_project_first_class_file_content
      end
      
      it "should add module supernova" do
        @file_content.should match(/module Supernova/)
      end
      
      it "should add first class" do
        @file_content.should match(/\tclass Star/)
      end

      it "should add class and module end" do
        @file_content.should match(/\tend\nend/)
      end
    end

    context "when creating project spec options file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_project_spec_options_file_content
      end
      
      it "should add the format specdoc option" do
        @file_content.should match(/--format specdoc/)
      end
      
      it "should add the format html option" do
        @file_content.should match(/--format html:spec\/specs.html/)
      end
      
      it "should add the color option" do
        @file_content.should match(/--color/)
      end
    end
    
    context "when creating project spec helper file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_project_spec_helper_file_content
      end
      
      it "should add the project source dir to LOAD_PATH" do
        @file_content.should match(/\$: << File\.join\(File\.dirname\(__FILE__\), "\/\.\.\/lib"\)/)
      end
      
      it "should require rubygems" do
        @file_content.should match(/require 'rubygems'/)
      end
      
      it "should require fileutils" do
        # workaround for rspec bug generating html output (on win32 at least)
        @file_content.should match(/require 'fileutils'/)
      end

      it "should require spec" do
        @file_content.should match(/require 'spec'/)
      end
      
      it "should require supernova" do
        @file_content.should match(/require 'supernova'/)
      end
    end
    
    context "when creating project first class spec file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_project_first_class_spec_file_content
      end

      it "should require spec helper" do
        @file_content.should match(/require File\.join\(File\.dirname\(__FILE__\), "\/\.\.\/spec_helper"\)/)
      end
      
      it "should add module supernova" do
        @file_content.should match(/module Supernova/)
      end
      
      it "should describe Star" do
        @file_content.should match(/\tdescribe Star do/)
      end
        
      it "should add describe and module end" do
        @file_content.should match(/\tend\nend/)
      end
    end
    
    context "when creating project executable file content for a project named Supernova and a class named Star" do
      before(:each) do
        @project_file_content_generator = ProjectFileContentGenerator.new('Supernova', 'Star')
        @file_content = @project_file_content_generator.generate_project_executable_file_content
      end

      it "should add the shebang line" do
        @file_content.should match(/#!\/usr\/bin\/env ruby -w/)
      end
        
      it "should add the project source dir to LOAD_PATH" do
        @file_content.should match(/\$LOAD_PATH\.push File\.join\(File\.dirname\(__FILE__\), "\/\.\.\/lib"\)/)
      end
      
      it "should require supernova" do
        @file_content.should match(/require 'supernova'/)
      end

      it "should create the star object" do
        @file_content.should match(/star = Supernova::Star.new/)
      end
    end
  end
end