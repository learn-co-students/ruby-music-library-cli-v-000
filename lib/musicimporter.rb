require_relative 'artist.rb'
require_relative 'song.rb'
require_relative 'genre.rb'

class MusicImporter
  attr_accessor :path

  def initialize(file)
    @path = file
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.collect {|file| File.basename file}
  end

  def import(list_of_filenames)
    list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
  end

end
