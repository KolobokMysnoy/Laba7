# frozen_string_literal: true

class WorkWithFiles
  # create arr and work with orig file
  @file_even_name = 'even_file'
  @file_odd_name = 'odd_file'

  def work_with_file(file_original)
    @even_arr = []
    @odd_arr = []
    File.open(file_original) do |file|
      until file.eof?
        number = Integer(file.readline)
        if number.even?
          even_arr.push((number))
        else
          odd_arr.push(number)
        end
      end
      add_to_files
    end
  end

  # get files path
  def file_even_path
    File.path('even_file')
  end

  def file_odd_path
    File.path('odd_file')
  end

  private

  # add arrays to files
  def add_to_files
    return unless odd_arr && even_arr

    File.open('even_file', 'w') do |file_even|
      even_arr.each do |number|
        file_even.write("#{number}\n")
      end
    end

    File.open('odd_file', 'w+') do |file_odd|
      odd_arr.each do |number|
        file_odd.write("#{number}\n")
      end
    end
  end

  attr_accessor :even_arr, :odd_arr, :file_odd_name, :file_even_name
end
