require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path= path
  end

  def files
   d = Dir.entries(@path)
   d.delete('..') && d.delete('.')
   d
  end
  
  def import
    song_files = files
    song_files.each {|file| Song.create_from_filename(file)}
  end
   
end