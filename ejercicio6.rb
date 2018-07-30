# Se pide:
# Optimizar el código implementando el operador splat al momento de
# instanciar los productos.
# Generar un método que permita calcular el promedio de precio por producto.

class Product
  def initialize(name, *size)
    @name = name
    @large, @medium, @small, @xsmall = size.map(&:to_i)
  end

  def promedio
    (@large + @medium + @small + @xsmall) / 4.0
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
