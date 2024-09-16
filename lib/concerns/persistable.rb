def self.destroy_all
  self.all.clear
end

def save
  @@all << self
end
