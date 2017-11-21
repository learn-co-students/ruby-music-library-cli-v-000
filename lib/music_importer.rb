require "pry"

class MusicImporter

  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    file_list = Dir[path + "/*.mp3"]
    cleaned_file_list = file_list.collect {|filename| filename.gsub(path + "/", "")}
    cleaned_file_list
    #binding.pry
  end

  def import
    @library = self.files.collect {|filename| Song.create_from_filename(filename)}
  end
end
