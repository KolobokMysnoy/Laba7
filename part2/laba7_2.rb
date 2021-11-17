# frozen_string_literal: true

class Rectangle
  def initialize(length, width)
    self.length = Integer(length)
    self.width = Integer(width)
  end

  def square
    width * length
  end

  def print
    p "Length #{length}"
    p "Width #{width}"
    p "Square #{square}"
  end

  private

  attr_accessor :length, :width
end

class Prall < Rectangle
  attr_reader :height, :length, :width

  def initialize(length, width, height)
    super(length, width)
    self.height = Integer(height)
  end

  def volume
    square * height
  end

  def print
    super
    p "Height #{height}"
    p "Volume #{volume}"
  end

  protected

  attr_writer :height
end
