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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0{
            return nil
        }

        if preorder.count == 1{
            return TreeNode(preorder[0])
        }

        let rootVal = preorder[0]
        guard let i = inorder.firstIndex(of: rootVal) else {return nil}
        let leftNodeCounts = i

        let leftInorders = Array(inorder[0..<i])
        let rightInorders = Array(inorder[i+1..<inorder.count])

        let leftPreorders = Array(preorder[1..<leftNodeCounts+1])
        let rightPreorders = Array(preorder[1+leftNodeCounts..<preorder.count])

        let root = TreeNode(rootVal)
        root.left = self.buildTree(leftPreorders, leftInorders)
        root.right = self.buildTree(rightPreorders, rightInorders)

        return root
    }
}