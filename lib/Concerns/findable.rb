module Concerns::Findable

  def find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def find_or_create_by_name(name)
    search_result = find_by_name(name)
    if search_result
      return search_result
    else
      self.create(name)
    end
  end
end
