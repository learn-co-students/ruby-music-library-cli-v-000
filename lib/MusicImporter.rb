require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    #loads mp3 files in the path directory
    files = []
    Dir["#{@path}/*.mp3"].each do |file|
      unless files.include?(file)
        files << File.basename(file)
      end
    end
    @files = files
  end

  def import
    #imports files by creating songs from a filename
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
