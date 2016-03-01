class MainView

    def initialize(title = "Window",controller)
        @title = title
        @controller = controller
    end

    def start()

        #Instancias :::

        options = ["Cargar Datos de Archivo para Codificación","Cargar datos por teclado",
                   "Obtener Tabla de Frecuencias","Generar Arbol de Huffman",
                   "Mostrar Tabla de Transformacion","Generar archivo codificado","Cargar Datos para Decodificación",
                   "Obtener mensage","Salir =>"]

        menu = Menu.new(@title,options)

        select = 1
        while select != 0
            menu.getMenu() #iniciamos el menu

            puts "Introduzca una opcion"
            select = gets.chomp
            select = selector(select)
        end

=begin
        gen = GenerateTable.new  #generamos la instancia del objeto
        code_gen = GenerateCode.new
        comp = Compare.new
        sort = SortChars.new

        #test = "gato"
        test = "elihu alejandro cruz albores"
        elements = comp.allChars(test)

        table = gen.get_Table(test,elements)

        ordTable = sort.shortElements(table)
        puts("Otros nuevos ele : #{ordTable}")
        #puts("Otros nuevos ele : #{table}")

        sort.printInformation(ordTable)

        puts"======>"

        myLambda = lambda {|node| puts ">> : #{node.getData().getCode()}" } # Creamos el metodo de impresion del arbol

        arbol_code = Tree.new(code_gen.makeTree(ordTable),myLambda)##Obtenemos el nodo raiz para el arbol
        puts "\n---------------------->"


        arbol_code.preOrder(myLambda) ##Imprimimos los datos por in order
        #arbol_code.printLevelOrder(myLambda)

        puts " ----------------------- "

        #generamos la tabla de transformacion
        table_transform = code_gen.makeTable_Char(ordTable,arbol_code)
        (table_transform.size).times do |i|
            puts "#{table_transform[i].getCode()} :: #{table_transform[i].getTimes()}"
        end


        puts "--------"


        mensaje = code_gen.getCode(arbol_code,"el aula leon")

        decod = GetCode.new

        texto = decod.getText(mensaje)

        puts "-" * 80
        puts "#{texto}"

        puts "-" * 80
        puts

        reader = Files.new("text.txt")
        puts reader.readLines()

        reader.writeLines("HOLA.txt","HOLA QUE HACE :V")
=end
    end

    def selector(option)
        if option.to_i == 0
            return 0
        else
            @controller.callModel(option)
        end
    end

end
