def search(arr, min = 0, max = arr.length - 1, guess = (min + max) / 2, target = 73)
if min == max && arr[guess] != target
  return -1
elsif target == arr[guess]
  return guess
elsif target > arr[guess]
  min = guess
  max = max
  search(arr, min, max , guess = (min + max) / 2, target = 73)
elsif target < arr[guess]
  max = guess
  min = min
  search(arr, min, max , guess = (min + max) / 2, target = 73)
end

end

arr = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
    41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

puts search(arr)