require "spec_helper"

describe "Concerns::Findable" do
  it "defines a module named Concerns::Findable" do
    expect(defined?(Concerns::Findable)).to be_truthy
    expect(Concerns::Findable).to_not be_a(Class)
    expect(Concerns::Findable).to be_a(Module)
  end
end

describe "Artist" do
  it "extends the Concerns::Findable module" do
    artist_extends_concerns_findable = Artist.singleton_class.ancestors.include?(Concerns::Findable)
    expect(artist_extends_concerns_findable).to be(true)
  end
end

describe "Genre" do
  it "extends the Concerns::Findable module" do
    genre_extends_concerns_findable = Genre.singleton_class.ancestors.include?(Concerns::Findable)
    expect(genre_extends_concerns_findable).to be(true)
  end
end

describe "Concerns::Findable" do
  let!(:artist_one) { Artist.create("Madonna") }
  let!(:artist_two) { Artist.create("Slowdive") }
  let!(:genre_one) { Genre.create("pop") }
  let!(:genre_two) { Genre.create("shoegaze") }

  describe ".find_by_name" do
    it "is added as a class method to classes that extend the module" do
      expect(Artist).to respond_to(:find_by_name)
    end

    context "works exactly like a generic version of Song.find_by_name," do
      it "searching the extended class's @@all variable for an instance that matches the provided name" do
        expect(Artist.find_by_name("Slowdive")).to be(artist_two)
      end
    end

    it "isn't hard-coded" do
      expect(Genre.find_by_name("shoegaze")).to be(genre_two)
    end
  end

  describe ".find_or_create_by_name" do
    it "is added as a class method to classes that extend the module" do
      expect(Artist).to respond_to(:find_or_create_by_name)
    end

    context "works exactly like a generic version of Song.find_or_create_by_name:" do
      it "finds (does not recreate) an existing instance with the provided name if one exists in @@all" do
        expect(Artist.find_or_create_by_name("Slowdive")).to be(artist_two)
      end

      it "isn't hard-coded" do
        expect(Genre.find_or_create_by_name("shoegaze")).to be(genre_two)
      end

      it "invokes .find_by_name instead of re-coding the same functionality" do
        expect(Artist).to receive(:find_by_name)
        Artist.find_or_create_by_name("Slowdive")
      end

      it "invokes the extended class's .create method, passing in the provided name, if an existing match is not found" do
        expect(Artist).to receive(:create)
        Artist.find_or_create_by_name("M83")
      end
    end
  end
end