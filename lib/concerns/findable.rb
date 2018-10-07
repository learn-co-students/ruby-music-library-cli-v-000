module Concerns::Findable
  def find_by_name(name)
    results = self.all.select { |song| song.name == name}
    results[0]
  end

  def find_or_create_by_name(name)
    find_results = self.find_by_name(name)
    if find_results != nil
      return find_results
    else
      new_song = self.create(name)
      return new_song
    end
  end
end
#
