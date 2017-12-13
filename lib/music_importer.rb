require 'pry'

class MusicImporter
  attr_accessor :files
  attr_reader :path
  @@all = []

  def initialize(path)
    @path = path
    @@all << path
  end

  def files
    files = Dir.glob("#{path}/*.mp3")
    @files ||= files.collect do |file|
      file.gsub("#{path}/", "")
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
