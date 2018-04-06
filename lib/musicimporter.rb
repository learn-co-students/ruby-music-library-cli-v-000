require_relative '../config/environment'

class MusicImporter

  extend Concerns::Findable

  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path #sets the path variable
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|song| song.gsub("#{path}/","")} #finds all the files in the path, creates a new array with the path removed from the filenames
  end

  def import
    files.each {|file| Song.create_from_filename(file)} #takes each filename and calls the Song#create_from_filename to create new songs
  end

end
