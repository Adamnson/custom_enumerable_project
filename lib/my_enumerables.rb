require 'pry-byebug'

module Enumerable

  def my_each_with_index
    if block_given?
      count = 0
      self.my_each do |item|
        yield item, count
        count += 1
      end
    end
    self.my_each
  end

  def my_select(&block)
    if block_given?
      new_arr = []
      self.my_each do |item|
        new_arr << item if block.call(item)
      end
      new_arr
    end
  end

  def my_all?(&block)
    if block_given?
      self.my_each do |e|
        return false unless block.call(e)
      end
      true
    end
  end

  def my_any?(&block)
    if block_given?
      self.my_each do |e|
        return true if block.call(e)
      end
      false
    end
  end

  def my_none?(&block)
    if block_given?
      self.my_each do |e|
        return false if block.call(e)
      end
      true
    end
  end

  def my_count(&block)
    if block_given?
      count = 0
      self.my_each do |e|
        count += 1 if block.call(e)
      end
      count
    else
      self.size
    end
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # binding.pry
  def my_each(&block)
    for item in self
      yield item if block_given?
    end
    return self unless self.empty?
  end
end
