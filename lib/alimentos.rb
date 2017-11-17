# @author Ángel Hamilton
# Esta clase sirve para almacenar alimentos

require "alimentos/version"

class Alimentos
    include Comparable
    
    # Readers
    # @return [nombre] nombre del alimento
    # @return [proteinas] cantidad de proteinas en el alimento
    # @return [glucidos] cantidad de glucidos en el alimento
    # @return [lipidos] cantidad de lipidos en el alimento
    attr_reader :nombre, :proteinas, :glucidos, :lipidos
    
    # Crea el alimento
    # @param no [String] nombre del alimento
    # @param pr [float] cantidad de proteinas en el alimento
    # @param gl [float] cantidad de glucidos en el alimento
    # @param li [float] cantidad de lipidos en el alimento
    def initialize(no, pr, gl, li)
        @nombre = no
        @proteinas = pr * 1.0
        @glucidos = gl * 1.0
        @lipidos = li * 1.0
    end
    
    # Devuelve el aliemnto formateado como una cadena de texto
    # @return [String] alimento formateado
    def to_s
        return "#{@nombre}:\n\tproteinas\t-> #{@proteinas}\n\tglucidos\t-> #{@glucidos}\n\tlipidos \t-> #{@lipidos}\n"
    end
    
    # Calcula y devuelve el valor energetico del alimento
    # @return [float] valor energetico del alimento
    def valorEnergetico
        return @proteinas * 4 + @glucidos * 4 + @lipidos * 9
    end
    
    # Nos permite comparar alimentos en base a su valor energetico
    def <=> (another)
        valorEnergetico <=> another.valorEnergetico
    end
    
end

# Esta clase represnta alimentos que pertenecen a un grupo
class GrupoAlimento < Alimentos
    
    # Reader
    # @return [grupo] nombre del grupo
    attr_reader :grupo
    
    # Crea el alimento
    # @param gr [String] nombre del grupo
    # @param no [String] nombre del alimento
    # @param pr [float] cantidad de proteinas en el alimento
    # @param gl [float] cantidad de glucidos en el alimento
    # @param li [float] cantidad de lipidos en el alimento
    def initialize(gr, no, pr, gl, li)
        super(no, pr, gl, li)
        @grupo = gr
    end
    
    # Devuelve el aliemnto formateado como una cadena de texto
    # @return [String] alimento formateado
    def to_s
        return "#{@grupo}:\t"+ super
    end
end