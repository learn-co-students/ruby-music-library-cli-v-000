require_relative './music_importer.rb'

class MusicLibraryController
  attr_accessor :call, :files, :songs, :artists, :genres

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    @files = music_importer.files.collect{|file_name| file_name.chomp('.mp3')}
    @files.sort!
    @songs = music_importer.songs
    music_importer.import
    @artists = songs.collect{|song| song.artist.name}.uniq.sort!
    @genres = songs.collect {|song| song.genre.name}.uniq.sort!
  end

  def call
    call = gets.chomp
    while call != "exit"
      
      case call
        
        when "list songs"
          files.each_with_index do |file, index|
            puts "#{index+1}. #{file}"
          end
        when "list artists"
          puts artists
        when "list genres"
          puts genres
        when "play song"
          call = gets.chomp
          if call.to_i>=1 && call.to_i <=songs.length
            puts "Playing #{files[call.to_i-1]}"
          end
        when "list artist"
          call = gets.chomp
          if artists.include?(call)
            files.each do |file|
              data = file.split(' - ')
              artist = data[0].strip
              if artist == call
                puts file
              end
            end
          end
        when "list genre"
          call = gets.chomp
         if genres.include?(call)
            files.each do |file|
              data = file.split(' - ')
              genre = data[2].strip
              if genre == call
                puts file
              end
            end
          end
      
     end #end of case
      call = gets.chomp
   end#end of while
  end

end