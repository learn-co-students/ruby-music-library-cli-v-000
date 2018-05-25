require "pry"
class MusicImporter
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end
  #binding.pry
end
