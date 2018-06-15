context "Song" do
  describe ".find_by_name" do
    it "finds a song instance in @@all by the name property of the song" do
      song = Song.create("In the Aeroplane Over the Sea")
      expect(Song.find_by_name("In the Aeroplane Over the Sea")).to be(song)
    end
  end

  describe ".find_or_create_by_name" do
    it "finds (does not recreate) an existing song with the provided name if one exists in @@all" do
      song1 = Song.find_or_create_by_name("In the Aeroplane Over the Sea")
      song2 = Song.find_or_create_by_name("In the Aeroplane Over the Sea")

      expect(song1).to be_a(Song)
      expect(song1).to eq(song2)
    end

    it "invokes .find_by_name instead of re-coding the same functionality" do
      expect(Song).to receive(:find_by_name)
      Song.find_or_create_by_name("Kaohsiung Christmas")
    end

    it "creates a song if an existing match is not found" do
      song = Song.find_or_create_by_name("I'd Rather Go Blind")
      expect(Song.all).to include(song)
    end

    it "invokes .create instead of re-coding the same functionality" do
      expect(Song).to receive(:create)
      Song.find_or_create_by_name("Kaohsiung Christmas")
    end
  end
end
