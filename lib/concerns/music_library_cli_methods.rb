module CLI_Methods

  def list_songs
    Song.all.sort_by(&:name).each {|song| puts song.name}
  end

  def list_artists
    Artist.all.sort_by(&:name).each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.sort_by(&:name).each {|genre| puts genre.name}
  end

  def list_artist
    puts "Which artist?"
    artist = gets.strip
    if Artist.find_by_name(artist)
      Artist.find_by_name(artist).songs.sort_by(&:name).each {|song| puts song.name}
    else
      puts "Artist is not in the music library."
    end
  end

  def list_genre
    puts "Which genre?"
    genre = gets.strip
    if Genre.find_by_name(genre)
      Genre.find_by_name(genre).songs.sort_by(&:name).each {|song| puts song.name}
    else
      puts "Genre is not in the music library."
    end
  end

end
