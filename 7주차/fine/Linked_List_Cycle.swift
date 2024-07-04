
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }

extension ListNode: Hashable { 
        public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution{
    func hasCycle(_ head: ListNode?) -> Bool {
        // HashSet을 이용하여 방문한 노드 기록
        var visitedNodes = Set<ListNode>()
    
        var current = head
        while current != nil {
            // 현재 노드가 이미 HashSet에 있으면 사이클이 존재함
            if visitedNodes.contains(current!) {
                return true
            }
        
            // 현재 노드를 HashSet에 추가
            visitedNodes.insert(current!)
        
            // 다음 노드로 이동
            current = current?.next
        }
    
        // 루프를 종료하면 사이클이 없음
        return false
    }

    func fluidCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head 

        while let fastNode = fast , let nextFastNode = fastNode.next {
            slow = slow?.next
            fast = nextFastnode.next 

            if slow == fast {
                return true
            }
        }

        return false 
    }
}