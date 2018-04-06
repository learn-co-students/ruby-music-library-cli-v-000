require_relative '../config/environment'

class MusicImporter

  extend Concerns::Findable

  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|song| song.gsub("#{path}/","")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
