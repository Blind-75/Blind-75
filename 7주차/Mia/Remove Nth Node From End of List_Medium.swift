class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p2 = head
        var p1: ListNode? = nil
        for i in 1..<n{
            p2 = p2?.next
        }
        while p2?.next != nil{
            if p1 == nil{
                p1 = head
            }else{
                p1 = p1?.next
            }
            p2 = p2?.next 
        }
        if p1 != nil {
            p1?.next = p1?.next?.next
        }else{
            return head?.next
        }
        return head
    }
}