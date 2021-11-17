# frozen_string_literal: true

require './main'

p 'Input length, width, height'
len = gets.to_i
wid = gets.to_i
heig = gets.to_i

p 'Rectange'
rec = Rectangle.new(len, wid)
rec.print

p 'Rectangular parallelepiped'
prall = Prall.new(len, wid, heig)
prall.print
