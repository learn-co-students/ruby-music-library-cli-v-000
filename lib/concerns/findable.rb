module Concerns::Findable

  def find_by_name(name)
    all.detect{ |title| title.name == name }
  end

  def find_or_create_by_name(name)
        find_by_name(name) || self.create(name)


  end
end
