require 'erb'
require 'rack'
require 'rack/server'
require 'fileutils'
require File.expand_path '../fennec/assets.rb', __FILE__
require File.expand_path '../fennec/routes.rb', __FILE__
require File.expand_path '../fennec/rackaction.rb', __FILE__
require File.expand_path '../fennec/meta.rb', __FILE__

module Fennec
	class << self
		def teardown()
      puts "Fennec: shutting down..."
    end
  end
  module Utils
    # Return a directory with the project libraries.
    def self.gem_libdir
      t = ["#{File.dirname(File.expand_path($0))}/../templates",
           "#{Gem.dir}/gems/#{Fennec::Meta::NAME}-#{Fennec::Meta::VERSION}/templates"]
      t.each {|i| return i if File.readable?(i) }
      raise "both paths are invalid: #{t}"
    end
  end
end

