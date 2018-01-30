require 'pry'
require_relative './concerns/findable.rb'
class MusicImporter

attr_accessor :path

@@songs = []

  def initialize(path)
    self.path = path
  end

  def files
    file_array = Dir.glob("#{path}/*.mp3")

  #second_array = file_array.collect {|mp3| mp3.gsub(".mp3", "")}
    file_array.collect {|file| file.split("/").last}
  end

  def import
    files.each {|song| @@songs << Song.create_from_filename(song)}
  end











end
