# can parse a directory of MP3 files and use
# the filenames to create instances of Song, Artist, and Genre.

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.{mp3}").map{ |x| x.gsub("#{path}/", "")}
  end

  def import
    files.each{ |x| Song.new_from_filename(x)}
  end

end
