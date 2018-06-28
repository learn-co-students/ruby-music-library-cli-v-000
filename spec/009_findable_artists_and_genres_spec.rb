describe "Artist" do
  it "extends the Concerns::Findable module" do
    expect(Artist.singleton_class.ancestors).to include(Concerns::Findable)
  end
end

describe "Genre" do
  it "extends the Concerns::Findable module" do
    expect(Genre.singleton_class.ancestors).to include(Concerns::Findable)
  end
end
