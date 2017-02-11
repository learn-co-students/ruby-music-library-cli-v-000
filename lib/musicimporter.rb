require_relative '../config/environment.rb'
require 'pry'

class MusicImporter

  attr_accessor :path, :files

  def initialize(test_music_path)
    @path = test_music_path
    @files = Dir.entries(test_music_path).sort - [".",".."]
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
