require 'pry'

class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call

    input = []
    ans = ''
    while ans != 'exit' do
      ans = gets
      input << ans
    end

    if input[0] == 'list songs'
      Song.all.sort_by! {|song| song.artist.name}
      count = 1
      Song.all.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        count +=1
      end

    elsif input[0] == 'play song'
      index = input[1].to_i
      song = Song.all[index-1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"

    elsif input[0] == 'list artists'
      Artist.all.each{|artist| puts artist.name}

    elsif input[0] == 'list artist'
      artist = Artist.find_by_name(input[1])
      artist.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

    elsif input[0] == 'list genres'
      Genre.all.each{|genre| puts genre.name}

    elsif input[0] == 'list genre'
      genre = Genre.find_by_name(input[1])
      genre.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

  end

end
