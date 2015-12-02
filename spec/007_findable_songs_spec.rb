describe 'Findable Songs' do
  describe ".find_by_name" do
    it 'finds a song instance in @@all by the name property of the song' do
      song = Song.new("In an Aeroplane Over the Sea")
      song.save

      expect(Song.find_by_name("In an Aeroplane Over the Sea")).to eq(song)
    end
  end

  describe ".find_or_create_by_name" do
    it 'finds or creates a song by name maintaining uniqueness of objects by their name property' do
      song_1 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")
      song_2 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")

      expect(song_1).to eq(song_2)
    end
  end
end
