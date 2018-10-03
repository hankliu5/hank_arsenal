  class PriorityQueue
    attr_reader :elements

    def initialize(min=true)
      @elements = []
      @is_min_heap = min
    end

    def <<(element)
      @elements << element
      bubble_up(@elements.size - 1)
    end

    def pop
      exchange(0, @elements.size - 1)
      min = @elements.pop
      bubble_down(0)
      min
    end

    def top
      @elements[0]
    end

    def empty?
      return @elements.empty?
    end

    def min_heap?
      @is_min_heap
    end

    private

    def bubble_up(index)
      parent_index = (index - 1) / 2

      return if index <= 0
      return if @is_min_heap && @elements[parent_index] <= @elements[index]
      return if !@is_min_heap && @elements[parent_index] >= @elements[index]

      exchange(index, parent_index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      right_child_index = (index + 1) * 2

      left_element = @elements[right_child_index - 1]
      right_element = @elements[right_child_index]

      return if left_element.nil? && right_element.nil?

      target_child_index = right_child_index - 1
      if !right_element.nil?
        if @is_min_heap && right_element < left_element
          target_child_index = right_child_index
        elsif !@is_min_heap && right_element > left_element
          target_child_index = right_child_index
        end
      end
      
      return if @is_min_heap && @elements[index] <= @elements[target_child_index]
      return if !@is_min_heap && @elements[index] >= @elements[target_child_index]

      exchange(index, target_child_index)
      bubble_down(target_child_index)
    end

    def exchange(source, target)
      @elements[source], @elements[target] = @elements[target], @elements[source]
    end
  end
