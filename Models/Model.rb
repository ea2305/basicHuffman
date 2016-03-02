class Model
    def initialize()
        @tableGenerate = GenerateTable.new  #generamos la instancia del objeto
        @codeGenerate = GenerateCode.new #Generador de codigo de huffman
        @compare = Compare.new #Comparador de elementos del array
        @sort = SortChars.new #ordenamiento de elementos.. Pendiente simplificacion...
        @decod = GetCode.new

        @codeToEncode = ""
        @codeToDecode = ""
        @treeToEncode = nil
        tableFrec = nil
        @tableTransform = nil
    end

    def readFileEnc()
        #pendiente...
        nameFile = getText()
        puts
        reader = Files.new(nameFile)

        #Cargamos los datos en la clase para trabajar
        @codeToEncode = reader.readLines()#Pendiente exception
        puts "Datos cargados correctamente"
    end

    def loadData()
        text = getText()
        @codeToEncode = text
    end

    def getFrec_Table()

        if @codeToEncode != nil
            sortTable = getAllTable()
            puts "\nTabla de Frecuencias : \n"
            sortTable.each do |e|
                puts " > [ #{e.getCode()} :: #{e.getTimes()} ]"
            end
            puts
        end
    end

    #Obtiene lo datos de la tabla con las frecuencias ordenadas
    def getAllTable()
        #Obtenemos las letras sin de la cadena
        allChars = @compare.allChars(@codeToEncode)
        #Generamos la tabla por sin orden
        tableChars = @tableGenerate.get_Table(@codeToEncode,allChars)
        #ordenamos la tabla
        return @sort.shortElements(tableChars)
    end

    def getHuffmanTree
        if @codeToEncode != ""
            # Creamos el metodo de impresion del arbol
            myLambda = lambda {|node| puts ">> : #{node.getData().getCode()}" }

            if @tableFrec == nil
                table = getAllTable()
            end
            ##Obtenemos el nodo raiz para el arbol
            @treeToEncode = Tree.new(@codeGenerate.makeTree(table),myLambda)

            puts "\n\t*Datos Cargados correctamente:"
            @treeToEncode.preOrder(myLambda)##print tree
            puts
        else
            puts "\n\t* Es necesario Cargar o introducir un texto para continuar.\n"
        end
    end

    def getTransformTable

        if @codeToEncode != nil
            if @tableFrec == nil
                table = getAllTable()
            end
            puts "\t*Tabla de Transformacion : \n"
            #generamos la tabla de transformacion
            @tableTransform = @codeGenerate.makeTable_Char(table,@treeToEncode)
            (@tableTransform.size).times do |i|
                puts "#{@tableTransform[i].getCode()} :: #{@tableTransform[i].getTimes()}"
            end
            puts
        end
    end

    def generateCode()
        file = getText("Introduzca nombre de Archivo a escribir")
        writer = Files.new(file)

        text = getText("Introduzca el mensaje a codificar, utilizando caracteres del mensaje")
        code = @codeGenerate.getCode(@treeToEncode,text)
        code.delete("\n")
        writer.writeLines(file,code.join)

    end

    def readFileDec
        #pendiente...
        nameFile = getText()
        puts
        reader = Files.new(nameFile)

        #Cargamos los datos en la clase para trabajar
        @codeToDecode = reader.readLines()#Pendiente exception
        puts "Datos cargados correctamente"
    end

    def getResult
        if @codeToDecode != ""
            codeToDecode = @codeToDecode.split("")
            codeToDecode.delete("\n")
            texto = @decod.getText(codeToDecode)
            puts texto.join
        else
            puts "* No se ha cargado un Archivo para decodificar"
        end
    end

    def getText(msg = "Introduzca texto")
        print "#{"=" * 80}\n\n"
        puts "#{msg} :: "
        text = gets.chomp
        print "#{"=" * 80}\n\n"
        return text.to_s
    end
end
