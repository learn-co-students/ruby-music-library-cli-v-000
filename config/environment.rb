require 'bundler'
Bundler.require



require_all 'lib'

require 'pry'

MusicLibraryController.new.call
