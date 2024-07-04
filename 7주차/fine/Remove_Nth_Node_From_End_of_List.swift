class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        // 끝에서 몇번째 노드를 제거하기 위해서는 일단 끝나는 위치를 알아야한다. -> 리스트의 길이 추적
        var length = 0
        var current = head 
        while current != nil {
            length += 1
            current = head?.next
        }

        // 뒤에서 k번째 원소의 index = 전체길이(l) - k
        let target = length - n

        // target이 0이 될때는 target.next가 head가 됨  
        if target == 0 {
            return head?.next
        }

        // target의 이전 node를 찾아서 해당 node.next를 node.next.next로 바꿔줘서 연결을 끓어냄
        current = head 
        for _ in 0 ..< (target - 1){
            current = current.next

        }
        current?.next = current?.next?.next

        return head
    }
}
