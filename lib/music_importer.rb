require_relative './song.rb'

class MusicImporter
  attr_accessor :path, :files, :songs

  def initialize(file_path)
    @path = file_path
    @songs = []
  end

  def files
    @files = Dir.entries("#{@path}").select{|file_name| file_name[/.+mp3\z/]}
  end

  def import
    self.files.each{|file| self.songs << Song.create_from_filename(file)}
  end
end