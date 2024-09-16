class CLIMethods
  def initialize(path="./db/mp3s")
    @path = path
    new_music_importer = MusicImporter.new(path)
    new_music_importer.import
  end

  def list_songs
    songs.each_with_index(1) do |song, idx|
      puts "#{idx}. song"
    end 
  end
end
