require 'pry'
class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    #returns all file names
    files = Dir.entries(path)
    files.delete_if { |item| !item.end_with?('.mp3') } 
  end

  def import
    files.each{|file_name| Song.create_from_filename(file_name)}
  end

end