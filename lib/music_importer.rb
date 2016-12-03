require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
   @path = path
  end

  def files
    @x = Dir.entries(@path).reject {|i| i == ".." }
  .collect.reject { |a| a == "." }
=begin
   ["Action Bronson - Larry Csonka - indie.mp3",
 "Real Estate - Green Aisles - country.mp3",
 "Real Estate - It's Real - hip-hop.mp3",
 "Thundercat - For Love I Come - dance.mp3"]
=end
  end



  def import
    files.each {|x| Song.create_from_filename(x)}
  end

end
