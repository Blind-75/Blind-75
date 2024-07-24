class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }

        if list2 == nil {
            return list1
        }

        var head: ListNode? = nil
        if list1!.val <= list2!.val {
            head = list1
        } else {
            head = list2
        }
    
        var pointer1 = list1
        var pointer2 = list2

        while pointer1 != nil && pointer2 != nil {
            //이 swap을 통해 pointer1.val <= pointer2.val이 보장됨
            if pointer2!.val < pointer1!.val {
                var temp = pointer1
                pointer1 = pointer2
                pointer2 = temp
            }

            var temp1 = pointer1!.next
            var temp2 = pointer2!.next

            if pointer1!.next == nil {
                pointer1!.next = pointer2
                pointer1 = nil
                continue    
            }

            //pointer2가 pointer1의 두 원소 사이에 들어갈 수 있는 경우
            //pointer1의 두 원소 사이에 들어갈 수 있는 모든 pointer2의 끝 인덱스까지 가야함

            if pointer1!.val <= pointer2!.val && pointer2!.val <= pointer1!.next!.val {
                pointer1!.next = pointer2
                 while (pointer2!.next != nil && pointer2!.next!.val <= temp1!.val) {
                    pointer2 = pointer2!.next
                    temp2 = temp2!.next
                 }
                pointer2!.next = temp1

                //pointer를 한칸씩 당기기
                pointer2 = temp2
                pointer1 = temp1
            }
            else { 
                pointer1 = pointer1!.next
            }
        }

        return head
    }
}