# Ruby Music Library

## Overview

You're going to be implementing a Music Library domain composed of 3 main models, `Song`, `Artist`, and `Genre` that will relate to eachother and collaborate heavily. Additionally, you're going to be extracting some common functionality of those models into a module, `Concerns::Findable` and mixing that module into those classes. You'll then build a collaborating object, `MusicImporter`, that can parse a directory of MP3 files and use the filenames to create instances of `Song`, `Artist`, and `Genre`. Finally, you'll build a CLI in `bin/musiclibrary` that is powered by a `MusicLibraryController` to provide a simple CLI that let's a user browse the library of MP3s imported by song, artist, and genre.

This is a complex lab with many parts, go slow, try to understand what you're trying to build holistically before starting. Read this entire README before jumping in.

## Project Structure

## Instructions

## Part 1: `Song`, `Artist`, and `Genre` Basics

The first thing to do is get the basics of the main models working. Each model has almost the exact same basic requirements, so once you make `001_song_basics_spec.rb` pass by building the `Song` class, the `Artist` and `Genre` basic specs will go fast.

The requirements of each model is that they can accept a name upon initialization and set that property correctly. The `name` property should be readable and writeable by the object.

```ruby
Song.new("Blank Space").name #=> "Blank Space"`
```

Additionally, each class should contain a class variable `@@all` that is set to an empty array and is prepared to store all saved instances. This class variable should be accessible via the class method `.all`.

```ruby
Song.all #=> []
```

Instances should respond to a `#save` method that adds the instance itself into the class variable `@@all`.

```ruby
Song.new("Blank Space").save
Song.all #=> [#<Song: @name="Blank Space">]
```

The class should be able to empty it's `@@all` array via a class method `.destroy_all`.

```ruby
Song.new("Blank Space").save
Song.all #=> [#<Song: @name="Blank Space">]
Song.destroy_all
Song.all #=> []
```

Finally, all classes should implement a custom constructor `.create` that instantiates an instance using `.new` but also evokes `#save` on that instance, forcing it to persist immediately.

```ruby
Song.new("Blank Space")
Song.all #=> []
Song.create("Blank Space")
Song.all #=> [#<Song: @name="Blank Space">]
```

## Part 2: Relationships between Songs, Artists, and Genres

Songs belong to an artist and an artist has many songs. That is the first relationship requirement of this domain model.

## Outline



Songs and Artists
  Artists have many songs
    initializes with a songs propety set to an empty array
    can push a song into the songs collection
  Songs belong to an artist
    #artist=
      accepts an artist for the song
      adds the song to the artist songs
  adding a song to an artist
    #add_song
      adds the song to the artist song collection
      assigns the artist to the song
      does not assign the artist to the song if the song already has the artist
      does not add the song to the songs collection of the artist if the artist already has the song
    Song#artist=
      uses add_song to add the song to the artist collection
  initializing a song with an artist
    songs accept an optional argument for the artist

Songs and Genres
  Genres have many songs
    initializes with a songs propety set to an empty array
    can push a song into the songs collection
  Songs belong to a genre
    #genre=
      accepts an genre for the song
      adds the song to the genre songs
      does not add the song to the genre of songs if it already exists
  initializing a song with a genre
    songs accept an optional argument for the genre

Artists have many genres through songs
  #genres
    returns the unique genres belonging to all the songs of the artist
    returns all unique genres for an artist based on songs with multiple genres
    does not use an instance variable @genres and collects genres from songs everytime

Genres have many artists through songs
  #artists
    returns all unique artists for a genre based on songs with multiple artists
    does not use an instance variable @artists and collects artists from songs everytime

Findable Songs
  .find_by_name
    fins a song instance in @@all by the name property of the song
  .find_or_create_by_name
    finds or creates a song by name maintaining uniqueness of objects by name property

Concerns::Findable
  defines a module Concerns::Findable
  adds a find_by_name class method to classes that are extended by the module
  adds a find_or_create_by_name class method to classes that are extended by the module

Artists and Genres being extended by Concerns::Findable
  Artist
    is extended by the Concerns::Findable module
    .find_by_name
      finds an artist instance in @@all by the name property of the artist
    .find_or_create_by_name
      finds or creates an artist by name maintaining uniqueness of objects by name property
  Genre
    is extended by the Concerns::Findable module
    .find_by_name
      finds a genre instance in @@all by the name property of the genre
    .find_or_create_by_name
      finds or creates a genre by name maintaining uniqueness of objects by name property

MusicImporter
  #intialize
    accepts a file path to parse mp3 files from
  #files
    loads all the mp3 files in the path directory
    normalizes the filename to just the mp3 filename with no path

Making Songs from filenames
  Song.new_from_filename
    initializes a song based on the filename delimiters
    maintains unique objects
  Song.create_from_filename
    initializes and saves a song based on the filename delimiters
    maintains unique objects

MusicImporter#import
  imports the files into the library by creating songs from a filename

MusicLibraryController
  #initialize
    accepts a path to import music from
    the path argument defaults to ./db/mp3s
    creates a MusicImporter with that path and imports the music
    populates Song, Artist, and Genre
  #call
    responds to a call method to start the CLI
Welcome to Your Music Library!
What would you like to do?
    asks the user for input at some point

Music Library CLI
  allows a user to list songs
  allows a user to list artists
  allows a user to list genres
  allows a user to play a song
  allows a user to list an artists songs
  allows a user to list an genres songs
