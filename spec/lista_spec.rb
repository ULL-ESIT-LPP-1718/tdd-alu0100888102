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