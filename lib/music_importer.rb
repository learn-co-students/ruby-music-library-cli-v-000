require 'pry'

class MusicImporter
  attr_reader :path


  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each {|song| Song.create_from_filename(song)}
  end

end
