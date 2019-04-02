require 'pry'
class MusicImporter
extend Concerns::Findable

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    
   @files ||= Dir.glob("#{path}/*.mp3*").collect{ |f| f.gsub("#{path}/", "")}
   # from music_importer.rb:    @files = Dir.glob("#{path}/*.mp3").collect{ |f|  f.gsub("#{path}/", "") }
  end

  def import
    files.each{ |f| Song.create_from_filename(f)}
  end

end
