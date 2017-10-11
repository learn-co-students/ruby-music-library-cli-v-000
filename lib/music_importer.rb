require 'pry'
class MusicImporter
    extend Concerns::Findable
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
  end

  def files
   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.collect do |filename|
      Song.create_from_filename(filename)

    end
  end

end
