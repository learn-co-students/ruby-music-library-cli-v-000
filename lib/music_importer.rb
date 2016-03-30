require_relative 'song.rb'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    dir = Dir.new(@path)
    dir.each{|file| @files << file if file.include?('.mp3')}
  end

  def import
    @files.each{|file| Song.create_from_filename(file)}
  end

end