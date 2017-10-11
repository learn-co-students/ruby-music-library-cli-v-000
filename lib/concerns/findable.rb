module Concerns
  module Findable

    # How would I make this an abstraction?
    # def self.create(name)
    #   artist = Artist.new(name)
    #   artist.save
    #   artist
    # end

    def find_by_name(name)
      self.all.detect{|a| a.name == name }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end

end
