require "rubygems"
require 'bundler'

Bundler.require

Dir[File.expand_path("actions/*.rb")].each {|file| require file }

Rack::Handler::Thin.run Fennec::Run , :Port => 3000