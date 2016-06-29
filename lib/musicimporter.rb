require 'pry'
class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    whole_path = path + "/*.mp3"
    @path = path
    @files_with_paths = Dir[whole_path]
    @files = @files_with_paths.collect do |file|
      file.split("/").last
    end
  end

  def import
    @files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
