
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

 
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // head의 이전 노드는 없는 상태로 시작 
        var prev: ListNode? = nil 
        var current = head

        while current != nil{
            let next = current?.next // 다음 노드 저장
            current?.next = prev // 다음노드의 next를 이전 노드 prev로 바꾸기 
            prev = current // 현재 node를 이전 노드 prev로 바꾸고 
            current = next  //다음 노드로 현재 노드를 바꿔 다음 노드를 고려 
        }
        return prev 
    }

}