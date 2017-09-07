require 'pry'
class MusicImporter

  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).delete_if { |song| !song.include?("mp3")}
    # binding.pry
  end

  def import
     files.each do |x|
      #  binding.pry
       Song.create_from_filename(x)
     end

    end

end
