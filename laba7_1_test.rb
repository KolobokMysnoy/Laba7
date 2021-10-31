# frozen_string_literal: true

require './laba7_1'
require 'minitest/autorun'

class TestMeme < Minitest::Test
  def setup
    @original_file = 'original'
    @even_file = 'even_file'
    @odd_file = 'odd_file'
    @how_many = 16
    @classy = WorkWithFile.new
  end

  def create_files
    even = File.new(@even_file, 'w+')
    odd = File.new(@odd_file, 'w+')
    original = File.new(@original_file, 'w+')

    @how_many.times do
      number = rand(200)
      original.write("#{number}\n")
      if number.even?
        even.write("#{number}\n")
      else
        odd.write("#{number}\n")
      end
    end
  end

  def test_1
    create_files
    @classy.add_file(@original_file)
    even_res = @classy.gets_even
    result = File.open(@even_file)

    File.open(even_res, 'r') do |file|
      file.each do |date|
        result_date = result.read
        assert_equal(date, result_date)
      end
    end
    result.close
  end

  def test_2
    create_files
    @classy.add_file(@original_file)
    odd_res = @classy.gets_odd
    result = File.open(@odd_file)

    File.open(odd_res, 'r') do |file|
      file.each do |date|
        result_date = result.read
        assert_equal(date, result_date)
      end
    end
    result.close
  end

  def test_3
    create_files
    @classy.add_file(@original_file)

    even_result = File.open(@classy.gets_even, 'r')
    odd_result = File.open(@classy.gets_odd, 'r')
    result = even_result.size + odd_result.size
    even_result.close
    odd_result.close

    original = File.open(@original_file, 'r')
    result_need = original.size
    original.close

    assert_equal(result, result_need)
  end
end
