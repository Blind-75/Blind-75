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

class Solution {
    var mystack: [TreeNode] = []

    func getPath(_ node: TreeNode) -> Bool? {
        if (self.mystack.count != 0) && (self.mystack[self.mystack.count-1].val == node.val) { 
            return true
        } else {
            let top = self.mystack[self.mystack.count-1]
            if top.left != nil {
                self.mystack.append(top.left!)
                if self.getPath(node) != nil{
                    return true
                }
                self.mystack.popLast()
            }

            if top.right != nil {
                self.mystack.append(top.right!)
                if self.getPath(node) != nil{
                    return true
                }
                self.mystack.popLast()
            }
        }
        return nil
    }

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        self.mystack = [root!]
        self.getPath(p!)
        var pathToP: [Int] = []
        for (i, item) in self.mystack.enumerated() {
            pathToP.append(item.val)
        }

        self.mystack = [root!]
        self.getPath(q!)
        var pathToQ: [Int] = []
        for (i, item) in self.mystack.enumerated(){
            pathToQ.append(item.val)
        }
        print(pathToP, pathToQ)

        let limit = min(pathToP.count, pathToQ.count)
        var i = 0
        while i != limit {
            if pathToP[i] == pathToQ[i] { 
                i += 1
                continue
            }
            break
        }    
        return self.mystack[i-1]

    }
}