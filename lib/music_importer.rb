class MusicImporter

  attr_accessor :path #, :song

  def initialize(path)
    @path=path
    #@song=song
    @files_list = []
  end

  def files
    song_list = Dir.glob("#{path}/*.mp3")
    #binding.pry
    song_list.each do |song|
      splitter = []
      splitter = song.split("/")
      song = splitter.last
      @files_list << song
      #binding.pry
    end
    @files_list
    #binding.pry
  end

  def import
    #list = self.files
    #binding.pry
    list = []
    list = files.each {|song| Song.create_from_filename(song) } #if song.match(".mp3")

    #binding.pry
    #@files_list
  end


end
