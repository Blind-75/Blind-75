/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
//https://leetcode.com/problems/serialize-and-deserialize-binary-tree/ 

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {return ""}
        
        var arr: [String] = []
        var myqueue: [TreeNode?] = [root]
        
        while !myqueue.isEmpty { 
            let curr = myqueue.removeFirst()
            if let curr = curr {
                arr.append(String(curr.val))
                myqueue.append(curr.left)
                myqueue.append(curr.right)
            } else { 
                arr.append("nil")
                continue
            }
        }

        return arr.joined(separator: " ")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var arr: [Int?] = data.components(separatedBy: " ").map { a in
            if a == "nil" {
                return nil
            } else {
                return Int(a)
            }
        }

        if arr.isEmpty { 
            return nil
        }
        var root: TreeNode?
        let rootVal = arr.removeFirst()
        if let rootVal = rootVal { 
            root = TreeNode(rootVal)
        } else { return nil }
        
        var mystack: [TreeNode?] = [root]
        while !mystack.isEmpty { 
            var curr = mystack.removeFirst()
            guard let curr = curr else { continue }

            let left_value = arr.removeFirst()
            if let left_value = left_value {
                curr.left = TreeNode(left_value)
            } else { 
                curr.left = nil
            }

            let right_value = arr.removeFirst()
            if let right_value = right_value { 
                curr.right = TreeNode(right_value)
            } else { 
                curr.right = nil
            }
            mystack.append(curr.left)
            mystack.append(curr.right)
        } 

        return root

    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))