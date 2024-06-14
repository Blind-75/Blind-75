class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // 더미 노드를 생성하여 결과 리스트의 시작점을 추적한다.
        let dummy = ListNode(0)
        // 더미 노드를 초기화
        var curr = dummy

        // list1과 list2의 현재 노드를 가리키고 초기화
        var p1 = list1
        var p2 = list2

        // p1과 p2가 nil이 될 때까지 값을 비교하고 작은 값을 가진 노드를 curr의 다음 노드로 설정하고 포인터를 이동
        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                curr.next = p1
                p1 = p1!.next
            } else {
                curr.next = p2
                p2 = p2!.next
            }
            curr = curr.next!
        }

        // 남은 노드를 처리
        if p1 != nil {
            curr.next = p1
        } else if p2 != nil {
            curr.next = p2
        }

        // 더미 노드의 다음 노드를 반환하여 병합된 리스트를 반환한다.
        return dummy.next
    }
}