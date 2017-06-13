require "spec_helper"

describe "Genre" do
  let(:genre) { Genre.new("indie rock") }

  describe "#initialize" do
    it "accepts a name for the new genre" do
      new_genre = Genre.new("shoegaze")

      new_genre_name = new_genre.instance_variable_get(:@name)

      expect(new_genre_name).to eq("shoegaze")
    end
  end

  describe "#name" do
    it "retrieves the name of a genre" do
      expect(genre.name).to eq("indie rock")
    end
  end

  describe "#name=" do
    it "can set the name of a genre" do
      genre.name = "classics"

      genre_name = genre.instance_variable_get(:@name)

      expect(genre_name).to eq("classics")
    end
  end

  describe "@@all" do
    it "is initialized as an empty array" do
      all = Genre.class_variable_get(:@@all)

      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Genre.all).to match_array([])

      Genre.class_variable_set(:@@all, [genre])

      expect(Genre.all).to match_array([genre])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Genre.class_variable_set(:@@all, [genre])

      Genre.destroy_all

      expect(Genre.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Genre instance to the @@all class variable" do
      genre.save

      expect(Genre.all).to include(genre)
    end
  end

  describe ".create" do
    it "initializes and saves the genre" do
      created_genre = Genre.create("shoegaze")

      expect(Genre.all).to include(created_genre)
    end
  end
end
