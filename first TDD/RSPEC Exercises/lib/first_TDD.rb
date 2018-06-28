class Array

  def my_uniq
    arr = []
    self.each {|el| arr << el if !arr.include?(el)}
    arr
  end

  def two_sum
    arr = []
    (0...length).each do|idx|
      (idx+1...length).each {|i| arr << [idx, i] if self[idx] + self[i] == 0}
    end
    arr
  end

  def my_transpose
    result = Array.new(length) { Array.new([]) }
    result.each_index do |idx|
      self.each do |sub_arr|
        result[idx] << sub_arr[idx]
      end
    end
    result
  end

  def stock_picker
    hsh = Hash.new {|h,k| h[k]=[]}
    (0...length).each do|idx|
      (idx+1...length).each {|i| hsh[[idx, i]] = self[i] - self[idx]}
    end

    hsh.sort_by {|k,v| v}.last.first
    
  end

end
