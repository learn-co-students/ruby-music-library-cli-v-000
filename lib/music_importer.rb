require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/", "")
    end
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end


end
