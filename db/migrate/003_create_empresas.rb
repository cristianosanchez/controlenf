class CreateEmpresas < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string   :nome, :null => false
      t.string   :razao_social, :null => false
      t.string   :endereco
      t.string   :telefone
      t.string   :contato
      t.decimal  :cnpj, :precision => 14
      t.string   :cep
      t.string   :bairro
      t.string   :cidade
      t.string   :estado
      t.string   :pais, :defaut => 'Brasil'
      t.decimal     :insc_estadual, :precision => 12
      t.decimal     :insc_municipal, :precision => 12
      t.string   :obs
      t.integer  :usuario_id
      t.timestamps
    end
  end

  def self.down
    drop_table :empresas
  end
end
