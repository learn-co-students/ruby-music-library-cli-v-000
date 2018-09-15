module Concerns::Findable

  def find_by_name(name)
    all.find do |i| #using @@all.find do triggers the error: # Concerns::Findable .find_by_name isn't hard-coded
    i.name == name
    end
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

    #not extended to song.rb because it already has it

end
