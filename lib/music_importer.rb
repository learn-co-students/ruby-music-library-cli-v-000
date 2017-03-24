require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path)-['.','..'] #refactored from below, it ignores . and ..

  # files = Dir.glob("#{@path}/*")
  # files.map {|file| file.sub("./spec/fixtures/mp3s/", "")}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
