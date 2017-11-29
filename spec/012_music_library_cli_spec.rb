require "spec_helper"

describe "MusicLibraryController - CLI Commands" do
  let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }

  describe "'list songs'" do
    it "triggers #list_songs" do
      allow(music_library_controller).to receive(:gets).and_return("list songs", "exit")

      expect(music_library_controller).to receive(:list_songs)

      capture_puts { music_library_controller.call }
    end
  end

  describe "'list artists'" do
    it "triggers #list_artists" do
      allow(music_library_controller).to receive(:gets).and_return("list artists", "exit")

      expect(music_library_controller).to receive(:list_artists)

      capture_puts { music_library_controller.call }
    end
  end

  describe "'list genres'" do
    it "triggers #list_genres" do
      allow(music_library_controller).to receive(:gets).and_return("list genres", "exit")

      expect(music_library_controller).to receive(:list_genres)

      capture_puts { music_library_controller.call }
    end
  end

  describe "'list artist'" do
    it "triggers #list_songs_by_artist" do
      allow(music_library_controller).to receive(:gets).and_return("list artist", "exit")

      expect(music_library_controller).to receive(:list_songs_by_artist)

      capture_puts { music_library_controller.call }
    end
  end

  describe "'list genre'" do
    it "triggers #list_songs_by_genre" do
      allow(music_library_controller).to receive(:gets).and_return("list genre", "exit")

      expect(music_library_controller).to receive(:list_songs_by_genre)

      capture_puts { music_library_controller.call }
    end
  end

  describe "'play song'" do
    it "triggers #play_song" do
      allow(music_library_controller).to receive(:gets).and_return("play song", "2", "exit")

      expect(music_library_controller).to receive(:play_song)

      capture_puts { music_library_controller.call }
    end
  end
end
