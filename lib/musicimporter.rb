class MusicImporter  
  attr_accessor :path  
    
  @@file_array = []

  def initialize (file_path)
    self.path = file_path
    
  end
  
  def files
    mp3files = File.join(path,"*.mp3")
    Dir.glob(mp3files) do |mp3_file|
      mp3_file = mp3_file.slice((path.length + 1)..mp3_file.length)
      @@file_array << mp3_file
    end
    @@file_array
  end

    def import#(list_of_filenames)
    #list_of_filenames.each{|file_name| songs << Song.new_by_filename(file_name)}
    @@file_array.each do |file_name| 
      new_song = Song.new_by_filename(file_name)
      new_song.artist.songs << new_song
    end
  end

end #of MusicImporter class



