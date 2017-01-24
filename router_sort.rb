router_status_bar = [[5, 1], [7, 0], [30, 1], [31, 0], [36, 1]]
# Each router is made up of an array of arrays. For each inner
# array, the first element is a timestamp and the second is a
# status. 0 == Offline and 1 == Online. The status refers to the
# time from the previous timestamp (or 0 if it is the first array)
# to the current timestamp.

# Write a method that takes in a network_array, which is an array
# containing k router arrays, and returns an array of arrays
# representing the network status bar. Treat the network as Offline
# at a given time if ANY router in the array is Offline at that
# time. Feel free to use any language you want.

network_status_data = [
                      [[3, 1], [4, 0], [6, 1]], #router1
                      [[2, 1], [3, 0], [6, 1]],  #router2
                      [[6, 1]],
                     ]
network_status_bar = [[2, 1], [4, 0], [6, 1]] # output of method

# A few helpful pieces of info:
#   1) all devices will enough data (no empty arrays)
#   2) all devices will end at the same timestamp (e.g. 6)
#   3) devices aren't necessarily all of the same length.
#      this is also valid data for network
#   4) Timestamps are Integers and are in Milliseconds

def create_network_status_bar(network_status_data)

  allnets = network_status_data

  ranges = []

  i = 0
  while(i < allnets.length)
    j = 0
    while(j < allnets[i].length)
      if(allnets[i][j][1] == 0)
#       offline until time allnets[i][j][0]
        ranges.push([allnets[i][j][0], allnets[i][j-1][0]])
      else
#       online until time allnets[i][j][0]
      end
      j += 1
    end
    i += 1
  end

  ranges.sort{|a, b| if(a[0] < b[0])return b[0] else return a[0]end}

  currentpair = []
  mergedranges = []
  mergedpair = []

  k = 0
  currentpair = ranges[0]
  while(k < ranges.length)

    if(ranges[k+1][0] > currentpair[1])
#     don't merge it
      mergedranges.push(currentpair)
      currentpair = ranges[k+1]
    else
#     merge it
      if(ranges[k+1][1] > currentpair[1])
        mergedpair = [currentpair[0], ranges[k+1][1]]
      else
        mergedpair = [currentpair[0], currentpair[1]]]
      end
      currentpair = mergedpair
    end


    k+=1

  end

  # [[2,6], [4,5]]
#  [[2,6]]





  # 0 - allnets[0][-1][0] is entire range

  return




end

# offlineranges = [[3,4], [2,3]]


# offlineranges = [[2, 5], [2, 6], [3, 6], [7, 10]]
# mergedofflineranges = [[2,6]]

# current



# [2, 5] [2, 6] 6 > 5, 2 = 2
# [3, 6] [2, 6] 3 > 2, 6 = 6



# total = [[0, 39]]

# if an offline time starts overlap
# then we just want to take greater one
# we can just not worry about anything else that starts and stops in between


# find the lowest offlinerange[i][0]
# put from [offlinerange[i][0], 1]
# put [offlinerange[i][1], 0]
# find next offlinerange[i][0]
#


# expected result = [[2, 1], [6, 0], [39, 1]]
