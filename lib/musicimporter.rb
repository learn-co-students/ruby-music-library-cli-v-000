require 'pry'
require_relative './song.rb'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select { |file| file.end_with?(".mp3") }
  end

  def import
    files.each { |file_name| Song.create_from_filename(file_name) }
  end
end