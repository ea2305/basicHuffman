#Generete class for get all letters in string 

class Compare

    def allChars(validator)
        myArray = Array.new#declaracion array
        myChar = validator.split("")
    
        while myChar.length != 0 do
            current = myChar[0]#Cargamos el elemento a remover
            
            myChar -= [current]#quitamos todos los elementos del array
            
            myArray.push(current)
        end
        return myArray
    end 
end