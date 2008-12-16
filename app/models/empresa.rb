class Empresa < ActiveRecord::Base
  
  has_many :nota
  
  validates_presence_of :nome, :razao_social, :cnpj
  
  validates_numericality_of :cnpj
  
  validates_uniqueness_of :cnpj
  
end
