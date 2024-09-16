require "pry"

class MusicImporter
  attr_reader :path

  def initialize(file_path)
    @path=file_path
  end

  def files
    list = Dir.entries(path)
    list = list.collect {|file| file if file.include?(".mp3")}
    list = list.delete_if {|file| file==nil}
  end

  def import
    files.each do |file|
    Song.create_from_filename(file)
    end
  end

end
