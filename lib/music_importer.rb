#####initialize
#accepts a file path to parse mp3 files from
#####files
#loads all the mp3 files in the path directory
#normalizes the filename to just the mp3 filename with no path

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select { |entry| entry.include?('mp3') }
  end

#####import
#imports the files into the library by creating songs from a filename
  def import
    self.files.each { |file| Song.new_from_filename(file) }
  end
end
