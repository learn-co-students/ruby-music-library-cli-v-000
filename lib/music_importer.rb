require "pry"

class MusicImporter

  attr_accessor :path

  def initialize (path)
    @path = path
  end

   def files
    Dir.glob("#{path}/*.mp3").collect {|file_name| file_name.split("/").last}
  end

  def import
    self.files.each {|s| Song.create_from_filename(s)}
  end

end
