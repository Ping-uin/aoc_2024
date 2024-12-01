# Input
data = readlines("inputs/01_data.txt")

# Create an array for each side of the input
ll = Int32[]
rl = Int32[]

# Iterate over each line, split them and push them into arrays
for line in data 
    #println(line)
    sides = split(line)
    push!(ll, parse(Int32, sides[1]))
    push!(rl, parse(Int32, sides[2]))  
end

# Sort both arrays
sort!(ll)
sort!(rl)

# Compare each value from both lists at the same index and add difference
function get_and_add_difference(ll, rl)
    result::Int32 = 0
    for i in 1:length(ll)
        if ll[i] == rl[i]
            result += 0
        elseif ll[i] > rl[i]
            result += (ll[i]-rl[i])
        else  
            result += (rl[i]-ll[i])
        end
    end
    return result
end

result = get_and_add_difference(ll, rl)
println(result)
