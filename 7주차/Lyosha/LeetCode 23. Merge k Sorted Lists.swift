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

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        // Make a mutable copy of the lists
        var lists = lists
        var myqueue = [(Int, Int)]()
        
        // Initialize the priority queue
        for (i, list) in lists.enumerated() {
            if let node = list {
                myqueue.append((node.val, i))
            }
        }
        
        // Transform the array into a heap
        myqueue.sort { $0.0 < $1.0 }
        
        var head: ListNode? = nil
        var curr: ListNode? = nil
        
        // Return nil if the queue is empty
        if myqueue.isEmpty {
            return head
        }
        
        // Pop the smallest element from the heap
        let (val, i) = myqueue.removeFirst()
        head = lists[i]
        curr = head
        lists[i] = lists[i]?.next
        
        // If the list is not empty, push the next element to the heap
        if let node = lists[i] {
            insertHeap(&myqueue, (node.val, i))
        }
        
        // Process the heap
        while !myqueue.isEmpty {
            let (val, i) = myqueue.removeFirst()
            curr?.next = lists[i]
            curr = lists[i]
            lists[i] = lists[i]?.next
            
            if let node = lists[i] {
                insertHeap(&myqueue, (node.val, i))
            }
        }
        
        return head
    }
    
    // Helper function to maintain the heap property
    private func insertHeap(_ heap: inout [(Int, Int)], _ element: (Int, Int)) {
        heap.append(element)
        heap.sort { $0.0 < $1.0 }
    }
}