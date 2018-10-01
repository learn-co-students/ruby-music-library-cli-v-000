require "spec_helper"

describe "MusicImporter" do
  let(:music_importer) { MusicImporter.new("./spec/fixtures/mp3s") }

  describe "#initialize" do
    it "accepts a file path to parse MP3 files from" do
      expect(music_importer.instance_variable_defined?(:@path)).to be(true)
      expect(music_importer.instance_variable_get(:@path)).to eq("./spec/fixtures/mp3s")
    end
  end

  describe "#path" do
    it "retrieves the path provided to the MusicImporter object" do
      expect(music_importer.path).to eq("./spec/fixtures/mp3s")
    end
  end

  describe "#files" do
    it "loads all the MP3 files in the path directory" do
      expect(music_importer.files.size).to eq(5)
    end

    it "normalizes the filename to just the MP3 filename with no path" do
      expect(music_importer.files).to include("Action Bronson - Larry Csonka - indie.mp3")
      expect(music_importer.files).to include("Real Estate - Green Aisles - country.mp3")
      expect(music_importer.files).to include("Real Estate - It's Real - hip-hop.mp3")
      expect(music_importer.files).to include("Thundercat - For Love I Come - dance.mp3")
    end
  end
end

describe "Song" do
  describe ".new_from_filename" do
    it "initializes a song based on the passed-in filename" do
      song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

      expect(song.name).to eq("For Love I Come")
      expect(song.artist.name).to eq("Thundercat")
      expect(song.genre.name).to eq("dance")
    end

    it "invokes the appropriate Findable methods so as to avoid duplicating objects" do
      artist = Artist.create("Thundercat")
      genre = Genre.create("dance")

      expect(Artist).to receive(:find_or_create_by_name).and_return(artist)
      expect(Genre).to receive(:find_or_create_by_name).and_return(genre)

      song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

      expect(song.artist).to be(artist)
      expect(song.genre).to be(genre)
    end
  end

  describe ".create_from_filename" do
    it "initializes and saves a song based on the passed-in filename" do
      song = Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")

      expect(Song.all.last.genre.name).to eq("dance")
    end

    it "invokes .new_from_filename instead of re-coding the same functionality" do
      expect(Song).to receive(:new_from_filename).and_return(double(save: true))

      Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")
    end
  end
end

describe "MusicImporter" do
  describe "#import" do
    let(:music_importer) { MusicImporter.new("./spec/fixtures/mp3s") }

    it "imports the files into the library by invoking Song.create_from_filename" do
      expect(Song).to receive(:create_from_filename).with("Action Bronson - Larry Csonka - indie.mp3")
      expect(Song).to receive(:create_from_filename).with("Jurassic 5 - What's Golden - hip-hop.mp3")
      expect(Song).to receive(:create_from_filename).with("Real Estate - Green Aisles - country.mp3")
      expect(Song).to receive(:create_from_filename).with("Real Estate - It's Real - hip-hop.mp3")
      expect(Song).to receive(:create_from_filename).with("Thundercat - For Love I Come - dance.mp3")

      music_importer.import
    end
  end
end