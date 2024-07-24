class Solution {
    func reorderList(_ head: ListNode?) {
        var head1 = head 
        var head2 = head

        while head2?.next != nil{
            head1 = head1?.next
            head2 = head2?.next?.next
        }

        var list1 = head
        var list2 = head1
        reverseList(list2, nil)

        while list2?.next != nil{
            var temp1 = list1?.next
            list1?.next = list2

            list1 = temp1
            temp1 = list2?.next
            list2?.next = list1
            list2 = temp1
        }

        func reverseList(_ curr: ListNode?, _ prev: ListNode?){
            if curr?.next != nil{
                reverseList(curr?.next, curr)
            }else{
                list2 = curr
            }
            curr?.next = prev
        }
    }
}