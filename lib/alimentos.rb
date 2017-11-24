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
    
    # Accessors
    # @return [concentraciones] array con las concentraciones de glucosa del alimento en un individuo
    attr_accessor :concentraciones
    
    # Crea el alimento
    # @param no [String] nombre del alimento
    # @param pr [float] cantidad de proteinas en el alimento
    # @param gl [float] cantidad de glucidos en el alimento
    # @param li [float] cantidad de lipidos en el alimento
    # @param co [array] concentraciones del alimento
    def initialize(no, pr, gl, li, co)
        @nombre = no
        @proteinas = pr * 1.0
        @glucidos = gl * 1.0
        @lipidos = li * 1.0
        @concentraciones = co
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
    
    def aibc (deltaTime)
        temp = @concentraciones.map.with_index { |element, index|
            if (index == 0) then
                next 0
            end
            (((element.to_f - @concentraciones[0]) + (@concentraciones[index - 1] - @concentraciones[0]))/ 2) * deltaTime
        }
        temp.reduce(:+)
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
    def initialize(gr, no, pr, gl, li, co)
        super(no, pr, gl, li, co)
        @grupo = gr
    end
    
    # Devuelve el aliemnto formateado como una cadena de texto
    # @return [String] alimento formateado
    def to_s
        return "#{@grupo}:\t"+ super
    end
end