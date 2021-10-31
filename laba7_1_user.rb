# frozen_string_literal: true

require './laba7_1'

file = File.new('tmp', 'w+')
classy = WorkWithFile.new
p 'Please input numbers of numbers'
p 'input your numbers'
gets.to_i.times do
  file.write(gets)
end
file.close

classy.add_file(file.path.to_s)

even_file = classy.gets_even

File.open(even_file, 'r') do |f|
  f.each do |number|
    tmp = number.scan(/\d/).join.to_i
    p tmp
  end
end
x