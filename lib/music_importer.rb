require 'pry'
class MusicImporter
  attr_accessor :path, :files


  def initialize(path)
    @path=path
  end

  def files
    file_list=Dir[@path+"/*.mp3"]

    #!!! Goofed this up before, removing the path was hard-coded so an arbitrary or different path messed it all up!
    res=file_list.collect {|file_name| file_name.split("#{@path}/")[1]}
    res
  end

  def import
    song_files=self.files
    song_files.each do |filename|
      #binding.pry
      Song.create_from_filename(filename)
    end
  end



end
