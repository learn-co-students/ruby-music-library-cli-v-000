require_relative 'song.rb'
class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do |file| file.gsub("#{path}/", "") end
  end

  def import
    files.each do |f| Song.create_from_filename(f)
    end
  end


end