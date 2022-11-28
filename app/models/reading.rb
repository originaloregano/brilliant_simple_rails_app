#!/usr/bin/ruby
require_relative 'interface'

File.open(ARGV[0]).each do |line|
  interface = Interface.new(line)
  interface.process_input
end
