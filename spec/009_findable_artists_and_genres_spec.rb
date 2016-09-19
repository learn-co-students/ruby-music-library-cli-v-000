describe 'Artists and Genres being extended by Concerns::Findable' do
  context 'Artist' do
    it 'is extended by the Concerns::Findable module' do
      expect(Artist).to respond_to(:find_by_name)
      expect(Artist).to respond_to(:find_or_create_by_name)
    end

    describe ".find_by_name" do
      it 'finds an artist instance in @@all by the name property of the artist' do
        artist = Artist.new("Neutral Milk Hotel")
        artist.save

        expect(Artist.find_by_name("Neutral Milk Hotel")).to eq(artist)
      end
    end

    describe ".find_or_create_by_name" do
      it 'finds or creates an artist by name maintaining uniqueness of objects by name property' do
        artist_1 = Artist.find_or_create_by_name("Neutral Milk Hotel")
        artist_2 = Artist.find_or_create_by_name("Neutral Milk Hotel")

        expect(artist_1).to eq(artist_2)
      end
    end
  end
  context 'Genre' do
    it 'is extended by the Concerns::Findable module' do
      expect(Genre).to respond_to(:find_by_name)
      expect(Genre).to respond_to(:find_or_create_by_name)
    end

    describe ".find_by_name" do
      it 'finds a genre instance in @@all by the name property of the genre' do
        genre = Genre.new("indie rock")
        genre.save

        expect(Genre.find_by_name("indie rock")).to eq(genre)
      end
    end

    describe ".find_or_create_by_name" do
      it 'finds or creates a genre by name maintaining uniqueness of objects by name property' do
        genre_1 = Genre.find_or_create_by_name("indie rock")
        genre_2 = Genre.find_or_create_by_name("indie rock")

        expect(genre_1).to eq(genre_2)
      end
    end
  end
end
