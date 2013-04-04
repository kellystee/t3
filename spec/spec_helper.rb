$:.unshift File.expand_path('../lib', __FILE__)

begin
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end

rescue LoadError
  puts 'Coverage disabled, enable by installing simplecov'
end

require 'console/io'
require 'console/prompter'
require 'console/console'
require 't3/player/easy_ai'
require 't3/player/human'
require 't3/player/minimax'
require 't3/board'
require 't3/configurations'
require 't3/game'
require 't3/game_rules'
require 't3/game_runner'
require 't3/validations'
