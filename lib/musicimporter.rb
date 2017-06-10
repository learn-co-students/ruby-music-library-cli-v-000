require 'pry'


class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    #@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    @files ||= Dir.entries(path).select{|file| file.end_with?(".mp3")}.sort!
  end

  def import

    files.each{|f| Song.create_from_filename(f)}
  end


end
