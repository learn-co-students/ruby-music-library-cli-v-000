module Concerns::Findable
  def find_by_name(n)
    self.all.find{|s| s.name===n}
  end

  def create(n)
    new_thing = self.new(n)
    self.all << new_thing
    new_thing
  end

  def find_or_create_by_name(n)
    found = self.find_by_name(n)
    if found===nil
      self.create(n)
    else
      found
    end
  end
end
