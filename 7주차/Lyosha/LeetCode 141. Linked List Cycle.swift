/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
 extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var seen = Set<ListNode?>()
        var curr = head
        while (curr != nil) {
            if seen.contains(curr) {
                return true
            }
            seen.insert(curr!)
            curr = curr!.next
        }
        return false
    }
}