class CreateArtigos < ActiveRecord::Migration[7.0]
  def change
    create_table :artigos do |t|
      t.string :titulo
      t.string :texto
      t.string :autor

      t.timestamps
    end
  end
end
