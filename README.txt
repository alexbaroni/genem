= Genem

* http://wiki.github.com/alexbaroni/genem
* mailto:alexbaroni68@gmail.com

== DESCRIPTION:

Genem is a tool for creating a ruby project that use RSpec and Cucumber for BDD.
It creates the project tree and the project files.
== FEATURES:

* Genem::Project provides the ruby project tree and files creator

== SYNOPSIS:

  genem ProjectName ClassName
  
  it creates:
    project_name
      bin
      | project_name
      |
      features
      | step_definitions
      | | project_name_steps.rb
      | |
      | support
      | | env.rb
      | |
      | first_project_name.feature
      |
      lib
      | project_name
      | | class_name.rb
      | |
      | project_name.rb
      |
      spec
      | project_name
      | | class_name_spec.rb
      | |
      | spec.opts
      | spec_helper.rb
      |
      Rakefile
      .autotest
      cucumber.yml
        
== INSTALL:

  [sudo] gem install genem

 or

  git clone git://github.com/alexbaroni/genem.git
  cd genem
  rake gem
  rake install_gem
