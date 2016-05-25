# Ruby Music Library

## Overview

You're going to be implementing a Music Library domain composed of 3 main models, `Song`, `Artist`, and `Genre` that will relate to each other and collaborate heavily. Additionally, you're going to be extracting some common functionality of those models into a module, `Concerns::Findable` and mixing that module into those classes. You'll then build a collaborating object, `MusicImporter`, that can parse a directory of MP3 files and use the filenames to create instances of `Song`, `Artist`, and `Genre`. Finally, you'll build a CLI in `bin/musiclibrary` that is powered by a `MusicLibraryController` to provide a simple CLI that let's a user browse the library of MP3s imported by song, artist, and genre.

This is a complex lab with many parts, go slow, try to understand what you're trying to build holistically before starting. Read this entire README before jumping in. As you go from spec to spec, we recommend doing them in numbered order. 

## Concerns

A quick note on the placement of Modules. It's Ruby convention to put all Modules in a `concerns` folder and to be namespaced like this `Concerns::ModuleName`.

## Instructions

## `Song`, `Artist`, and `Genre` Basics

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

## Relationships

### Songs and Artists

 * Songs belong to an Artist and an Artist has many songs. Adding a song to an Artist is done by calling an `#add_song` method on an instance of the `Artist` class
 * Songs can be initialized with an optional `Artist` argument

### Songs and Genres

  * Genres have many songs and are initialized with an empty list of songs
  * Songs have one genre
  * Songs can be initialized with an optional genre

### Artists and Genres

  * `Artist`s have many `Genre`s through `Song`. Implement a `#genres` method for this association.
  * `Genre`s have many `Artists`s through `Song`. Implement a `#artists` method for this association.

## Finding 

### Song
First implement the following two methods in your `Song` class

  * Songs should have a `find_by_name` method.
  * Songs should have a `find_or_create_by_name` method.

Now that you've done that, let's generalize those methods by putting them into a module and then including that module in the `Genre` and `Artist` class.

### Concerns::Findable

  * Implement a generic `#find_by_name` method that uses the `.all` method defined by the class to find by name.
  * Implement a generic `#find_or_create_by_name` method that uses the `.all` method defined by the class.
  * Add this module to your `Genre` and `Artist` class.


## Music Importer

Create a Music Importer class to work with your `Song`, `Genre` and `Artist` objects to import a directory of mp3s. This class will have the following methods:

  * Initialize accepts a file path of mp3 files
  * A `#files` method that will return all of the filenames
  * Add a new method to the `Song` class called `.new_from_filename` that creates a `Song` based on a filename
  * Add a new method to the `Song` class called `.create_from_filename` that creates a `Song` based on a filename and saves it to the `@@all` class variable
  * In your `MusicImporter` class, add an `.import` method that imports all the files from the library and creates the `Song` objects.

## CLI and Music Importer Controller
Congrats! You've done the heavy lifting. Now let's wrap it all up in a CLI so that users can actually interact with our code.

  * Initializes with an optional path to the music, but defaults to `./db/mp3s`. It creates a `MusicImporter` and imports the music.
  * Add a `#call` method that starts the CLI and asks the user for input. Check out the tests for specifics



<a href='https://learn.co/lessons/ruby-music-library-cli' data-visibility='hidden'>View this lesson on Learn.co</a>
