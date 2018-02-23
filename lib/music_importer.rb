require 'pry'

class MusicImporter
  attr_accessor :path, :song_name, :artist_name, :genre_name, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.entries(@path).delete_if{|file| file.length < 3}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
