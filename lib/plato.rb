require "alimentos"

class Plato
    attr_accessor :name, :componentes
    
    def initialize(name, &block)
        @name = name
        @componentes = []
        
        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end
    
    def to_s
        output = @name
        output << "\n=================================================================\n\n"
        output << "Composición nutricional:\n"
        output << "nombre\t\tglucidos\tproteinas\t\tlipidos\t\tvalor energetico\n"
        veTotal = 0
        @componentes.each do |comp|
            output << "#{comp.nombre}\t\t#{comp.glucidos.round(2)}\t\t#{comp.proteinas.round(2)}\t\t#{comp.lipidos.round(2)}\t\t\t#{comp.valorEnergetico.round(2)}\n"
            veTotal += comp.valorEnergetico
        end
        
        output << "Valor energetico total\t\t\t\t\t\t#{veTotal.round(2)}"
        
        output
    end
    
    def to_grams_aprox(cantidad)
        output = 0
        if(cantidad.end_with?("pieza") || cantidad.end_with?("piezas")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 100
        elsif (cantidad.end_with?("pieza pequeña") || cantidad.end_with?("piezas pequeñas")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 50
        elsif (cantidad.end_with?("cucharon") || cantidad.end_with?("cucharones")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 100
        elsif (cantidad.end_with?("cucharada") || cantidad.end_with?("cucharadas")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 10
        elsif (cantidad.end_with?("taza") || cantidad.end_with?("tazas")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 75
        elsif (cantidad.end_with?("vaso") || cantidad.end_with?("vasos")) then
                cantidad = cantidad.slice(/\d*\/?\d*/)
                output = cantidad.to_f
                output *= 50
        end
        
        output
    end
    
    def fruta (name, cantidad = {})
        glucidos = 15.5
        proteinas = 0.8
        lipidos = 0.2
        gramos = 0
        
        if (cantidad[:gramos]) then
            gramos = cantidad[:gramos].to_f
        elsif (cantidad[:porcion]) then
            gramos = to_grams_aprox(cantidad[:porcion])
        end
        
        glucidos = glucidos * (gramos / 100)
        proteinas = proteinas * (gramos / 100)
        lipidos = lipidos * (gramos / 100)
        
        componentes << GrupoAlimento.new("Fruta", name, proteinas, glucidos, lipidos, [])
    end
    
    def vegetal (name, cantidad = {})
        glucidos = 4.8
        proteinas = 1.1
        lipidos = 0.2
        gramos = 0
        
        if (cantidad[:gramos]) then
            gramos = cantidad[:gramos].to_f  
        elsif (cantidad[:porcion]) then
            gramos = to_grams_aprox(cantidad[:porcion])
        end
        
        glucidos = glucidos * (gramos/100)
        proteinas = proteinas * (gramos/100)
        lipidos = lipidos * (gramos/100)
        
        componentes << GrupoAlimento.new("Vegetal", name, proteinas, glucidos, lipidos, [])
    end
    
    def cereal (name, cantidad = {})
        glucidos = 52.4
        proteinas = 5.2
        lipidos = 0.1
        gramos = 0
        
        if (cantidad[:gramos]) then
            gramos = cantidad[:gramos].to_f    
        elsif (cantidad[:porcion]) then
            gramos = to_grams_aprox(cantidad[:porcion])
        end
        
        glucidos = glucidos * (gramos/100)
        proteinas = proteinas * (gramos/100)
        lipidos = lipidos * (gramos/100)
        
        componentes << GrupoAlimento.new("Cereal", name, proteinas, glucidos, lipidos, [])
    end
    
    def proteina (name, cantidad = {})
        glucidos = 4.8
        proteinas = 1.1
        lipidos = 0.2
        gramos = 0
        
        if (cantidad[:gramos]) then
            gramos = cantidad[:gramos].to_f 
        elsif (cantidad[:porcion]) then
            gramos = to_grams_aprox(cantidad[:porcion])
        end
        
        glucidos = glucidos * (gramos/100)
        proteinas = proteinas * (gramos/100)
        lipidos = lipidos * (gramos/100)
        
        componentes << GrupoAlimento.new("Proteinas", name, proteinas, glucidos, lipidos, [])
    end
         
    def aceite (name, cantidad = {})
        glucidos = 4.8
        proteinas = 1.1
        lipidos = 0.2
        gramos = 0
        
        if (cantidad[:gramos]) then
            gramos = cantidad[:gramos].to_f 
        elsif (cantidad[:porcion]) then
            gramos = to_grams_aprox(cantidad[:porcion])
        end
        
        glucidos = glucidos * (gramos/100)
        proteinas = proteinas * (gramos/100)
        lipidos = lipidos * (gramos/100)
        
        componentes << GrupoAlimento.new("Aceite", name, proteinas, glucidos, lipidos, [])
    end
    
end