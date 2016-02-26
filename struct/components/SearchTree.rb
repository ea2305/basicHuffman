=begin
    Busqueda de elemntos ordenados y no ordenados
    author : Elihu Alejandro Cruz Albores
    version : 1.0.5  
=end

class SearchTree

    def initialize(root = nil, compare = lamda do |node| return node.getData() end)
        @root = root
        @compare = compare
    end

    def search(value)
        searchAtTree(value, @root)
    end
    
    #Busqueda de elemento en el arbol
    def searchAtTree(value, node)
        if node == nil ## verificamos que le nodo no este vacio
            return nil
        end
    
        temp_compare = @compare.call(value, node)
        
        if(temp_compare == 0) ##Regresamos verdadero cuando encontramos el odo
            return node
        end
        if(temp_compare > 0)
            searchAtTree(value, node.getRight())
        else
            searchAtTree(value, node.getLeft())
        end 
    end
    
    #Busqueda de nodo por contendido, retrona las posiciones
    def method_searchCode(node,search,stack,instruction)
        if node == nil
            stack.pop()
            return false
        else    
            if search == instruction.call(node)
                return true
            else
                stack.push(0)
                if method_searchCode(node.getLeft(),search,stack,instruction) == true
                    return true
                else    
                    stack.push(1)
                    if method_searchCode(node.getRight(),search,stack,instruction) == true
                        return true 
                    end
                end
                stack.pop() ##Si el elemento se encuentra en alguna otra rama
            end
        end
    end
    
    def searchCode(search,instruction)
        if search == nil
            return -1
        else
            myStack = Array.new ##Almacenador del codigo para el arbol
            return (method_searchCode(@root,search,myStack,instruction))? myStack : -1
        end
    end

end