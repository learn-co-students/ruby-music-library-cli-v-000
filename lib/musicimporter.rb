class MusicImporter  
  attr_accessor :path  
    
  @@file_array = []

  def initialize (file_path)
    binding.pry
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

  def import
    array_of_filenames = files.uniq
    array_of_filenames.each do |file_name| 
      new_song = Song.create_from_filename(file_name)
      
    end

  end
  
end #of MusicImporter class



