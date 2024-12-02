data = readlines("inputs/02_data.txt")
#println(data)
 
function eval_reports(data)
  safe_reports::Int32 = 0
  # Rules:
  # A report is safe if 
  # - It is only increasing/decreasing
  # - The Step between each value is 0 < x < 4
  for line in data
    numbers = split(line)        
    nums = parse.(Int, numbers)
    
    is_safe = true
    is_increasing = false
    is_decreasing = false
        
    for i in 1:(length(nums)-1)
      # Curr and next num same?
      if nums[i] == nums[i+1]
        is_safe = false
        break
      # Difference greater than 3?
      elseif abs(nums[i] - nums[i+1]) > 3
        is_safe = false
        break
      # Next num bigger while decreasing?
      elseif nums[i] < nums[i+1] && is_decreasing
        is_safe = false
        break
      # Next num smaller while increasing?
      elseif nums[i] > nums[i+1] && is_increasing
        is_safe = false
        break
      # increase?
      elseif nums[i] < nums[i+1]
        is_increasing = true
      # decrease?
      elseif nums[i] > nums[i+1]
        is_decreasing = true
      end
    end
       
    if is_safe
      safe_reports += 1
    end
  end
  return safe_reports
end

result = eval_reports(data)
println(result)
