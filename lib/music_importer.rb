class MusicImporter

  attr_reader :path

    def initialize(path)
      @path = path
    end


    #loads all the MP3 files in the path directory and normalizes name without the path
    #normalizes the filename to just the MP3 filename with no path
    def files
      Dir.entries(@path).map do |entry|
      entry unless entry.length < 3#gets rid of files like /.. and other hidden ones
    end.compact #you have to use compact to get rid of nil values which are returned for condition above. Find out why the values are returned as nil?
    end

    #imports all of the files from the library, instantiating a new Song object for each file.
    #the function to seperate the file name into attributes is new_from_filename/create_from_filename method from the Song class
    #For Song.create_from_filename - you need to tell it Song or it will not know where to get this method from
    def import
      files.each { |filo| Song.create_from_filename(filo) }
    end


end
