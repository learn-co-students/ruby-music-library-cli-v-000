class Artist
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :name
@@all = []
#----------------------------------------------------------------------------------------
#instance
def initialize(name)
    @name = name
end

def save
    @@all << self
end





#----------------------------------------------------------------------------------------
#class
def self.all
    @@all
end

def self.destroy_all
    @@all.clear
end

def self.create(name)
    this_artist = self.new(name)
    this_artist.save
    this_artist
end



#---

end
