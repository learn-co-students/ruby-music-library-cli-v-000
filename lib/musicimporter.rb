require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @path=Dir["./spec/fixtures/mp3s/*mp3"]
    @norm = @path.collect{|x| x.split(/\s-\s|\.|\//)} 
    @norm.collect do |file_array|
      file_array[5]<<" - "<<file_array[6]<<" - "<<file_array[7]<<"."<<file_array[8]
    end
  end

  def import
     files.each do |filename|
      Song.all << Song.new_from_filename(filename)
    end
    Song.all.uniq!
  end

end