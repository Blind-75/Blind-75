// public class Node {
//       public var val: Int
//       public var neighbors: [Node?]
//       public init(_ val: Int) {
//           self.val = val
//           self.neighbors = []
//       }
//   }


class Solution {
    func bfs(_ myqueue: inout [Node?], _ visited: inout Set<Node>, _ adjList: inout [Int: [Int]]){
        while !myqueue.isEmpty {
            var curr = myqueue.removeFirst()
            visited.insert(curr!)
            print(curr!.val)
            
            for neighbor in curr!.neighbors {
                if let neighbor = neighbor {
                    if visited.contains(neighbor) {
                        continue
                    }
                    myqueue.append(neighbor)
                    if !adjList[curr!.val, default: []].contains(neighbor.val) {
                        adjList[curr!.val, default: []].append(neighbor.val)
                    }
                    if !adjList[neighbor.val, default: []].contains(curr!.val) {
                        adjList[neighbor.val, default: []].append(curr!.val)
                    }
                }
            }
        }
    }
    
    func reconstructGraph(_ adjList: inout [Int: [Int]]) -> Node {
        var visited: Set<Node> = []
        var node_dict: [Int: Node] = [:]
        for (val, items) in adjList {
            if node_dict[val] == nil {
                node_dict[val] = Node(val)
            }
            var curr = node_dict[val]
            for item in items {
                if node_dict[item] == nil {
                    node_dict[item] = Node(item)
                }
                var neighbor = node_dict[item]
                curr!.neighbors.append(neighbor)
                // neighbor!.neighbors.append(curr)
            }
        }
        return node_dict[1]!
    }
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard var node = node else {
            return nil
        }

        if node.neighbors.count == 0 {
            return Node(node.val)
        }
        
        var adjList: [Int: [Int]] = [:]
        var visited: Set<Node> = []
        
        var myqueue: [Node?] = [node]
        //adjList 생성하기
        self.bfs(&myqueue, &visited, &adjList)
        
        //adjList 바탕으로 reconstruct
        let root = self.reconstructGraph(&adjList)
        return root
    }
}
