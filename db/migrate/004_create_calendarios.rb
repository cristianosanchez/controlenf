class CreateCalendarios < ActiveRecord::Migration
  def self.up
    create_table :calendarios do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :calendarios
  end
end
