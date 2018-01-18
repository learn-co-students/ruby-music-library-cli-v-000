require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    filenames = Dir.entries(@path)
    to_split = []
    filenames.each do |file_name|
      if file_name.include?(" - ")
        to_split << file_name
      end
    end
    @files = to_split
    @files
  end

  def import
    file_array = self.files
    file_array.each do |fn|
      song = Song.create_from_filename(fn)
    end
  end
end
