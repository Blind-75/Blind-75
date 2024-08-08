

class MedianFinder {
    typealias HeapComparator<Int> = (Int, Int) -> Bool
    var maxHeap: Heap
    var minHeap: Heap

    init() {
        maxHeap = Heap(comparator: >)
        minHeap = Heap(comparator: <)
    }
    
    func addNum(_ num: Int) {
        if maxHeap.size == 0 || num <= maxHeap.peek(){
            maxHeap.insert(num)
        }else{
            minHeap.insert(num)
        }
        if (maxHeap.size - minHeap.size) == 2{
            minHeap.insert(maxHeap.remove())
        }
        if (minHeap.size - maxHeap.size) == 2{
            maxHeap.insert(minHeap.remove())
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.size == minHeap.size{
            return Double(maxHeap.peek() + minHeap.peek()) / 2
        }else if maxHeap.size > minHeap.size{
            return Double(maxHeap.peek())
        }else if minHeap.size > maxHeap.size{
            return Double(minHeap.peek())
        }
        return 0.0
    }

    class Heap{
        var elements: [Int] = []
        var size: Int{
            elements.count
        }

        var comparator: HeapComparator<Int>

        init(comparator: @escaping HeapComparator<Int>){
            self.comparator = comparator
        }

        func heapify(_ idx: Int){
            var left = idx * 2 + 1
            var right = idx * 2 + 2 
            
            var comp = idx 

            if size > left && comparator(elements[left], elements[comp]){
                comp = left 
            }
            if size > right && comparator(elements[right], elements[comp]){
                comp = right 
            }

            if idx != comp{
                elements.swapAt(comp, idx)
                heapify(comp)
            }
        }

        func bubbleUp(_ idx: Int){
            var parent = (idx - 1) / 2

            if comparator(elements[idx], elements[parent]){
                elements.swapAt(parent, idx)
                bubbleUp(parent)
            }
        }

        func peek() -> Int{
            return elements[0]
        }

        func insert(_ element: Int){
            elements.append(element)
            bubbleUp(size - 1)
        }

        func remove() -> Int{
            var top = elements[0]

            let last = elements.removeLast()

            if !elements.isEmpty{
                elements[0] = last
                heapify(0)
            }
            return top
        }
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */