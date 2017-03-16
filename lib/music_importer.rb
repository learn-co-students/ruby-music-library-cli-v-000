# require 'pry'
# require_relative './artist.rb'
# require_relative './genre.rb'
# require_relative './song.rb'
# require_relative './concerns/findable.rb'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files # let's not assign this to a variable, and instead run it inside "new from filenames"
    Dir["./#{path}/*.mp3"].collect {|file| file.split("/")[-1]}
  end

  def import
    # binding.pry
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

  # def import_with_array(array)
  #   # binding.pry
  #   array.each do |file|
  #     Song.create_from_filename(file)
  #   end
  # end


end

# crayon = MusicImporter.new("mp3lib")
#
# crayon.import_with_array(["hat - third - whatev.mp3", "hi - chin - lol.mp3", "kiss - ola - wzl.mp3", "lol - mop - okay.mp3", "micah - ji - krim.mp3"])
