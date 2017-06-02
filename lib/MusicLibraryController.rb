class MusicLibraryController
  def initialize(path="./db/mp3s")
    @musicimport = MusicImporter.new(path)
    @musicimport.import
  end
  def call
    userinput = ""
    while userinput != "exit" do
      puts "User Input:"
      userinput = gets.chomp
      if(userinput == "list songs")
        @musicimport.print_songs
      elsif(userinput == "list artists")
        @musicimport.print_artists
      elsif(userinput == "list genres")
        @musicimport.print_genres
      elsif(userinput == "play song")
        puts "Which track number?"
        @musicimport.play_song(gets.chomp.to_i)
      elsif(userinput == "list artist")
        puts "Which artist?"
        @musicimport.print_artists_songs(gets.chomp)
      elsif(userinput == "list genre")
        puts "Which genre?"
        @musicimport.print_genre_songs(gets.chomp)
      end
    end
  end
end
