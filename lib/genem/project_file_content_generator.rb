module Genem
  class ProjectFileContentGenerator
    def initialize(project_name, class_name)
      @project_name = project_name
      @class_name = class_name
      @project_dir = generate_path_from_name(@project_name)
      @class_file = generate_path_from_name(@class_name)
    end
    
    def generate_rakefile_content
       ["require 'rubygems'",
        "require 'rake'",
        "require 'spec/rake/spectask'",
        "require 'cucumber/rake/task'",
        "",
        'desc "Run all specs"',
        "Spec::Rake::SpecTask.new(:specs) do |t|",
        "\tt.spec_opts = [\"--color\", \"--format specdoc\", \"--diff\"]",
        "\tt.warning = true",
        "end",
        "",
        'desc "Run all specs with RCov"',
        "Spec::Rake::SpecTask.new(:specs_with_rcov) do |t|",
        "\tt.rcov = true",
        "\tt.rcov_opts = ['--exclude', 'spec']",
        "end",
        "",
        'desc "Run all specs with html output"',
        "Spec::Rake::SpecTask.new(:specs_with_html) do |t|",
        "\thtml = 'spec/specs.html'",
        "\tt.spec_opts = [\"--color\", \"--format specdoc\", \"--format html:\#{html}\", \"--diff\"]",
        "\tt.warning = true",
        "end",
        "",
        'desc "Run all features"',
        "Cucumber::Rake::Task.new(:features) do |t|",
        "\tt.cucumber_opts = \"--format pretty --color\"",
        "end",
        "",
        'desc "Run all features with RCov"',
        "Cucumber::Rake::Task.new(:features_with_rcov) do |t|",
        "\tt.cucumber_opts = \"--format pretty --color\"",
        "\tt\.rcov = true",
        "end",
        "",
        'desc "Run all features with html output"',
        "Cucumber::Rake::Task.new(:features_with_html) do |t|",
        "\thtml = 'features/features.html'",
        "\tt.cucumber_opts = \"--format pretty --format html --out \#{html} --color\"",
        "end"].join($/)
    end
    
    def generate_autotest_file_content
      ["require 'autotest/timestamp'",
       "\#require 'win32console' \#uncomment for colored output on windows"].join($/)
    end
    
    def generate_cucumber_config_file_content
      ["default: --format progress features",
       "autotest: --format pretty --color features",
       "autotest-all: --format pretty --color features"].join($/)
    end
          
    def generate_cucumber_environment_file_content
      ['$: << File.join(File.dirname(__FILE__), "/../../lib")',
       "require 'rubygems'",
       "require 'spec/expectations'",
       "require '#{@project_dir}'"].join($/)
    end
    
    def generate_cucumber_feature_file_content
      ['Feature:',
       'As a',
       'I want',
       'So that',
       '',
       'Scenario:',
       'Given',
       'When',
       'Then'].join($/)
    end
    
    def generate_project_file_content
      "require '#{@project_dir}/#{@class_file}'"
    end
    
    def generate_project_first_class_file_content
      ["module #{@project_name}",
       "\tclass #{@class_name}",
       "\tend",
       "end"].join($/)
    end
    
    def generate_project_spec_options_file_content
      ["--color",
       "--format specdoc",
       "--format html:spec/specs.html"
       ].join($/)
    end
    
    def generate_project_spec_helper_file_content
      ['$: << File.join(File.dirname(__FILE__), "/../lib")',
       "require 'rubygems'",
       "require 'fileutils'",
       "require 'spec'",
       "require '#{@project_dir}'"].join($/)
    end
    
    def generate_project_first_class_spec_file_content
      ['require File.join(File.dirname(__FILE__), "/../spec_helper")',
       "module #{@project_name}",
       "\tdescribe #{@class_name} do",
       "\tend",
       "end"].join($/)
    end
    
    def generate_project_executable_file_content
      ['#!/usr/bin/env ruby -w',
       '$LOAD_PATH.push File.join(File.dirname(__FILE__), "/../lib")',
       "require '#{@project_dir}'",
       "#{@class_file} = #{@project_name}::#{@class_name}.new"].join($/)
    end

    private
    
    def generate_path_from_name(name)
      name.scan(/[A-Z][a-z0-9]+/).join('_').downcase
    end     
  end
end