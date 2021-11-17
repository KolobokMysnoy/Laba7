# frozen_string_literal: true

require './laba7_1'
require 'minitest/autorun'

class TestMeme < Minitest::Test
  def setup
    @original_file = 'original'
    # @even_file = 'even_file'
    # @odd_file = 'odd_file'
    @how_many = 16

    @even_needs = []
    @odd_needs = []

    create_files
    @classy = WorkWithFiles.new
    @classy.work_with_file(original_file)
    @result_file_even = classy.file_even_path
    @result_file_odd = classy.file_odd_path
  end

  # Create file and two arrays for tests
  def create_files
    File.open(original_file, 'w') do |original|
      how_many.times do
        number = rand(-10..189)
        original.write("#{number}\n")
        if number.even?
          even_needs.push(number)
        else
          odd_needs.push(number)
        end
      end
    end
  end

  def test_for_output_even
    # even output
    File.open(result_file_even, 'r') do |file|
      ind = 0
      until file.eof?
        number = Integer(file.readline)
        assert_equal number, even_needs[ind]
        ind += 1
      end
    end
  end

  def test_for_output_odd
    # odd output
    File.open(result_file_odd, 'r') do |file|
      ind = 0
      until file.eof?
        number = Integer(file.readline)
        assert_equal number, odd_needs[ind]
        ind += 1
      end
    end
  end

  def test_for_path_methods
    class_for_test = WorkWithFiles.new

    class_for_test.stub (:work_with_file), 12 do
      class_for_test.work_with_file('...')

      assert_equal class_for_test.file_even_path, 'even_file'
      assert_equal class_for_test.file_odd_path, 'odd_file'
    end
  end

  def test_for_add_arrays
    class_for_test = WorkWithFiles.new

    class_for_test.stub (:work_with_file), '...' do
      class_for_test.send(:add_to_files)

      # Check for empty file
      even_test_for_nul = File.open(class_for_test.file_even_path, 'r') do |file|
        return file.eof?
      end

      odd_test_for_nul = File.open(class_for_test.file_odd_path, 'r') do |file|
        return file.eof?
      end

      assert_equal even_test_for_nul.eof?
      assert_equal odd_test_for_nul.eof?
    end
  end

  # Delete all files
  def after_teardown
    File.delete(original_file)
    File.delete(result_file_even)
    File.delete(result_file_odd)
    super
  end

  private

  attr_reader :how_many, :even_file, :odd_file, :original_file, :result_file_even, :result_file_odd, :even_needs,
              :odd_needs, :classy
end
