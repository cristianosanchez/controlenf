class CreateNotas < ActiveRecord::Migration
  def self.up
    create_table :notas do |t|
      t.integer  :numero, :null => false
      t.float    :valor, :default => 0.00, :null => false
      t.date     :emissao
      t.boolean  :cancelada, :default => false, :null => false
      t.integer  :empresa_id
      t.integer  :usuario_id
      t.text     :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :notas
  end
end
