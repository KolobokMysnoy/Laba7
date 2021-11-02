# frozen_string_literal: true

require './laba7_2'
require 'minitest/autorun'

class TestRectangle < Minitest::Test
    def setup
        @length=5;
        @width=6;
    end

    def test_square_returns
        assert_equal @width*@length, RECTANGLE.new(@length,@width).square
    end

    def test_nil
        rec1=RECTANGLE.new("a",12)
        assert_nil rec1.print
        assert_nil rec1.square
    end
end


class TestRectangle < Minitest::Test
    def setup
        @length=5;
        @width=6;
        @height=9;
        @volume=@width*@length*@height
        @rec=Prall.new(@length,@width, @height)
    end

    def test_volume_returns
        assert_equal @volume, @rec.volume
    end

    def test_get_length
        assert_equal @length, @rec.length
    end

    def test_get_width
        assert_equal @width, @rec.width
    end

    def test_get_height
        assert_equal @height, @rec.height
    end

    def test_inheritance
        assert_kind_of RECTANGLE, @rec
    end

    def test_nil
        pral1=Prall.new(5,6,"a")
        assert_nil pral1.volume
        assert_nil pral1.print
    end

end
