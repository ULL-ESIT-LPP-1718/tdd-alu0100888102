# @author Ángel Hamilton
# Esta clase representa una lista doblemente enlazada

class Lista
    include Enumerable
    
    # Readers
    # @return [head] primer elemento
    # @return [tail] ultimo elemento
    attr_reader :head, :tail
    
    # Estructura de los nodos
    Node = Struct.new(:datos, :sig, :prev)
    
    # Inicialización de la clase
    # @param var [var] valor del nodo inical de la lista. Puede ser cualquier cosa
    def initialize(var)
        node = Node.new(var, nil, nil)
        @head = node
        @tail = node
    end
    
    # Introduce un nodo al final de la lista
    # @param var [var] valor del nodo a introducir en la lista. Puede ser cualquier cosa
    def push_back(var)
        node = Node.new(var, nil, @tail)
        if(@tail != nil)
            @tail.sig = node
        end
        @tail = node
    end
    
    # Introduce un nodo al principio de la lista
    # @param var [var] valor del nodo a introducir en la lista. Puede ser cualquier cosa
    def push_front(var)
        node = Node.new(var, @head, nil)
        if(@head != nil)
            @head.prev = node
        end
        @head = node
    end
    
    # Devuelve el primer valor de la lista
    # @return [var] valor de head. Puede ser cualquier cosa
    def front()
        if(@head == nil)
            return nil
        end
        return @head.datos
    end
    
    # Devuelve el ultimo valor de la lista
    # @return [var] valor de tail. Puede ser cualquier cosa
    def back()
        if(@tail == nil)
            return nil
        end
        return @tail.datos
    end
    
    # Elimina el nodo al principio de la lista y devuelve su valor
    # @return [var] valor del nodo que estaba al principio de la lista. Puede ser cualquier cosa
    def pop_front()
        node = @head
        @head = node.sig
        @head.prev = nil
        if(node == nil)
            return nil
        end
        return node.datos
    end
    
    # Elimina el nodo al final de la lista y devuelve su valor
    # @return [var] valor del nodo que estaba al final de la lista. Puede ser cualquier cosa
    def pop_back()
        node = @tail
        @tail = node.prev
        @tail.sig = nil
        if(node == nil)
            return nil
        end
        return node.datos
    end
    
    # Devuelve el valor del elemento en la posicion N si lo hay. Head es el elemento 0
    # @param n [int] posicion en la lista
    # @return [var] valor del nodo. Puede ser cualquier cosa
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
    
    # Inserta un nodo en la lista en la posicion N, o al final. Head es el elemento 0
    # @param var [var] valor del elemento a introducir. Puede se cualquier cosa
    # @param n [int] posicion en la que se quiere introducir
    def set_element(var, n)
        if(n == 0)
            push_front(var)
            return
        end
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
    
    # Elimina el elemento en la posicion N si lo hay y devuelve su valor. Head es el elemento 0
    # @param n [int] posicion en la lista
    # @return [var] valor del nodo que estaba en la posicion n. Puede ser cualquier cosa
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
    
    # Pasa la lista como un string
    # @return [String] cadena con todos los valores de los nodos formateados
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
    
    # Define que hacer cuando se invoca el each en la lista
    def each
        node = @head
        while(node != nil) do
            yield node.datos
            node = node.sig
        end
    end
end