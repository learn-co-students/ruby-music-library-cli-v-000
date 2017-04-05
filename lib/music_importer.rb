class MusicImporter
  attr_accessor :path
  def initialize(test_music_path)
    @path = test_music_path
  end

  def files
    Dir[@path+"/*"].collect{|x| x.split(@path+"/").join}
    # binding.pry
  end

  def import
    files.each{|song_files| Song.create_from_filename(song_files)}
  end
end
