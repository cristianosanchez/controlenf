class Nota < ActiveRecord::Base

  # 
  belongs_to :usuario # default foreign_key will be usuario_id
  
  # 
  belongs_to :empresa # default foreign_key will be empresa_id
  
  validates_uniqueness_of :numero
  
  validates_presence_of :numero, :valor
  
  validates_numericality_of :numero, :valor
  
  def irrf
    # Valor da NF * 1.5%
    self.valor * 1.5 / 100
  end
  
  def issqn
    # Valor da NF * 2%
    self.valor * 2.0 / 100
  end
  
  def pis
  # Valor da NF * 0.65%
    self.valor * 0.65 / 100
  end
  
  def cofins
    # Valor da NF * 3%
    self.valor * 3.0 / 100
  end
  
  def cssl
    # Valor da NF * 32% * 9% (ou 2.8%)
    self.valor * 2.88 / 100
  end

  def desc_fonte?
      # se o valor desta NF ja Ž superior a 5K, descontado na fonte CSSL
      if (self.valor > 5000)
          true
      else
          dataIni = Date.new(emissao.year, emissao.month, 1)
          dataFin = emissao
          # verificar se existe NF anterior que totaliza > 5K
          total_anterior = Nota.calculate(
                  :sum,
                  :valor,
                  :conditions => ["emissao BETWEEN :dataIni AND :dataFin AND empresa_id = #{:empresa_id}", {:dataIni => dataIni, :dataFin => dataFin}])
          total_anterior > 5000
      end

  end
  
  def irpj
    # Valor da NF * 32% * 15% (ou 4.8%)
    ir = self.valor * 4.80 / 100
    
    # Do valor de IRPJ devemos descontar o IRRF (retido na fonte) caso este seja maior que 10.00.
    if (irrf > 10.00)
      ir -= irrf
end
    return ir
  end

  def porcentagem_impostos
      if self.valor != 0
        1 - (total / self.valor)
      else
          0
      end
  end

  def total_impostos
      irrf + issqn + pis + cofins + cssl + irpj
  end

  
  def total
    self.valor - total_impostos
  end
  
  # rails always call this method
  protected
  def validate
    errors.add(:valor, "deve ser maior que 0.00 (zero)") unless valor.nil? || valor >= 0.0
    # se nao-cancelada verificar presenca de empresa e usuario, caso contrario campos nil
  end
  
end
