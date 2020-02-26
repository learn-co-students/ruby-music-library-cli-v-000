module Concerns::Findable
  def find_by_name(name)
      all.find do |x|
        x.name == name
    end
  end

    def find_or_create_by_name(name)
      if find_by_name(name)
        return find_by_name(name)
      else create(name)
    end
  end
end
