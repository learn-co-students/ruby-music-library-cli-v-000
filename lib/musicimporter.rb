require 'pry'

class MusicImporter

  attr_accessor :path, :files, :all

  def initialize(path)
    @path = path
    @all = []
  end

  def files
    files = Dir.glob("#{self.path}/*.mp3").collect { |f| f.gsub("#{self.path}/", "")}
  end

  def import
    self.all = files.collect { |f| Song.create_from_filename(f) }
  end

  def self.all
    @all
  end

end #class MusicImporter
