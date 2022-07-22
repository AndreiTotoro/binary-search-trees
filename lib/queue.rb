require_relative 'node'
class Queue
  def initialize(root_value)
    new_node = QueueNode.new(root_value)
    @root = new_node
    @end = new_node
  end

  def push(node_data)
    new_node = QueueNode.new(node_data)
    @end.next_node = new_node
    @end = new_node
  end

  def pop
    @root = @root.next_node
  end

  attr_reader :root, :end
end
