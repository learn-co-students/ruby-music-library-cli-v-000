class MusicImporter

  attr_accessor :path

  list_of_filenames = []

    def initialize(path)
      @path = path
      #binding.pry
    end

      def files
        Dir.entries(path).select do | file | !File.directory? file
      end

    end

    def import
      files.each{ |filename| Song.create_from_filename(filename) }
    end


  end
