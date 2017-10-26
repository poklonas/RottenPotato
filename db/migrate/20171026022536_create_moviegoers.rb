class CreateMoviegoers < ActiveRecord::Migration
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :provider, null: false
      t.string :uid, null: false
      add_index :moviegoers, :provider
      add_index :moviegoers, :uid
      add_index :moviegoers, [:provider, :uid], unique: true
      t.timestamps null: false
    end
  end
end
