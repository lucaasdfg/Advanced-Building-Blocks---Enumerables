# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum unless block_given?

    arr = to_a
    i = 0
    while i < arr.length
      yield(arr[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    arr = to_a
    i = 0
    while i < arr.length
      yield(arr[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    an_arr = []
    my_each do |i|
      an_arr.push(i) if yield(i)
    end
    an_arr
  end

  def my_all?(*arg)
    if arg.empty?
      my_each { |i| return false unless yield(i) } if block_given?

      return true if block_given?

      my_each { |i| return false unless i }
    else
      my_each { |i| return false unless i.match(arg[0]) } if arg[0].class == Regexp

      return true if arg[0].class == Regexp

      my_each { |i| return false unless i.class == arg[0] } if arg[0].is_a?(Class)
      return true if arg[0].is_a?(Class)

      my_each { |i| return false unless i == arg[0] }
    end
    true
  end

  def my_any?(*arg)
    if arg.empty?
      my_each { |i| return true if yield(i) } if block_given?

      return false if block_given?

      my_each { |i| return true if i }
    else
      my_each { |i| return true if i.match(arg[0]) } if arg[0].class == Regexp

      return false if arg[0].class == Regexp

      my_each { |i| return true if i.class == arg[0] } if arg[0].is_a?(Class)
      return false if arg[0].is_a?(Class)

      my_each { |i| return true if i == arg[0] }
      end
    false
      end

  def my_none?(*arg)
    if arg.empty?
      my_each { |i| return false if yield(i) } if block_given?
      return true if block_given?

      my_each { |i| return false if i }
      return true
    else
      my_each { |i| return false if i.match(arg[0]) } if arg[0].class == Regexp
      return true if arg[0].class == Regexp

      my_each { |i| return false if i.class == arg[0] } if arg[0].is_a?(Class)

      return true if arg[0].is_a?(Class)

      my_each { |i| return false if i == arg[0] }
    end
    true
    end

  def my_count(*xarg)
    count = 0
    if xarg.empty?
      my_each { count += 1 } unless block_given?
      my_each { |i| count += 1 if yield(i) } if block_given?
    else
      my_each { |i| count += 1 if i == xarg[0] }
     end
    count
end

  def my_map(*proc_obj)
    return to_enum if !block_given? && proc_obj.empty?

    ret_arr = []
    if !proc_obj.empty?
      my_each { |i| ret_arr.push(proc_obj[0].call(i)) }
    else
      my_each { |i| ret_arr.push(yield(i)) }
    end
    ret_arr
    end

  def my_inject(*xarg)
    if xarg.empty?
      ret_val = first
      my_each_with_index { |val, i| ret_val = yield(ret_val, val) if i.positive? } if block_given?
    elsif xarg[0].class == Symbol
      ret_val = first
      my_each_with_index do |x, i|
        ret_val = xarg[0].to_proc.call(ret_val, x) if i.positive?
      end
    elsif xarg[0].class == Integer && xarg[1].class == Symbol
      ret_val = xarg[0]
      my_each { |val| ret_val = xarg[1].to_proc.call(ret_val, val) }
    else
      ret_val = xarg[0]
      my_each { |i| ret_val = yield(ret_val, i) }
    end

    ret_val
  end
        end

def multiply_els(arr)
  arr.my_inject { |result, value| result * value }
end
