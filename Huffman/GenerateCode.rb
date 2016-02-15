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
        index = 0
    
        new_vector = Array.new()
        
        for x in vector
            puts" #{x.getTimes()} \n"
            new_vector.push(Node.new(x))
        end
        
        puts "#{new_vector}\n\n"
        
        while(new_vector.length != 1) do
            
            parent_times = new_vector[0].getData().getTimes() + new_vector[1].getData().getTimes()
            parent_code = new_vector[0].getData().getCode() + new_vector[1].getData().getCode()
            
            puts "\n #{parent_times} ::: \n #{parent_code}"
            
            parent_inf = Information.new(parent_code, parent_times)
            
            node_temp = Node.new(parent_inf,new_vector[0],new_vector[1])
            
            new_vector.shift()
            
            new_vector[0] = node_temp
            index += 1
            puts "::: #{(index)}"
        
        end
        
        return new_vector[0]
        
    end
    
end