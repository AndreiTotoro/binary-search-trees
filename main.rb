require_relative 'lib/tree'
require_relative 'lib/queue'

tree = Tree.new([1, 7, 4, 23, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(2)
tree.insert(54)
tree.insert(53)
tree.insert(22)
tree.insert(6)

tree.delete(22)
tree.delete(54)
tree.insert(22)
tree.insert(8)
tree.show_tree(tree.root)

shard = Queue.new(7)
shard.push(8)
shard.push(9)
puts shard.root.data
puts shard.end.data
shard.pop
puts shard.root.data
