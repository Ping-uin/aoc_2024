data = readlines("inputs/03_data.txt")
regex = Regex("mul\\((\\d{1,3}),(\\d{1,3})\\)")

function extract_products_and_sum(data)
  result = 0
  products = []
  for line in data
    found_muls = collect(eachmatch(regex, line))
    for match in found_muls
      x = parse(Int, match.captures[1])
      y = parse(Int, match.captures[2])
      
      product = x * y
      push!(products, product)
    end
  end

  for elem in products
    result += elem
  end
  return result
end

result = extract_products_and_sum(data)
println(result)
