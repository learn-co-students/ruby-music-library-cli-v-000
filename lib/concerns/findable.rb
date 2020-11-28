module Concerns::Findable
  def find_by_name(label)
    all.find do |nm|
      nm.name == label
    end
  end
    
  def find_or_create_by_name(label)
    object = find_by_name(label)
    if object == nil
      create(label)
    else
      object
    end
  end
end

