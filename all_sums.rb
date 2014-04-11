def all_sums(num)
  return [num.to_i] if num.length < 2
  sums = []
  nums_arr = num.split("")
  max_pluses = nums_arr.length - 1
  plus_combinations = 2 ** max_pluses
  
  (0..plus_combinations - 1).each do |pluses|
    nums_permutation = nums_arr.dup
    idx = 0
    binary = pluses.to_s(2).split('')
    
    until binary.length == max_pluses
      binary.unshift("0")
    end
    
    binary.each do |plus|
      if plus == "0"
        nums_permutation[idx] = nums_permutation[idx..(idx + 1)].join
        nums_permutation.slice!(idx + 1)
      else
        idx += 1
      end
    end
    sums << nums_permutation.map(&:to_i).inject(&:+)
  end
  sums
end

if __FILE__ == $PROGRAM_NAME
  p all_sums(ARGV[0])
end