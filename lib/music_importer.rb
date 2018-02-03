require 'pry'

class MusicImporter
  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3")
    @files.collect do |file|
      file.slice!("#{@path}/")
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
