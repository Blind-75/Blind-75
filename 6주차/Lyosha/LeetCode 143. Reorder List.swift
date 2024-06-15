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
    func numNodes(_ head: ListNode?) -> Int{
        var count = 1
        var temp = head
        while (temp != nil && temp!.next != nil) {
            count += 1
            temp = temp!.next
        }
        return count
    }

    func reverseListAfterMiddle(_ head: ListNode?) -> ListNode? {
      var prev: ListNode? = nil
      var curr = head
      while curr != nil {
        var temp = curr!.next
        curr!.next = prev
        prev = curr
        curr = temp
      }
      return prev
    }

    func mergeLists(_ list1: ListNode?, _ list2: ListNode?) {
      var p1 = list1
      var p2 = list2

      while (p1 != nil && p2 != nil) { 
        var temp1 = p1!.next
        var temp2 = p2!.next
        p1!.next = p2
        p2!.next = temp1
        p1 = temp1
        p2 = temp2
      }
    }


    func reorderList(_ head: ListNode?) {
        let numNodes = self.numNodes(head)
        var count = 0
        var pointer = head
        var prev: ListNode? = nil
        while count != numNodes / 2 + numNodes % 2 {
            prev = pointer
            pointer = pointer!.next
            count += 1
        }
        prev!.next = nil

        let reversedListAfterMiddle = self.reverseListAfterMiddle(pointer)
        self.mergeLists(head, reversedListAfterMiddle)
    }
}