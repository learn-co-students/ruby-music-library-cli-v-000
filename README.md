# Ruby Music Library

## Overview
This is an implementing a Music Library domain composed of 3 main models, `Song`, `Artist`, and `Genre`.
 The models relate to each other and collaborate heavily relying on eachother to access information as needed. 
 
 Additionally, it extract some common functionality out of those models and into a module, `Concerns::Findable`, which  is mixed back into the models. 
 
 Also, a `MusicImporter`object was built, that can parse a directory of MP3 files and use the extracted filenames to create instances of `Song`, `Artist`, and `Genre` objects. 
 
 Finally, built a  CLI in `bin/musiclibrary` that is powered by a `MusicLibraryController` to provide a simple CLI that lets a user browse the library of MP3s imported by song, artist, and genre.

.. Isert IPOD MP# player

## Relationships Between Models

### `Song`s and `Artist`s
 * Songs belong to an artist and an artist has many songs. Adding a song to an artist is done by calling an `#add_song` method on an instance of the `Artist` class.
 * Songs was initialized with an optional `artist` argument.

### `Song`s and `Genre`s
  * Genres have many songs and are initialized with an empty list of songs.
  * Songs have one genre.
  * Songs was initialized with an optional `genre` argument.

### `Artist`s and `Genre`s
  * Artists have many genres through their songs. Implemented a `#genres` method for this association.
  * Genres have many artists through their songs. Implemented an `#artists` method for this association.

***Note:*** 

few test were used for  tests concerned with switching the `Song#initialize` method from setting instance variables for `@artist` and `@genre` to using the custom setter methods that was defined (e.g., `Song#genre=`).

Used a custom setter methods because they keep our associations in sync. For example, when we call our custom `Song#artist=` method, it sets the song's `@artist` property _and_ adds the song to the artist's collection of songs.

 When I reached these tests, I made sure those setter methods are only invoked _if_ `Song#initialize` is called with artist and/or genre arguments. Otherwise, the `@artist` and/or `@genre` properties will be initialized as `nil`, leading to  some unexpected consequences in both  code and the test suite.
  
  * If we call `Song.new("Song Title", artist_object, genre_object)`, both `Song#artist=` and `Song#genre=` should be invoked.

  * If we call `Song.new("This Song Has No Artist or Genre")`, neither `Song#artist=` nor `Song#genre=` should be invoked.

## Finding

### Song
First implemented the following two methods in your `Song` class:
  * Songs should have a `find_by_name` method.
  * Songs should have a `find_or_create_by_name` method.

### `Concerns::Findable`
Once  `Song` method is working, I adapted them for general reuse by putting them into a module that we can mix into our `Artist` and `Genre` classes.
 It's Ruby convention to put modules in a `concerns/` folder nested under `lib/`, and each module should be namespaced like this:
```ruby
module Concerns::ModuleName
  # Module code here
end
```
Once the basic module structure is good to go, it's time to code our two class methods again:
  * Implement a generic `#find_by_name` method that uses the `.all` method defined by the class to find an instance of the class by name.
  * Implement a generic `#find_or_create_by_name` method that uses the `.all` method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
  * Add this module to your `Genre` and `Artist` class.

## `MusicImporter`
Create a `MusicImporter` class that works with your `Song`, `Genre`, and `Artist` objects to import a directory of MP3 files. This class will have the following methods:
  * `#initialize` accepts a file path to a directory of MP3 files.
  * `#files` returns all of the imported filenames.
  * `.import` imports all of the files from the library, instantiating a new `Song` object for each file.

In addition, add the following pair of methods to your `Song` class:
  * `.new_from_filename`, which instantiates a new `Song` object based on a provided filename.
  * `.create_from_filename`, which does the same thing as `.new_from_filename` but also saves the newly-created song to the `@@all` class variable.

## It's CLI time!
Congrats! You've done the heavy lifting. Now let's wrap it all up in a simple CLI so that users can actually interact with our code.
  * Upon initialization, the CLI should accept an optional path to the library of MP3 files, defaulting to `./db/mp3s/`. It should then instantiate a `MusicImporter` object, which it will use to import songs from the specified library.
  * Add a `#call` method that starts the CLI and prompts the user for input. Read the tests carefully for specifics.

Have fun!

## Resources
* [QA with Students](https://www.youtube.com/watch?v=kgYP9Yj8OE4&feature=youtu.be)
  - This Q&A led by Avi Flombaum covers setting up a bin file, setting up a `Gemfile` and installing gems, and identifying objects and their responsibilities. It contains general tips on requirements, gems, and design.
* [Debugging an Error in Music Library CLI](https://www.youtube.com/watch?v=J_BSGPW37AE)
  - This walk-through traces an error to its source in the code. In addition it covers how to change file permissions and how to create an executable file to initialize a sandbox environment.
* [Lab Review](https://www.youtube.com/watch?v=iClea2crypU)

<p class='util--hide'>View <a href='https://learn.co/lessons/ruby-music-library-cli'>Music Library CLI</a> on Learn.co and start learning to code for free.</p>
