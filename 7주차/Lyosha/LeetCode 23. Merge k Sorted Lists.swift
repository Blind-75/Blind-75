import Foundation

// // Definition for singly-linked list.
// public class ListNode {
//     public var val: Int
//     public var next: ListNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.next = nil
//     }
// }

// A custom tuple type that conforms to Comparable
struct ListNodeIndex: Comparable {
    let value: Int
    let index: Int
    
    static func < (lhs: ListNodeIndex, rhs: ListNodeIndex) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func == (lhs: ListNodeIndex, rhs: ListNodeIndex) -> Bool {
        return lhs.value == rhs.value
    }
}

// A Min-Heap implementation in Swift
struct Heap<T: Comparable> {
    var elements: [T] = []
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let value = elements.removeLast()
        siftDown(0)
        return value
    }
    
    private mutating func siftUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && child < elements[parentIndex] {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        
        elements[childIndex] = child
    }
    
    private mutating func siftDown(_ index: Int) {
        let count = elements.count
        var parentIndex = index
        let parent = elements[parentIndex]
        
        while true {
            var minIndex = parentIndex
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            
            if leftChildIndex < count && elements[leftChildIndex] < elements[minIndex] {
                minIndex = leftChildIndex
            }
            if rightChildIndex < count && elements[rightChildIndex] < elements[minIndex] {
                minIndex = rightChildIndex
            }
            if minIndex == parentIndex {
                return
            }
            
            elements[parentIndex] = elements[minIndex]
            parentIndex = minIndex
        }
        
        elements[parentIndex] = parent
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        var heap = Heap<ListNodeIndex>()
        
        for (i, list) in lists.enumerated() {
            if let node = list {
                heap.insert(ListNodeIndex(value: node.val, index: i))
            }
        }
        
        let dummy = ListNode(0)
        var curr: ListNode? = dummy
        
        while let listNodeIndex = heap.remove() {
            curr?.next = lists[listNodeIndex.index]
            curr = lists[listNodeIndex.index]
            lists[listNodeIndex.index] = lists[listNodeIndex.index]?.next
            if let node = lists[listNodeIndex.index] {
                heap.insert(ListNodeIndex(value: node.val, index: listNodeIndex.index))
            }
        }
        
        return dummy.next
    }
}
