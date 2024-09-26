require_relative './song.rb'

class MusicImporter

  attr_accessor :path, :name

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{@path}/*.mp3").map{ |file| file.gsub("#{path}/", "")}
  end


#.import imports all of the files from the library, instantiating a new Song object for each file
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
