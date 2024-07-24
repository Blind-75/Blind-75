/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var traversalOrder: [[Int]] = [[root.val]]
        var roots: [TreeNode?] = [root]
        while roots.count != 0 {
            var nextRoots: [TreeNode] = []
            var nextLevelOrder: [Int] = []
            for (_, root) in roots.enumerated(){
                if root == nil {
                    continue
                }
                if root!.left != nil { 
                    nextLevelOrder.append(root!.left!.val)
                    nextRoots.append(root!.left!)
                }
                if root!.right != nil {
                    nextLevelOrder.append(root!.right!.val)
                    nextRoots.append(root!.right!)
                }
            }
            if nextLevelOrder.count != 0 {
                traversalOrder.append(nextLevelOrder)
            }
            roots = nextRoots
        }
        return traversalOrder
    }
}