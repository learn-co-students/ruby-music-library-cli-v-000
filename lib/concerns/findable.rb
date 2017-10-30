module Concerns::Findable

  def find_by_name(name)
    self.all.each do |x|
      if x.name == name
        return x
      end
    end
    return nil
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
