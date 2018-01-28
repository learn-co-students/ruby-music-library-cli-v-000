require_relative "../config/environment.rb"

class MusicImporter

  attr_accessor :path, :song

  def initialize(file_path)
    @files = []
    @path = file_path
    files
  end

  def files
    #binding.pry
    Dir.entries(@path).each do |file|
      if file.include?(".mp3") && !@files.include?(file)
        @files << file
      end
    end
    @files
  end

  def import
    #binding.pry
    @files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end
