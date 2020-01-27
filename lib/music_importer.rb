require 'pry'
class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    file_array = []
    files = Dir.open(@path)
    files.each do |file|
      if file.include?(".mp3")
        file_array << file
      end
    end
    file_array
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end