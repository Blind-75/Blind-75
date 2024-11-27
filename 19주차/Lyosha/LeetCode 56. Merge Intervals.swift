    class Solution {
    func isMergeable(_ interval1: [Int], _ interval2: [Int]) -> Bool {
            if interval1[0] <= interval2[0] {
                if interval2[0] <= interval1[1] {
                    return true
                }
                return false
            } else {
                if interval1[0] <= interval2[1] {
                    return true
                }
                return false
            }
        }

        func mergeInterval(_ interval1: [Int], _ interval2: [Int] ) -> [Int] { 
            return [min(interval1[0], interval2[0]), max(interval1[1], interval2[1])]
        }

        func merge(_ intervals: [[Int]]) -> [[Int]] {
            var sortedIntervals = intervals.sorted{ $0[0] < $1[0] }
            print(sortedIntervals)
            var mystack: [[Int]] = []

            for interval in sortedIntervals { 
                if mystack.isEmpty { 
                    mystack.append(interval)
                    continue
                }

                let top = mystack[mystack.count-1] 
                if isMergeable(top, interval){
                    mystack.removeLast()
                    let mergedInterval = mergeInterval(top, interval)
                    mystack.append(mergedInterval)
                } else { 
                    mystack.append(interval)
                }
            }

            return mystack
        }

    } 