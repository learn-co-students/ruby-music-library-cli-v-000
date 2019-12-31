require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/","")}
  end

  def import
    self.files.map { |f| Song.create_from_filename(f) }
  end
end
