class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode? = nil
        func recurse(_ curr: ListNode?, _ prev: ListNode?){
            if let temp = curr?.next {
                recurse(curr?.next, curr)
            }else{
                newHead = curr
            }
            curr?.next = prev
        }

        if let first = head{
            recurse(first, nil)
        }else{
            return nil
        }
        return newHead
    }
}