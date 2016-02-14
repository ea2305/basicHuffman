##Genera un arbol binario con los datos del vector de Objetos 
#Infomation, generando las rams del arbol con base en el algoritmo de Huffman

class GenerateCode

    def initialize
    end

    #Genera un arbol con los datos del vector 
    #suma elementos para creacion de un nodo padre comun
    #se da por hecho que el vector se encuentra ordenado ? aun por confirmar
        #===>Posible incirporacion de llamada a ordenamiento
    def makeTree(vector)
    
        new_vector = vector.clone
        
        while(new_vector.length == 1) do
            
            parent_inf = new_vector[0].getData() + new_vector[1].getData()
            
            node_temp = Node.new(parent_inf,new_vector[0],new_vector[1])
            
            new_vector.slice(2..new_vector.length)
            
            new_vector.unshift(node_temp)
        
        end
        
        return 
        
    end
    
end