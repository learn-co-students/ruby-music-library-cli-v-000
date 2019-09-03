require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).select{|mp3| mp3.end_with?("mp3")}
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

end
