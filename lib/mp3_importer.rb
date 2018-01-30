require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end

#["Action Bronson - Larry Csonka - indie.mp3", "Real Estate - Green Aisles - country.mp3", "Real Estate - It's Real - hip-hop.mp3", "Thundercat - For Love I Come - dance.mp3"]
