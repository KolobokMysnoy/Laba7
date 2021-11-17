# frozen_string_literal: true

require './main'
require 'minitest/autorun'

class TestRectangle < Minitest::Test
  def setup
    @length = 5
    @width = 6
    @rec_test = Rectangle.new(length, width)
  end

  def test_square_returns
    assert_equal width * length, rec_test.square
  end

  def test_output
    assert_output("\"Length #{length}\"\n\"Width #{width}\"\n\"Square #{width * length}\"\n") { rec_test.print }
  end

  def test_initialize
    assert_equal rec_test.send(:width), width
    assert_equal rec_test.send(:length), length
  end

  attr_reader :rec_test, :length, :width
end

class TestPral < Minitest::Test
  def setup
    @length = 5
    @width = 6
    @height = 9
    @volume = width * length * height
    @rec = Prall.new(length, width, height)
  end

  def test_initialize
    # Do i need to stub a super method?
    str1 = "\"Length #{length}\"\n\"Width #{width}\"\n\""
    str2 = "Square #{width * length}\"\n\"Height #{height}\"\n\"Volume #{volume}\"\n"
    str = str1 + str2
    assert_output(str) do
      rec.print
    end
  end

  def test_volume_returns
    assert_equal volume, rec.volume
  end

  def test_get_length
    assert_equal length, rec.length
  end

  def test_get_width
    assert_equal width, rec.width
  end

  def test_get_height
    assert_equal height, rec.height
  end

  def test_inheritance
    assert_kind_of Rectangle, rec
  end

  attr_reader :height, :length, :width, :volume, :rec
end
