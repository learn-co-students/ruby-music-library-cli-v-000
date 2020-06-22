# can parse a directory of MP3 files and use the extracted filenames to create instances of Song, Artist, and Genre objects

require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect {|fi| fi.gsub("#{path}/", "") } #replaces path with blank
  end

  def import
    files.each do |f| Song.create_from_filename(f)
    end
  end

end
