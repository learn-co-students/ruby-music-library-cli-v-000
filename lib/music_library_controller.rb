class MusicLibraryController

  def initialize(path = "./db/mp3s" ) #it "the 'path' argument defaults to './db/mp3s'" do
    MusicImporter.new(path).import #"invokes the #import method on the created MusicImporter object" do
  end

  def call

  end

end
