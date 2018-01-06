///////////////// QUICK SNIPS /////////////////

# HAS MANY THROUGH
# Returns only unique
def genres
  self.songs.map(&:genre).uniq
end


# FINDER
def self.find(name)
  self.all.find(&:name)
end


# EMPTY CLASS COLLECOR @@ALL = [...]
def self.reset
  self.all.clear
end

# PUSH INSTANCE INTO CLASS COLLECOR @@ALL = [...]
def save
  self.class.all << self
end

# INSTANTIATE AND PUSH INTO @@
def self.create(song)
  song = self.new(name).tap {|o| o.save}
end

# ADDS ONLY IF DOESNT ALREADY EXIST
def add_song(song)
  song.artist ||= self
end

# CREATE SOMETHING UNLESS IT EXISTS
songs << song unless songs.include?(song)

# ASSIGN ONLY IF PASSED (OPTIONAL VAR)
# def initialize(name, artist = nil)
  self.artist = artist if artist
# end















# create all X.rb in lib
=> X
-----------------------------------------------
class x

#==============================================
end
-----------------------------------------------



=> RW(x)
-----------------------------------------------
#=================properties===================
  attr_accessor :x
-----------------------------------------------



=> @@x = []
-----------------------------------------------
#=================properties===================
  @@x = []
  def self.x; @@x end
-----------------------------------------------



=> I(x.A)
-----------------------------------------------
#=================intialize====================
  def initialize(x); self.x = x end
-----------------------------------------------



=> CC(x)
-----------------------------------------------
#==================custom======================
  def self.create(x)
    x = self.new(name).tap {|x| x.save}
  end
-----------------------------------------------



=> CM(x)
-----------------------------------------------
#==================class=======================
  def self.x

  end
-----------------------------------------------



=> IM(x)
-----------------------------------------------
#=================instance=====================
  def x

  end
-----------------------------------------------



=>
-----------------------------------------------

-----------------------------------------------



=>
-----------------------------------------------

-----------------------------------------------



=>
-----------------------------------------------

-----------------------------------------------

-----------------------------------------------
class x
#==============================================
end
-----------------------------------------------


----------------- (x)i.RW ---------------------

#=================intialize====================
  def initialize(x); self.x = x end

@@
================
=> @@x = []
=> def self.x; @@x end

belongs_to(x)
================
=> attr_accessor :x
=> init(if_x_passed_directly) do self.x = x

-has_many(x)
================
=> attr_accessor :x
=> init self.x = []
=> +meth add_x(arg)
      self.x << arg
      arg.class_name = self

-many(x)through(y)
================
=> +meth x
      self.y.map(&:x)

#=====================================
*REMEMBER!*
hop out with self.class.X when going from instance to class method
