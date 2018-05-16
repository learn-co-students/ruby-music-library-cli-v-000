require "pry"
require_relative './music_importer.rb'

class MusicLibraryController < MusicImporter
  attr_accessor :path

  def initialize(path='hi')
    @path = path
  end

  def call
    puts "Welcome to your music library!"

  end
end
