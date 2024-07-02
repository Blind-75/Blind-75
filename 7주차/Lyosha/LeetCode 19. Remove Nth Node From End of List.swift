// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
 
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var prev: ListNode? = nil
        var curr: ListNode? = head
        var numNodes: Int = 0
        while (curr != nil){
            numNodes += 1
            prev = curr
            curr = curr!.next
        }

        var count = 0
        prev = nil
        curr = head
        var answer: ListNode? = head
        while (curr != nil) { 
            count += 1
            if (count == numNodes-n+1){ 
                if (prev != nil){
                    prev!.next = curr!.next
                } else {
                    answer = answer!.next
                }
                curr = curr!.next
                break
            }
            prev = curr
            curr = curr!.next
        }
        return answer

    }
}