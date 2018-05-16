require "pry"
require_relative './music_importer.rb'

class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    MusicImporter.new('./db/mp3s')
    @path = path
  end

  def call
    puts "Welcome to your music library!"

  end
end
