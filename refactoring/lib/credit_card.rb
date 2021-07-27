class CreditCard
  def initialize(number)
    @number = number
  end

  def valid?
    reversed = split_and_reverse(@number)
    integer_array = convert_indices_to_integers(reversed)
    doubled = doubled_array(integer_array)
    total = sum_array(doubled)
    check_validity(total)
  end

  def split_and_reverse(array)
    array.split("").reverse
  end

  def doubled_array(array)
    doubled = array.map.with_index do |num, index|
      if index % 2 == 0
        num
      else
        num * 2
      end
    end
    doubled
  end

  def convert_indices_to_integers(array)
    integer = array.map do |num|
      num.to_i
    end
    integer
  end

  def sum_array(array)
    summed = array.map do |num|
      if num > 9
        num - 9
      else
        num
      end
    end
    summed.sum
  end

  def check_validity(integer)
    if integer % 10 == 0
      true
    else
      false
    end
  end
end
