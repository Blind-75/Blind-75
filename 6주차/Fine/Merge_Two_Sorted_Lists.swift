public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

class Solution {
     func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // 더미 헤드를 만들어주지 않으면 두 리스트중에 더 작은것을 먼저 고르는 절차가 필요하므로 
        // 더미헤드를 만들어 current에 놓고 시작 
        let dummy = ListNode(0)
        var current: ListNode? = dummy
        
        var l1 = list1
        var l2 = list2
        
        // 두 리스트가 모두 nil이 될 때까지 반복
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current?.next = l1
                l1 = l1?.next
            } else {
                current?.next = l2
                l2 = l2?.next
            }
            current = current?.next
        }
        
        // 남아있는 노드를 처리 
        if l1 != nil {
            current?.next = l1
        } else if l2 != nil {
            current?.next = l2
        }
        
        // 더미 헤드의 다음 노드 반환
        return dummy.next
    }
}ㅣ