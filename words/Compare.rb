#author : Elihu Alejandro Cruz Albores
#version 1.0.2
#Generador de elementos existentes,
#Obtiene todos los caracteres existentes dentro del array


class Compare

    def allChars(validator)
        myArray = Array.new#declaracion array
        myChar = validator.split("")

        while myChar.length != 0 do
            temp = Information.new
            temp.setCode(myChar[0])#Cargamos el elemento a remover
            
            myChar -= [temp.getCode()]#quitamos todos los elementos del array
            myArray.push(temp)
        end

        return myArray
    end
end
