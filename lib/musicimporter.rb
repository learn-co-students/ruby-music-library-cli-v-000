require 'pry'
require_relative 'artist.rb'
require_relative 'song.rb'
require_relative 'genre.rb'

class MusicImporter
  attr_accessor :path, :files

  def initialize(file)
    @path = file
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.collect {|file| File.basename file}
  end

  def import
    files.each{ |filename|
      Song.create_from_filename(filename)
    }
  end

end
