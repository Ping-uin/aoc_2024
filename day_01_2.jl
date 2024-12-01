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

# Checks how often the value occurs in the right list and multiplies itself by this number
# Adds to the result
function get_similarity_score(ll, rl)
  result::Int32 = 0
  counter::Int32 = 0
  for i in 1:length(ll)
    for j in 1:length(rl)
      if rl[j] == ll[i]
        counter += 1
      end
      #println(counter)
    end
    result += (ll[i]*counter)
    #println(result)
    counter = 0
  end
  return result
end

result = get_similarity_score(ll,rl)
println(result)
