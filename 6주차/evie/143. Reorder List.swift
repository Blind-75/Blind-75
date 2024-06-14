// 두 개의 포인터를 사용한다.
// p1 한 칸씩 이동
// p2 두 칸씩 이동
// p2가 마지막 노드에 도달하면 p1이 도달한 노드(중간)를 기준으로 오른쪽 반의 노드들을 역순으로 뒤집는다.
// 왼쪽 반에 해당하는 노드와 뒤집힌 오른쪽 반의 노드들을 교차로 합한다.

class Solution {
    func reorderList(_ head: ListNode?) {
        guard head != nil && head?.next != nil else { return }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var prev: ListNode? = nil
        var curr: ListNode? = slow
        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }
        
        var first: ListNode? = head
        var second: ListNode? = prev
        
        while second?.next != nil {
            let tmp1: ListNode? = first?.next
            let tmp2: ListNode? = second?.next
            
            first?.next = second
            second?.next = tmp1
            
            first = tmp1
            second = tmp2
        }
    }

    func printList(_ node: ListNode?) {
        var current: ListNode? = node
        while current != nil {
            print(current!.val, terminator: " ")
            current = current?.next
        }
        print()
    }
}