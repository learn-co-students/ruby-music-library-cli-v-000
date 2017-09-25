require 'pry'

module CLIMethods
  def list_songs
    sort_by(Song.all).each_with_index do |s, i|
      puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    sort_by(Artist.all).each_with_index { |a, i| puts "#{i + 1}. #{a.name}" }
  end

  def list_genres
    sort_by(Genre.all).each_with_index { |g, i| puts "#{i + 1}. #{g.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    if artist = Artist.find_by_name(gets.chomp)
      sort_by(artist.songs).each_with_index do |s, i|
        puts "#{i + 1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    if genre = Genre.find_by_name(gets.chomp)
      sort_by(genre.songs).each_with_index do |s, i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    i = gets.chomp.to_i - 1
    song = Song.all.sort { |x, y| x.name <=> y.name }[i] if i.between?(1, Song.all.size)
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

  def sort_by(items)
    items.sort { |x, y| x.name <=> y.name }
  end
end
