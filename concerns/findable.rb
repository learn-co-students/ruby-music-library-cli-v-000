module Concerns::Findable
  def find_by_name(finding_name)
    self.all.find do |song|
      song.name == finding_name
    end
  end

  def find_or_create_by_name(find_name)
      if self.all.find { |song| song.name == find_name } == nil
        self.create(find_name)
      else
        self.all.find { |song| song.name == find_name }
    end
  end
end
