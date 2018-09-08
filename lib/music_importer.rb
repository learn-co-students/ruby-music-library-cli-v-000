require 'pry'

class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f} #loads all MP3 files in the path directory, but not sub-directories or "." and ".." folders
  end


  def import
    files.each {|file| Song.create_from_filename(file)} #imports songs from a file into the library
  end
end
