require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    file_names = []
       file_names_correct = []
      #Dir.entries(path).reject{|entry| entry == "." || entry == ".."}
       file_names = Dir.glob("#{path}/*.mp3")
         file_names.each do |song|
           #song.gsub!(/\.\W\w+\W\w+\W\w+\W/, "")
           song.gsub!("#{path}/", "")
           #binding.pry
           file_names_correct << song
         end
       file_names_correct
  end

  def import

    files.each do |file|
      Song.create_from_filename(file)
    end
  end


end
