/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    var visited = [Int: Node]()
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        // 이미 복사한 노드인 경우 반환
        if let existingNode = visited[node.val] {
            return existingNode
        }
        
        // 새 노드 생성 및 방문 기록
        let newNode = Node(node.val)
        visited[node.val] = newNode
        
        // 이웃 노드들 복사
        for neighbor in node.neighbors {
            if let clonedNeighbor = cloneGraph(neighbor) {
                newNode.neighbors.append(clonedNeighbor)
            }
        }
        
        return newNode
    }
}