After do
  project_root = File.join(".", @project_name)
  FileUtils.rm_r project_root if File.exists? project_root
end

Given /^a project named "(.*)"$/ do |name|
  @project_name = name
end

Given /^a class named "(.*)"$/ do |name|
  @class_name = name
end

Given /^a project named "(.*)" exists$/ do |name|
  Dir.mkdir File.join(".", name)
end

When /^I create the project$/ do
  @messenger = StringIO.new
  Genem::Project.create(@messenger, @project_name, @class_name)
end

Then /^a directory named "(.*)" should exist$/ do |name|
  project_root = File.join(".", name)
  File.exists?(project_root).should be_true
end

Then /^a subdirectory named "(.*)" should exist$/ do |subdir|
  project_subdirectory = File.join(".", @project_name, subdir)
  File.exists?(project_subdirectory).should be_true
end

Then /^a file named "(.*)" should exist under the project root directory$/ do |file|
  project_file = File.join(".", @project_name, file)
  File.exists?(project_file).should be_true
end

Then /^a file named "(.*)" should exist under the "(.*)" subdirectory$/ do |file, subdir|
  project_file = File.join(".", @project_name, subdir, file)
  File.exists?(project_file).should be_true
end

Then /^a message "(.*)" should be printed$/ do |message|
  @messenger.string.split("\n" ).should include(message)
end