module Concerns
  module Findable

  def find_by_name(name)
    x = self.all.detect {|title| title.name == name}
    end

  def find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x == nil
      self.create(name)
    else
      return x
    end
  end
end


end
