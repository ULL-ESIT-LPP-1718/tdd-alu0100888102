require "spec_helper"

RSpec.describe Plato do
   
   before :all do
        @plato = Plato.new("Lentejas con arroz, salsa de tomate, huevo y platano a la plancha") do
            vegetal "Tomate", :porcion => "2 piezas pequeñas"
            fruta "Plátano", :gramos => 20
            cereal "Arroz", :porcion => "1 taza"
            proteina "Lentejas", :porcion => "1/2 cucharon"
            proteina "Huevo", :porcion => "1 pieza"
            aceite "Aceite de oliva", :porcion => "1/2 cucharada"
        end
    end
    
    describe "Salida" do
        it "La salida debe ser correcta" do
            out = "Lentejas con arroz, salsa de tomate, huevo y platano a la plancha\n=================================================================\n\nComposición nutricional:\nnombre\t\tglucidos\tproteinas\t\tlipidos\t\tvalor energetico\nTomate\t\t4.8\t\t1.1\t\t0.2\t\t\t25.4\nPlátano\t\t3.1\t\t0.16\t\t0.04\t\t\t13.4\nArroz\t\t39.3\t\t3.9\t\t0.08\t\t\t173.48\nLentejas\t\t4.8\t\t1.1\t\t0.2\t\t\t25.4\nHuevo\t\t4.8\t\t1.1\t\t0.2\t\t\t25.4\nAceite de oliva\t\t0.48\t\t0.11\t\t0.02\t\t\t2.54\nValor energetico total\t\t\t\t\t\t265.62"
            expect(@plato.to_s).to eq(out)
        end
    end
    
end