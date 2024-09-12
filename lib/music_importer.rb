require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).delete_if{|i| i.end_with?("mp3") == false}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end


end