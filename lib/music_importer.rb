require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(file)
    @path = file
  end

  def files
    mp3_files = []
    files_arr = Dir.glob("#{@path}/*.mp3")
    files_arr.each do |long_file|
      mp3_files << long_file.split("/").last
    end
    #binding.pry
    mp3_files.sort

  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end

  end

end
