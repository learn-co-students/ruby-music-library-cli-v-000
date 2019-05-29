require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    # accepts a file path to parse MP3 files from
    @path = path
    @path_directory = []
  end

  def files
    # loads all the MP3 files in the path directory
    # normalizes the filename to just the MP3 filename with no path
    # The method uses Dir.foreach to take the given path and take the songs details from it.
    # First two positions of the path array are . and .. so we navigate around them telling the loop to skip
    # It pushes the specific path into the MuiscImporter's @path_directory
    Dir.foreach(path) do |each_path|
      next if each_path == '.' or each_path == '..'
      # do work on real items
      # binding.pry
      @path_directory << each_path
    end
    @path_directory
  end

  def import
    # imports the files into the library by invoking Song.create_from_filename
    # Method takes the files created by the path, iterates through the array, and creates songs
    self.files.each { |song| Song.create_from_filename(song) }
  end
end
