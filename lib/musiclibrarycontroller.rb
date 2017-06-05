class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import

  end

  def call
    #get user input
    #loop until exit

    #user can list songs
    #user can list artists
    #user can list genres
    #user can play songs
    #user can list songs by artist
    #user can list songs by genre
  end
end
