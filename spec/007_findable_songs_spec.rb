context "Song" do
  let!(:song_one) { Song.create("The King of Carrot Flowers, Pt. One") }
  let!(:song_two) { Song.create("In the Aeroplane Over the Sea") }

  describe ".find_by_name" do
    it "finds a song instance in @@all by the name property of the song" do
      expect(Song.find_by_name("In the Aeroplane Over the Sea")).to be(song_two)
    end
  end

  describe ".find_or_create_by_name" do
    it "returns (does not recreate) an existing song with the provided name if one exists in @@all" do
      same_song = Song.find_or_create_by_name("In the Aeroplane Over the Sea")

      expect(Song.all.length).to eq(2)
      expect(same_song).to be(song_two)
    end

    it "invokes .find_by_name instead of re-coding the same functionality" do
      expect(Song).to receive(:find_by_name).with("Kaohsiung Christmas")

      Song.find_or_create_by_name("Kaohsiung Christmas")
    end

    it "creates a song if an existing match is not found" do
      other_song = Song.find_or_create_by_name("I'd Rather Go Blind")

      expect(Song.all).to include(other_song)
    end

    it "invokes .create instead of re-coding the same functionality" do
      expect(Song).to receive(:create).with("Kaohsiung Christmas")

      Song.find_or_create_by_name("Kaohsiung Christmas")
    end
  end
end