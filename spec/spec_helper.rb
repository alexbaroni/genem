$: << File.join(File.dirname(__FILE__), "/../lib" )
require 'rubygems'
require 'spec'
require 'fileutils'
require 'win32console' if RUBY_PLATFORM =~ /win32/
require 'genem'
