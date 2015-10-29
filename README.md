# Ruby Music Library

## Outline

songs belong to genre and artist
artist has many songs
artists has many genres through songs
genres has many songs
genres has many artists through songs

Song.new(name, *artist, *genre) x
Song.create(name, *artist, *genre) x
Song.new_from_file_name
Song.create_from_file_name
Song.all x
Song.find_by_name x
Song.find_or_create_by_name x
Song.destroy_all x

song.save x
song.artist = x
song.genre = x
song.to_s

Artist.new(name) x
Artist.create(name) x
Artist.all x
Artist.find_by_name x
Artist.find_or_create_by_name x
Artist.destroy_all x

artist.save x
artist.to_s x
artist.songs x
artists.songs << x
artist.add_song x
artists.genres x

Genre.new(name) x
Genre.create(name) x
Genre.all x
Genre.find_by_name x
Genre.find_or_create_by_name x
Genre.destroy_all x

genre.save x
genre.to_s
genre.songs x
genre.artists x

Findable Module

MusicImporter

MusicLibraryController.new.call for CLI
