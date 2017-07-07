require 'pry'
class MusicImporter
  attr_accessor :path, :files

# Action Bronson - Larry Csonka - indie.mp3

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries("#{@path}").delete_if {|file| file == "." || file == ".."}
  end

  def import
    self.files.each { |file_name| Song.create_from_filename(file_name) }
  end


end
