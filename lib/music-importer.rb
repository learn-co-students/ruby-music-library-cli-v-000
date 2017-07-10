require 'pry'

class MusicImporter
  attr_accessor :files
  attr_reader :path

  def initialize(filepath)
    @path = filepath
    @files = Dir["#{self.path}/*"].each do |filename|
      filename.slice! /\.\/.+\mp3s\//
    end
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
