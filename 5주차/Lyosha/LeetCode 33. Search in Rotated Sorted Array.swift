class Solution {
    func isSorted(_ left: Int, _ right: Int, _ nums: [Int]) -> Bool{
        if nums[left] < nums[right] {
            return true
        }
        return false
    }

    func findMin( _ left: Int, _ right: Int, _ nums: [Int]) -> Int {
        let mid = (left+right) / 2 
        if (right-left <= 2) {
            var valDict:[Int: Int] = [:]
            for (_, index) in [left, mid, right].enumerated() {
                valDict[nums[index], default: 0] = index
            }
            let sortedDict = valDict.sorted { $0.key < $1.key }
            return sortedDict.first!.value
        }

        let leftSorted = self.isSorted(left, mid, nums)
        let rightSorted = self.isSorted(mid, right, nums)

        if (leftSorted && rightSorted) {
            return left
        }

        if (!leftSorted && rightSorted) {
            return self.findMin(left, mid, nums)
        }

        if (leftSorted && !rightSorted) {
            return self.findMin(mid, right, nums)
        }
        return -1
    }


    func BinarySearch(_ left: Int, _ right : Int, _ target: Int, _ nums: [Int]) -> Int {
        let mid = (left + right) / 2
        if (right - left <= 2) {
            var valDict:[Int: Int] = [:]
            for (_, index) in [left, mid, right].enumerated() {
                valDict[nums[index], default: 0] = index
            }
            if valDict.contains{$0.key == target}{
                return valDict[target]!
            }
            return -1
        }

        if (nums[mid] == target) {
            return mid
        }

        else if (nums[mid] < target) {
            return self.BinarySearch(mid, right, target, nums)
        }

        else if (nums[mid] > target) {
            return self.BinarySearch(left, mid, target, nums)
        }

        return -1
    }

    func search(_ nums: [Int], _ target: Int) -> Int {
        let minIndex = self.findMin(0, nums.count-1, nums)
        let leftResult = self.BinarySearch(0, max(0, minIndex-1), target, nums)
        let rightResult = self.BinarySearch(minIndex, nums.count-1, target, nums)
        if (leftResult == -1 && rightResult == -1) {
            return -1
        }
        return max(leftResult, rightResult)
    }
}