# frozen_string_literal: true

class RECTANGLE
  protected

  attr_accessor :length, :width, :error

  def to_i(number)
    tmp = number.to_s.scan(/\d|[-.]/).join
    if tmp == ''
      self.error=1
      nil
    else
      tmp.to_i
    end
  end

  public

  def initialize(length, width)
    self.length = to_i(length)
    self.width = to_i(width)
  end

  def square
    return nil if error == 1
    width * length
  end

  def print
    return nil if error == 1

    p "Length #{length}"
    p "Width #{width}"
    p "Square #{square}"
  end
end

class Prall < RECTANGLE
  protected

  attr_writer :height

  public

  attr_reader :height, :length, :width

  def initialize(length, width, height)
    super(length, width)
    self.height = to_i(height)

    self.error = 1 unless height
  end

  def volume
    return nil if error == 1

    square * height
  end

  def print
    return nil if error == 1

    super
    p "Height #{height}"
    p "Volume #{volume}"
  end
end
