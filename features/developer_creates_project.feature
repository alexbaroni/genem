Feature: developer creates project
  As a developer
  I want to create a project
  So that I can start working on it
  
Scenario: create project
    Given a project named "Supernova"
    And a class named "Star"
    When I create the project
    Then a directory named "supernova" should exist
    And a subdirectory named "features" should exist
    And a subdirectory named "spec" should exist
    And a subdirectory named "lib" should exist
    And a subdirectory named "bin" should exist
    And a subdirectory named "features/step_definitions" should exist
    And a subdirectory named "features/support" should exist
    And a subdirectory named "lib/supernova" should exist
    And a subdirectory named "spec/supernova" should exist
    And a file named "Rakefile" should exist under the project root directory
    And a file named ".autotest" should exist under the project root directory
    And a file named "cucumber.yml" should exist under the project root directory
    And a file named "env.rb" should exist under the "features/support" subdirectory
    And a file named "supernova_steps.rb" should exist under the "features/step_definitions" subdirectory
    And a file named "first_supernova.feature" should exist under the "features" subdirectory
    And a file named "supernova.rb" should exist under the "lib" subdirectory
    And a file named "star.rb" should exist under the "lib/supernova" subdirectory
    And a file named "spec.opts" should exist under the "spec" subdirectory
    And a file named "spec_helper.rb" should exist under the "spec" subdirectory
    And a file named "star_spec.rb" should exist under the "spec/supernova" subdirectory
    And a file named "supernova" should exist under the "bin" subdirectory
    And a message "Project Supernova created" should be printed
    
Scenario: create project already created
    Given a project named "Supernova"
    And a class named "Star"
    And a project named "supernova" exists
    When I create the project
    Then a message "Project Supernova already exists" should be printed
    