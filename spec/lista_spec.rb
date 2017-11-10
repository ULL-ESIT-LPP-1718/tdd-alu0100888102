require "lib/lista"
require "lib/alimentos"

describe Lista do
  
  before :all do
      @l = Lista.new("Primer punto")
      @l.push_back("Segundo punto");
      @l.push_back("Tercer punto");
      @l.push_back("Cuarto punto");
      @l.push_back("Quinto punto");
      @l.push_back("Sexto punto");
      @l.push_back("Septimo punto");
  end
  
   describe "Debe tener los datos correctos" do
    it "Debe tener cabeza" do
      expect(@l.head).to_not eq(nil) 
    end
   it "Debe tener cola" do
      expect(@l.tail).to_not eq(nil) 
    end
    it "Los nodos deben tener datos" do
      expect(@l.head.datos).to_not eq(nil) 
    end
    it "Los nodos deben tener anterior" do
      expect(@l.tail.prev).to_not eq(nil) 
    end
    it "Los nodos deben tener siguiente" do
      expect(@l.head.sig).to_not eq(nil) 
    end
  end
  
  describe "Se debe poder trabajar con la lista" do
    it "Se puede acceder al primero" do
        expect(@l.front()).to eq("Primer punto")
    end
    it "Se puede acceder al ultimo" do
        expect(@l.back()).to eq("Septimo punto")
    end
    it "Se puede añadir elementos al final" do
        @l.push_back("Octavo punto")
        expect(@l.back()).to eq("Octavo punto")
    end
    it "Se puede añadir elementos al principio" do
        @l.push_front("Primerisimo punto")
        expect(@l.front()).to eq("Primerisimo punto")
    end
    it "Se puede acceder a un elemento i" do
        expect(@l.element(3)).to eq("Tercer punto")
        expect(@l.element(0)).to eq("Primerisimo punto")
        expect(@l.element(8)).to eq("Octavo punto")
        expect(@l.element(5)).to eq("Quinto punto")
    end
    it "Se puede añadir un elemento en la posición i" do
        @l.set_element("Segundo y medio punto", 3)
        expect(@l.element(2)).to eq("Segundo punto")
        expect(@l.element(3)).to eq("Segundo y medio punto")
        expect(@l.element(4)).to eq("Tercer punto")
    end
    it "Se puede eliminar el primer elemento" do
        expect(@l.pop_front()).to eq("Primerisimo punto")
        expect(@l.front).to eq("Primer punto")
    end
    it "Se puede eliminar el ultimo elemento" do
        expect(@l.pop_back()).to eq("Octavo punto")
        expect(@l.back()).to eq("Septimo punto")
    end
    it "Se puede eliminar el elemento i" do
        expect(@l.pop_element(2)).to eq("Segundo y medio punto")
        expect(@l.element(2)).to eq("Tercer punto")
        expect(@l.element(1)).to eq("Segundo punto")
    end
    
    it "Tiene salida de texto" do
        expect(@l.to_s).to eq("{\nPrimer punto\nSegundo punto\nTercer punto\nCuarto punto\nQuinto punto\nSexto punto\nSeptimo punto\n}")
    end
  
  end
  
end

describe GrupoAlimentos do
  
  before :all do
    @lacteos = GrupoAlimentos.new("Huevos, Lacteos y Helados")
    @lacteos.push_back(Alimentos.new("Huevo frito", 14.1, 0.0, 19.5))
    @lacteos.push_back(Alimentos.new("Leche vaca", 3.3, 4.8, 3.2))
    @lacteos.push_back(Alimentos.new("Yogurt", 3.8, 4.9, 3.8))
    
    @carnes = GrupoAlimentos.new("Carnes y derivados")
    @carnes.push_back(Alimentos.new("Cerdo", 21.5, 0.0, 6.3))
    @carnes.push_back(Alimentos.new("Ternera", 21.1, 0.0, 3.1))
    @carnes.push_back(Alimentos.new("Pollo", 20.6, 0.0, 5.6))
    
    @pescados = GrupoAlimentos.new("Pescados y mariscos")
    @pescados.push_back(Alimentos.new("Bacalao", 17.7, 0.0, 0.4))
    @pescados.push_back(Alimentos.new("Atun", 21.5, 0.0, 15.5))
    @pescados.push_back(Alimentos.new("Salmon", 19.9, 0.0, 13.6))
    
    @grasos = GrupoAlimentos.new("Alimentos grasos")
    @grasos.push_back(Alimentos.new("Aceite de oliva", 0.0, 0.2, 99.6))
    @grasos.push_back(Alimentos.new("Mantequilla", 0.7, 0.0, 83.2))
    @grasos.push_back(Alimentos.new("Huevo frito", 5.3, 47.0, 30.0))
    
    @carbohidratos = GrupoAlimentos.new("Alimentos ricos en carbohidratos")
    @carbohidratos.push_back(Alimentos.new("Azucar", 0.0, 99.8, 0.0))
    @carbohidratos.push_back(Alimentos.new("Arroz", 6.8, 77.7, 0.6))
    @carbohidratos.push_back(Alimentos.new("lentejas", 23.5, 52.0, 1.4))
    @carbohidratos.push_back(Alimentos.new("Huevo frito", 2.0, 15.4, 0.1))
  
    @verduras = GrupoAlimentos.new("Verduras y hortalizas")
    @verduras.push_back(Alimentos.new("Tomate", 1.0, 3.5, 0.2))
    @verduras.push_back(Alimentos.new("Cebolla", 1.3, 5.8, 0.3))
    @verduras.push_back(Alimentos.new("Calabaza", 1.1, 4.8, 0.1))
    
    @frutas = GrupoAlimentos.new("Frutas")
    @frutas.push_back(Alimentos.new("Manzana", 0.3, 12.4, 0.4))
    @frutas.push_back(Alimentos.new("Platnos", 1.2, 21.4, 0.2))
    @frutas.push_back(Alimentos.new("Pera", 0.5, 12.7, 0.3))
  end
  
  
  describe "Debe tener una clasificación" do
    it "Debe tener grupo" do
      expect(@lacteos.grupo).to_not eq(nil)
    end
  end
  
  
  describe "Comprobamos la jerarqia" do
    it "Es hija de Alimentos" do
      expect(@lacteos.is_a?Lista).to eq(true)
    end
    it "Es hija de Objet" do
      expect(@lacteos.is_a?Object).to eq(true)
    end
    it"Es una instancia de Piramide" do
      expect(@lacteos.is_a?GrupoAlimentos).to eq(true)
    end
    it"Es una instancia de Alimentos" do
      expect(@lacteos.is_a?Lista).to eq(true)
    end
  end  
    
  describe "Comprobamos los métodos" do
    it "Debe responder a los metodos de lista" do
        expect(@lacteos.respond_to?:front).to eq(true)
        expect(@lacteos.respond_to?:back).to eq(true)
        expect(@lacteos.respond_to?:push_front).to eq(true)
        expect(@lacteos.respond_to?:push_back).to eq(true)
        expect(@lacteos.respond_to?:element).to eq(true)
        expect(@lacteos.respond_to?:set_element).to eq(true)
        expect(@lacteos.respond_to?:pop_element).to eq(true)
    end
  end


end