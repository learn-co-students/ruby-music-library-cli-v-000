require "pry"

require_relative "../config/environment.rb"

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}
  end

end
