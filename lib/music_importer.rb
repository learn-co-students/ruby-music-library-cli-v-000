require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #files = Dir.glob(File.join(@path, "*"))
    files = Dir.entries(@path)
    files = files - [".",".."]

    #file_str = files.join.delete("\n")
    #new_array = file_str.split("./spec/fixtures/mp3s/")
    #new_array.shift
    #new_array
    #binding.pry
  end

  def import
    self.files.each do |file|
      song = Song.create_from_filename(file)
    end
  end

end
