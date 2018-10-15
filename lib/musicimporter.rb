require "pry"
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
   @files ||= Dir.glob("#{@path}/*.mp3").collect do |file|
     file.gsub("#{@path}/", "")
   end
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end
