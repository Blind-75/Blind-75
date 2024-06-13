

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {

 func reorderList(_ head: ListNode?) {

        guard head != nil, head?.next != nil else { return }
        
        // 1. 중간을 찾습니다.
        // slow는 한칸씩 이동하고 
        // fast는 두칸씩 이동하므로 
        // fast가 끝까지 도착하면 slow는 중간지점에 도달 
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // 2. 리스트의 후반부를 뒤집습니다.
        var prev: ListNode? = nil
        var current = slow
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        // 3. 두 개의 리스트를 교차로 병합합니다.
        var first = head
        var second = prev
        while second?.next != nil {
            let temp1 = first?.next
            let temp2 = second?.next
            
            first?.next = second
            second?.next = temp1
            
            first = temp1
            second = temp2
        }
    }
}