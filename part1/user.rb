# frozen_string_literal: true

require './main'

name = 'orig'

p 'Please input numbers of numbers'
how_much = gets.to_i
p 'input your numbers'

File.open(name, 'w') do |file|
  how_much.times do
    num = gets.to_s
    file.write(num)
  end
end

class_for_user = WorkWithFiles.new
class_for_user.work_with_file(name)

p 'Even'
even_file = class_for_user.file_even_path
File.open(even_file, 'r') do |f|
  f.each do |number|
    tmp = Integer(number)
    p tmp
  end
end

p 'Odd'
odd_file = class_for_user.file_odd_path
File.open(odd_file, 'r') do |f|
  f.each do |number|
    tmp = Integer(number)
    p tmp
  end
end

File.delete(name)
File.delete(class_for_user.file_odd_path)
File.delete(class_for_user.file_even_path)
