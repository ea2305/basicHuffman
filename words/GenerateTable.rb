#author : Elihu Alejandro Cruz Albores
#version 1.0.2
##Genera un vecotor de objetos de tipo Information, con el numero de repeticiones y el caracter.

class GenerateTable

    def initialize
    end

    ##Obtiene el numero de repeticiones del conjunto de datos por caracter
    #Y carga los datos al objeto Information del array
    def get_Table(value, elements)
        #arr_data = values.clone #recivimos el arreglo de elementos y copiamos
        countArray = Array.new()
        array = value.split("")

        for i in 0..(elements.length - 1)
            elements[i].setTimes(array.count(elements[i].getCode()))##Cargamos los datos al objeto Inormation
        end
        return elements
    end
end
