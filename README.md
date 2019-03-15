acting some common functionality out of those models and into a module, `Concerns::Findable`, which you'll then mix back into the models. You'll then build a collaborating object, `MusicImporter`, that can parse a directory of MP3 files and use the extracted filenames to create instances of `Song`, `Artist`, and `Genre` objects. Finally, you'll build a CLI in `bin/musiclibrary` that is powered by a `MusicLibraryController` to provide a simple CLI that lets a user browse the library of MP3s imported by song, artist, and genre.

This is a complex lab with many parts, so go slowly. Take time to understand what you're building holistically before starting. Read this entire README before jumping in. As you go from spec to spec, we recommend doing them in numbered order.

## Instructions

## `Song`, `Artist`, and `Genre` basics
The first thing to do is get the basics of the main models working. Each model has almost the exact same basic requirements, so once you make `001_song_basics_spec.rb` pass by building the `Song` class, the basic `Artist` and `Genre` specs will go quickly.

The requirements for each model are that they can accept a `name` upon initialization and set that property correctly. The `name` property should be readable and writable by the object.

```ruby
Song.new("Blank Space").name #=> "Blank Space"`
```

Additionally, *each* class should contain a class variable `@@all` that is set to an empty array and is prepared to store all saved instances of the class. This class variable should be accessible via the class method `.all`.

```ruby
Song.all #=> []

Artist.all #=> []
```

Instances should respond to a `#save` method that adds the instance itself into the appropriate `@@all` class variable.

```ruby
Song.new("Blank Space").save
Song.all #=> [#<Song: @name="Blank Space">]
```

The class should be able to empty its `@@all` array via a class method `.destroy_all`.

```ruby
Song.new("Kaohsiung Christmas").save
Song.all #=> [#<Song: @name="Blank Space">, #<Song: @name="Kaohsiung Christmas">]
Song.destroy_all
Song.all #=> []
```

Finally, all classes should implement a custom constructor `.create` that instantiates an instance using `.new` but also invokes `#save` on that instance, forcing it to persist immediately.

```ruby
Song.new("Blank Space")
Song.all #=> []
Song.create("Blank Space")
Song.all #=> [#<Song: @name="Blank Space">]
```

## Relationships

### `Song`s and `Artist`s
 * Songs belong to an artist and an artist has many songs. Adding a song to an artist is done by calling an `#add_song` method on an instance of the `Artist` class.
 * Songs can be initialized with an optional `artist` argument.

### `Song`s and `Genre`s
  * Genres have many songs and are initialized with an empty list of songs.
  * Songs have one genre.
  * Songs can be initialized with an optional `genre` argument.

### `Artist`s and `Genre`s
  * Artists have many genres through their songs. Implement a `#genres` method for this association.
  * Genres have many artists through their songs. Implement an `#artists` method for this association.

***Note:*** there are a few tests concerned with switching the `Song#initialize` method from setting instance variables for `@artist` and `@genre` to using the custom setter methods that you define (e.g., `Song#genre=`). We want to use the custom setter methods because they keep our associations in sync. For example, when we call our custom `Song#artist=` method, it sets the song's `@artist` property _and_ adds the song to the artist's collection of songs. When you reach these tests, make sure those setter methods are only invoked _if_ `Song#initialize` is called with artist and/or genre arguments. Otherwise, the `@artist` and/or `@genre` properties will be initialized as `nil`, and you'll have some unexpected consequences in both your code and the test suite.
  * If we call `Song.new("Song Title", artist_object, genre_object)`, both `Song#artist=` and `Song#genre=` should be invoked.
  * If we call `Song.new("This Song Has No Artist or Genre")`, neither `Song#artist=` nor `Song#genre=` should be invoked.

## Finding

### Song
First implement the following two methods in your `Song` class:
  * Songs should have a `find_by_name` method.
  * Songs should have a `find_or_create_by_name` method.

### `Concerns::Findable`
Now that you've gotten the methods working in `Song`, let's adapt them for general reuse by putting them into a module that we can mix into our `Artist` and `Genre` classes. It's Ruby convention to put modules in a `concerns/` folder nested under `lib/`, and each module should be namespaced like this:
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
Congrats! You've done the heavy lifting. Now let's wrap it all up in a simple CLI so that users can actually interact with our code. Create a `MusicLibraryController` class that:
  * Upon initialization, accepts an optional path to the library of MP3 files, defaulting to `./db/mp3s/`. It should then instantiate a `MusicImporter` object, which it will use to import songs from the specified library.
  * Has a `#call` method that starts the CLI and prompts the user for input. Read the tests carefully for specifics.

Have fun!

## Resources
* [QA with Students](https://www.youtube.com/watch?v=kgYP9Yj8OE4&feature=youtu.be)
  - This Q&A led by Avi Flombaum covers setting up a bin file, setting up a `Gemfile` and installing gems, and identifying objects and their responsibilities. It contains general tips on requirements, gems, and design.
* [Debugging an Error in Music Library CLI](https://www.youtube.com/watch?v=J_BSGPW37AE)
  - This walk-through traces an error to its source in the code. In addition it covers how to change file permissions and how to create an executable file to initialize a sandbox environment.
* [Lab Review](https://www.youtube.com/watch?v=iClea2crypU)

<p class='util--hide'>View <a href='https://learn.co/lessons/ruby-music-library-cli'>Music Library CLI</a> on Learn.co and start learning to code for free.</p>
