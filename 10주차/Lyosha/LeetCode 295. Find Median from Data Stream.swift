//https://leetcode.com/problems/find-median-from-data-stream/

class MedianFinder {
    var arr: [Int] = []

    init() {
        self.arr = []
    }

    func binarySearch(_ left: Int, _ right: Int, _ target: Int) -> Int {
        if left >= right {
            return target > arr[left] ? left + 1 : left
        }
        let mid = (left + right) / 2
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            return binarySearch(mid + 1, right, target)
        } else {
            return binarySearch(left, mid - 1, target)
        }
    }


    func addNum(_ num: Int) {
        if self.arr.count == 0 { 
            self.arr.append(num)
            return
        }

        var index = self.binarySearch(0, self.arr.count == 0 ? 0: self.arr.count-1, num)
        self.arr.insert(num, at: index)
    }
    
    func findMedian() -> Double {
        if self.arr.count == 0 { 
            return 0
        }
        var index = self.arr.count / 2
        if self.arr.count % 2 == 0 {
            return Double(self.arr[index-1] + self.arr[index]) / 2 
        }

        else {
            return Double(self.arr[index]) 
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */