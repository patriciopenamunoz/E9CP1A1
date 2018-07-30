# Utilizando el mismo archivo del ejercicio anterior:
# La tienda desea generar un nuevo catálogo que no incluya el último precio
# correspondiente a cada producto debido a que ya no comercializa productos
# de talla XS.
# Se pide generar un método que reciba como argumento los datos del archivo
# catalogo.txt y luego imprima el nuevo catálogo solicitado en un archivo
# llamado nuevo_catalogo.txt

class Product
  def initialize(name, *size)
    @name = name
    @large, @medium, @small, @xsmall = size.map(&:to_i)
  end

  def promedio
    (@large + @medium + @small + @xsmall) / 4.0
  end

  def generar_catalogo(importado, exportar)
    data = []
    File.open(importado, 'r') { |file| data = file.readlines }
    nuevo = File.open(exportar, 'w')
    data.each do |prod|
      prod = prod.split(', ')
      prod.pop
      nuevo.puts prod.join(', ')
    end
    nuevo.close
  end
end

products_list = []
data = []
File.open('catalogo.txt', 'r') { |file| data = file.readlines }
data.each do |prod|
  ls = prod.split(', ')
  products_list << Product.new(*ls)
end

products_list.each { |e| puts e.promedio }
products_list[0].generar_catalogo('catalogo.txt', 'nuevo_catalogo.txt')
