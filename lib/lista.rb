class Lista
    include Enumerable
    
    attr_reader :head, :tail
    Node = Struct.new(:datos, :sig, :prev)
    
    def initialize(var)
        node = Node.new(var, nil, nil)
        @head = node
        @tail = node
    end
    
    def push_back(var)
        node = Node.new(var, nil, @tail)
        if(@tail != nil)
            @tail.sig = node
        end
        @tail = node
    end
    
    def push_front(var)
        node = Node.new(var, @head, nil)
        if(@head != nil)
            @head.prev = node
        end
        @head = node
    end
    
    def front()
        if(@head == nil)
            return nil
        end
        return @head.datos
    end
    
    def back()
        if(@tail == nil)
            return nil
        end
        return @tail.datos
    end
    
    def pop_front()
        node = @head
        @head = node.sig
        @head.prev = nil
        if(node == nil)
            return nil
        end
        return node.datos
    end
    
    def pop_back()
        node = @tail
        @tail = node.prev
        @tail.sig = nil
        if(node == nil)
            return nil
        end
        return node.datos
    end
    
    def element(n)
        node = @head
        n.times do
            node = node.sig
        end
        if(node == nil)
            return nil
        end
        return node.datos
    end
    
    def set_element(var, n)
        pnode = @head
        (n-1).times do
            pnode = pnode.sig
        end
        if(pnode == @head)
            push_front(var)
        elsif(pnode == nil)
            push_back(var)
        else
            nnode = pnode.sig
            node = Node.new(var, nnode, pnode)
            pnode.sig = node
            nnode.prev = node
        end
    end
    
    def pop_element(n)
        node = @head
        n.times do
            node = node.sig
        end
        if(node == nil)
            return nil
        else
            pnode = node.prev
            nnode = node.sig
            if(pnode == nil)
                return pop_front()
            end
            if(nnode == nil)
                return pop_back()
            end
            pnode.sig = nnode
            nnode.prev = pnode
        end
        return node.datos
    end
    
    def to_s()
        toprint ="{\n"
        node = @head
        while(node != nil) do
            toprint += "#{node.datos}\n"
            node = node.sig
        end
        toprint += "}"
        return toprint
    end
    
    def each
        node = @head
        while(node != nil) do
            yield node.datos
            node = node.sig
        end
    end
end