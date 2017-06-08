require "spec_helper"

describe "CLI Methods" do
  let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }
  let(:other_music_library_controller) { MusicLibraryController.new("./spec/fixtures/other_mp3s") }

  describe "#list_songs" do
    it "prints all songs in the music library in a numbered list" do
      expect($stdout).to receive(:puts).with("1. Action Bronson - Larry Csonka - indie")
      expect($stdout).to receive(:puts).with("2. Real Estate - Green Aisles - country")
      expect($stdout).to receive(:puts).with("3. Real Estate - It's Real - hip-hop")
      expect($stdout).to receive(:puts).with("4. Thundercat - For Love I Come - dance")

      music_library_controller.list_songs
    end

    it "is not hard-coded" do
      expect($stdout).to receive(:puts).with("1. Alpha 9 - Bliss - trance")
      expect($stdout).to receive(:puts).with("2. Bob Dylan - Ballad of a Thin Man - folk")
      expect($stdout).to receive(:puts).with("3. Bob Dylan - Masters of War - folk")
      expect($stdout).to receive(:puts).with("4. Cass McCombs - County Line - indie")

      other_music_library_controller.list_songs
    end
  end

  describe "#list_artists" do
    it "prints all artists in the music library in a numbered list" do
      expect($stdout).to receive(:puts).with("1. Action Bronson")
      expect($stdout).to receive(:puts).with("2. Real Estate")
      expect($stdout).to receive(:puts).with("3. Thundercat")

      music_library_controller.list_artists
    end

    it "is not hard-coded" do
      expect($stdout).to receive(:puts).with("1. Alpha 9")
      expect($stdout).to receive(:puts).with("2. Bob Dylan")
      expect($stdout).to receive(:puts).with("3. Cass McCombs")

      other_music_library_controller.list_artists
    end
  end

  describe "#list_genres" do
    it "prints all genres in the music library in a numbered list" do
      expect($stdout).to receive(:puts).with("1. indie")
      expect($stdout).to receive(:puts).with("2. country")
      expect($stdout).to receive(:puts).with("3. hip-hop")
      expect($stdout).to receive(:puts).with("4. dance")

      music_library_controller.list_genres
    end

    it "is not hard-coded" do
      expect($stdout).to receive(:puts).with("1. trance")
      expect($stdout).to receive(:puts).with("2. folk")
      expect($stdout).to receive(:puts).with("3. indie")

      other_music_library_controller.list_genres
    end
  end

  describe "#list_songs_by_artist" do
    it "prompts the user to enter an artist" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

      expect($stdout).to receive(:puts).with("Please enter the name of an artist:")

      music_library_controller.list_songs_by_artist
    end

    it "accepts user input" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

      expect(music_library_controller).to receive(:gets)

      music_library_controller.list_songs_by_artist
    end

    it "prints all songs by a particular artist in a numbered list" do
      allow(music_library_controller).to receive(:gets).and_return("Real Estate")

      expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
      expect($stdout).to receive(:puts).with("1. Green Aisles - country")
      expect($stdout).to receive(:puts).with("2. It's Real - hip-hop")

      music_library_controller.list_songs_by_artist
    end

    it "does nothing if no matching artist is found" do
      allow(music_library_controller).to receive(:gets).and_return("Eel Restate")

      expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
      expect($stdout).to_not receive(:puts)

      music_library_controller.list_songs_by_artist
    end
  end

  describe "#list_songs_by_genre" do
    it "prompts the user to enter a genre" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

      expect($stdout).to receive(:puts).with("Please enter the name of a genre:")

      music_library_controller.list_songs_by_genre
    end

    it "accepts user input" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

      expect(music_library_controller).to receive(:gets)

      music_library_controller.list_songs_by_genre
    end

    it "prints all songs by a particular genre in a numbered list" do
      allow(music_library_controller).to receive(:gets).and_return("hip-hop")

      expect($stdout).to receive(:puts).with("Please enter the name of a genre:")
      expect($stdout).to receive(:puts).with("1. Real Estate - It's Real")

      music_library_controller.list_songs_by_genre
    end

    it "does nothing if no matching genre is found" do
      allow(music_library_controller).to receive(:gets).and_return("post-jazz")

      expect($stdout).to receive(:puts).with("Please enter the name of a genre:")
      expect($stdout).to_not receive(:puts)

      music_library_controller.list_songs_by_genre
    end
  end

  describe "#play_song" do
    it "prompts the user to choose a song" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #puts")

      expect($stdout).to receive(:puts).with("Which song number would you like to play?")

      allow($stdout).to receive(:puts)

      music_library_controller.play_song
    end

    it "accepts user input" do
      allow(music_library_controller).to receive(:gets).and_return("Testing for #gets")

      expect(music_library_controller).to receive(:gets)

      music_library_controller.play_song
    end

    it "'plays' a song" do
      allow(music_library_controller).to receive(:gets).and_return("4")

      expect($stdout).to receive(:puts).with("Which song number would you like to play?")
      expect($stdout).to receive(:puts).with("Playing For Love I Come by Thundercat")

      music_library_controller.play_song
    end

    it "does not 'puts' anything out if a matching song is not found" do
      allow(music_library_controller).to receive(:gets).and_return("5")

      expect($stdout).to receive(:puts).with("Which song number would you like to play?")
      expect($stdout).to_not receive(:puts)

      music_library_controller.play_song
    end

    it "checks that the user entered a number between 1 and the total number of songs in the library" do
      allow(music_library_controller).to receive(:gets).and_return("0")

      expect($stdout).to receive(:puts).with("Which song number would you like to play?")
      expect($stdout).to_not receive(:puts)

      music_library_controller.play_song
    end
  end
end
