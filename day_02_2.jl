data = readlines("inputs/02_data.txt")

function eval_reports(data)
    safe_reports::Int32 = 0
    
    for i in eachindex(data)
        nums = parse.(Int, split(data[i]))
        
        # Check for errors in a singular line
        err_pos = check_line(nums)    
        
        # If no error detected the report is safe
        # else the index where the error occurs is removed and the line tested again
        # Only if it is safe now it gets added to the safe reports  
        if err_pos == 0
            safe_reports += 1
        else
            is_safe = false
            # Bruteforce through the report (or a copy of it) with each number removed once till safe permutation is found
            for i in 1:length(nums)
                nums_copy = copy(nums)
                deleteat!(nums_copy, i)
                
                # If the removed number makes a safe report the rest gets skipped
                if check_line(nums_copy) == 0
                    is_safe = true
                    break
                end
            end
            
            if is_safe
                safe_reports += 1
            end
        end      
    end
    return safe_reports
end

function check_line(nums)
    err_pos = 0
    is_increasing = false
    is_decreasing = false
    
    for i in 1:length(nums)-1
        if abs(nums[i] - nums[i+1]) > 3
          err_pos = i
          break
        elseif nums[i] == nums[i+1]
          err_pos = i
          break
        elseif nums[i] < nums[i+1] && is_decreasing
          err_pos = i
          break
        elseif nums[i] > nums[i+1] && is_increasing
          err_pos = i
          break
        elseif nums[i] < nums[i+1]
          is_increasing = true
        elseif nums[i] > nums[i+1]
          is_decreasing = true
        end
    end
    return err_pos
end

result = eval_reports(data)
println(result)
