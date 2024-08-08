
import Foundation

class MedianFinder {
    private var maxHeap: Heap<Int>
    private var minHeap: Heap<Int>
    
    init() {
        self.maxHeap = Heap<Int>(sort: >)
        self.minHeap = Heap<Int>(sort: <)
    }
    
    func addNum(_ num: Int) {
        if maxHeap.isEmpty || num < maxHeap.peek()! {
            maxHeap.insert(num)
        } else {
            minHeap.insert(num)
        }
        
        // 균형 맞추기
        if maxHeap.count > minHeap.count + 1 {
            minHeap.insert(maxHeap.remove()!)
        } else if minHeap.count > maxHeap.count {
            maxHeap.insert(minHeap.remove()!)
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.count == minHeap.count {
            return Double(maxHeap.peek()! + minHeap.peek()!) / 2.0
        } else {
            return Double(maxHeap.peek()!)
        }
    }
}


// 힙(Heap) 구현
struct Heap<Element> {
    var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(from: 0)
        }
        return element
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            if leftChild < count && sort(elements[leftChild], elements[candidate]) {
                candidate = leftChild
            }
            if rightChild < count && sort(elements[rightChild], elements[candidate]) {
                candidate = rightChild
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}






/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */