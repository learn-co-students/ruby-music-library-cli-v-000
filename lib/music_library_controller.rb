class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path =  path
    MusicImporter.new(path).import
  end


  def call

    while true

      choice = gets

      case choice.strip
        when 'list songs'
          list = Song.all
          list.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
          end

        when 'list artists'
          list = Artist.all
          list.each do |artist|
            puts "#{artist.name}"
          end

        when 'list genres'
          list = Genre.all
          list.each do |genre|
            puts "#{genre.name}"
          end

        when 'play song'
          number = gets
          list = Song.all
          new_index = number.to_i - ( 1)
          song = list[new_index]

          puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"


        when 'list artist'
          list = Artist.all
          searched_artists = gets.strip
          artist= list.find do |song|
             song.name == searched_artists
           end

          artist.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end

        when 'list genre'
          genre = Genre.find_by_name(gets.strip)

          genre.songs.each do |song|
            puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
          end


        when 'exit'
          return
        end
      end
  end

end
