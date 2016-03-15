require 'pry'

class MusicImporter

attr_accessor :path

  def initialize (path)
    @path = path
  end

  def files
    files = Dir.entries(@path).delete_if {|file| file.end_with?(".")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end