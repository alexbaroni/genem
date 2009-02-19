# Create a ruby project that use RSpec and Cucumber for BDD

module Genem
  class Project
    def initialize(messenger, project_file_content_generator)
      @messenger = messenger
      @project_file_content_generator = project_file_content_generator
      @project_name = ''
    end
    
    # Create _project_name_ project containing a _class_name_.
    #
    # :call-seq:
    # project = Genem::Project(STDOUT, Genem::ProjectFileContentGenerator.new(project_name))
    # project.create(project_name, class_name) -> nil
    #
    def create(project_name, class_name)
      @project_name = project_name
      @class_name = class_name
      @project_dir = generate_path_from_name(@project_name)
      @class_file = generate_path_from_name(@class_name)
      
      unless File.exist?(File.join(".", @project_dir))
        create_project
      else
        @messenger.puts("Project #{@project_name} already exists")
      end
    end
    
    def Project.create(messenger, project_name, class_name)
      project_file_content_generator = ProjectFileContentGenerator.new(project_name, class_name)
      project = Project.new(messenger, project_file_content_generator)
      project.create(project_name, class_name)
    end
    
    private
    
    def generate_path_from_name(name)
      name.scan(/[A-Z][a-z0-9]+/).join('_').downcase
    end
    
    def create_project
      create_project_tree
      create_project_files
      @messenger.puts("Project #{@project_name} created")
    end
    
    def create_project_tree
      Dir.mkdir File.join(".", @project_dir)
      Dir.mkdir File.join(".", @project_dir, "features")
      Dir.mkdir File.join(".", @project_dir, "spec")
      Dir.mkdir File.join(".", @project_dir, "lib")
      Dir.mkdir File.join(".", @project_dir, "bin")
      Dir.mkdir File.join(".", @project_dir, "features/step_definitions")
      Dir.mkdir File.join(".", @project_dir, "features/support")
      Dir.mkdir File.join(".", @project_dir, "lib", @project_dir)
      Dir.mkdir File.join(".", @project_dir, "spec", @project_dir)      
    end

    def create_project_files
      create_rakefile        
      create_autotest_file
      create_cucumber_config_file
      create_cucumber_environment_file
      create_cucumber_step_definitions_file
      create_cucumber_feature_file        
      create_project_file
      create_project_first_class_file                
      create_project_spec_options_file  
      create_project_spec_helper_file  
      create_project_first_class_spec_file
      create_project_executable_file
    end
    
    def create_rakefile
      create_file(File.join(".", @project_dir, "Rakefile"), 
        @project_file_content_generator.generate_rakefile_content)
    end
    
    def create_autotest_file
      create_file(File.join(".", @project_dir, ".autotest"),
        @project_file_content_generator.generate_autotest_file_content)
    end

    def create_cucumber_config_file
      create_file(File.join(".", @project_dir, "cucumber.yml"),
        @project_file_content_generator.generate_cucumber_config_file_content)
    end
  
    def create_cucumber_environment_file
      create_file(File.join(".", @project_dir, "features/support", "env.rb"), 
        @project_file_content_generator.generate_cucumber_environment_file_content)
    end
    
    def create_cucumber_step_definitions_file
      create_file(File.join(".", @project_dir, "features/step_definitions", "#{@project_dir}_steps.rb"))
    end
    
    def create_cucumber_feature_file
      create_file(File.join(".", @project_dir, "features", "first_#{@project_dir}.feature"),
        @project_file_content_generator.generate_cucumber_feature_file_content)
    end
   
    def create_project_file
      create_file(File.join(".", @project_dir, "lib", "#{@project_dir}.rb"),
        @project_file_content_generator.generate_project_file_content)
    end
    
    def create_project_first_class_file
      create_file(File.join(".", @project_dir, "lib", "#{@project_dir}", "#{@class_file}.rb"),
        @project_file_content_generator.generate_project_first_class_file_content)
    end
      
    def create_project_spec_options_file
      create_file(File.join(".", @project_dir, "spec", "spec.opts"),
        @project_file_content_generator.generate_project_spec_options_file_content)
    end
  
    def create_project_spec_helper_file
      create_file(File.join(".", @project_dir, "spec", "spec_helper.rb"),
        @project_file_content_generator.generate_project_spec_helper_file_content)
    end
    
    def create_project_first_class_spec_file        
      create_file(File.join(".", @project_dir, "spec", "#{@project_dir}", "#{@class_file}_spec.rb"),
        @project_file_content_generator.generate_project_first_class_spec_file_content)
    end
             
    def create_project_executable_file        
      create_file(File.join(".", @project_dir, "bin", "#{@project_dir}"),
        @project_file_content_generator.generate_project_executable_file_content)
    end

    def create_file(path, content='')
      open(path, "w") do |f|
        f << content
      end
    end
  end
end