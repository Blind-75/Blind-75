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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr: ListNode? = head
        var coming: ListNode? = curr != nil ? curr!.next : nil

        while curr != nil {
            curr!.next = prev
            prev = curr
            curr = coming
            coming = curr != nil ? curr!.next : nil
        }
        return prev
    }
}

