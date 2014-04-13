def all_sums(num)
  return [num.to_i] if num.length < 2
  
  sums = []
  nums_arr = num.split("")
  max_pluses = nums_arr.length - 1
  plus_combinations = 2 ** max_pluses
  
  (0..plus_combinations - 1).each do |pluses_combo|
    nums_to_sum = [nums_arr[0].to_i]
    
    (max_pluses - 1).downto(0) do |bit|
      if pluses_combo[bit] == 0
        nums_to_sum[-1] = nums_to_sum.last * 10 + nums_arr[-bit - 1].to_i
      else
        nums_to_sum << nums_arr[-bit - 1].to_i
      end
    end
    
    sums << nums_to_sum.inject(&:+)
  end
  sums
end

if __FILE__ == $PROGRAM_NAME
  p all_sums(ARGV[0])
end