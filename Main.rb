#author : Elihu Alejandro Cruz Albores
#version 1.0.7

#Modulos necesarios
load './struct/components/Node.rb'
load './struct/components/AddTree.rb'
load './struct/components/DrawTree.rb'
load './struct/components/OrderTree.rb'
load './struct/components/RemoveTree.rb'
load './struct/components/SearchTree.rb'
load './struct/Tree.rb'
load './struct/Information.rb'

#Clases para manejo de mensaje, repeticion
load './words/Compare.rb'
load './words/GenerateTable.rb'
load './words/SortChars.rb'

#Obtencion de arbol y codigo
load './huffman/GenerateCode.rb'
load './huffman/GetCode.rb'
load './reader/Files.rb'

#Menu principal
load './views/MainView.rb'
load './views/Menu.rb'
load './models/Model.rb'

class Main
    def initialize
        @view = MainView.new("Arbol de Huffman",self)
        @model = Model.new
    end

    def callModel(call)

        case call.to_i
        when 1
            @model.readFileEnc()
        when 2
            @model.loadData()
        when 3
            @model.getFrec_Table()
        when 4
            @model.getHuffmanTree()
        when 5
            @model.getTransformTable()
        when 6
            @model.generateCode()
        when 7
            @model.readFileDec()
        when 8
            @model.getResult()
        end
    end

    def callView
        #initialize menu
        @view.start()
    end
end

#Start
init = Main.new
init.callView
