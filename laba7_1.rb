# frozen_string_literal: true

class WorkWithFile
  private

  attr_accessor :file_original, :file_even, :file_odd

  def work_with_file
    self.file_even = File.new('even', 'w+')
    self.file_odd = File.new('odd', 'w+')
    File.open(file_original, 'r') do |file|
      file.each do |number|
        where_put(number.scan(/\d/).join.to_i)
      end
    end
    file_even.close unless file_even.closed?
    file_odd.close unless file_odd.closed?
  end

  def where_put(number)
    if number.even?
      file_even.write("#{number}\n")
    else
      file_odd.write("#{number}\n")
    end
  end

  public

  def gets_odd
    file_odd.path
  end

  def gets_even
    file_even.path
  end

  def add_file(file_path)
    self.file_original = file_path
    work_with_file
  end
end
