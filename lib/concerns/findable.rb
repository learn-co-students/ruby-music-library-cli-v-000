module Concerns::Findable

  module ClassMethods

  end

  module InstanceMethods


  end

  def find_or_create_by_name(name)
    if find_by_name(name) == nil
      create(name)
    else find_by_name(name)
    end
  end

  def find_by_name(search)
    all.find do |song|
      song.name == search
    end
  end






end
