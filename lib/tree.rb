require_relative 'node'

class Tree
  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(@data)
  end

  attr_reader :root

  def build_tree(array)
    return nil if array.empty?

    middle = (array.size - 1) / 2
    root_node = Node.new(array[middle])

    root_node.left_child = build_tree(array[0...middle])
    root_node.right_child = build_tree(array[(middle + 1)..-1])

    root_node
  end

  def show_tree(node, prefix = '', is_left = true)
    show_tree(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    show_tree(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end