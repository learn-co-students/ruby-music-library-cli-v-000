#!/user/bin/env ruby
# this was created per 10:49 / 1:21:10 of this video: https://www.youtube.com/watch?v=iClea2crypU
# go to the bash and type:
# ruby ./bin/console.rb
# ...this will allow you to enter the program and play with it & test it out
# this is not required to pass this lab but I did it anyways to help me fiddle with shit.
require_relative '../config/environment'
require 'irb'


# this is called a helper method
# ...it is used so you don't have to constantly load & reload the console
def reload!
  load './config/environment.rb'
end

IRB.start

# this is my stuff to help debug crap
l = Song.new("lala")
l.save
f = Song.new("fala")
f.save
q = Artist.new("Joe")
q.save
w = Artist.new("Kat")
w.save
