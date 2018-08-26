class MusicImporter
  path = Pathname('./db/mp3s')

  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir.entries(path).collect {|file| file if file.include?(".mp3")}.compact!
  end

  def import
    files.each do |file| 
      Song.create_from_filename(file)
    end
  end
  
end


# def self.new_from_filename(filename)
#     filename_arr = filename.split(/\s*[.-]\s*/)
#     filename_arr.delete('mp3')
#     name = filename_arr[1]
#     artist_name = filename_arr[0]
#     song = self.new
#     song.name = name
#     song.artist_name = artist_name
#     return song
#   end

#   def self.create_from_filename(filename)
#     @@all << new_from_filename(filename)
#   end