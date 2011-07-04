class CreateProductReferences < ActiveRecord::Migration

  def self.up
    create_table :product_references do |t|
      t.string :sku
      t.string :make
      t.string :model_name
      t.string :search_term
      t.decimal :addject_rrp, :precision => 7, :scale => 2
      t.decimal :addject_trade :precision => 7, :scale => 2
      t.integer :weight_grams
      t.integer :ship_width_cm
      t.integer :ship_height_cm
      t.integer :ship_depth_cm
      t.integer :position

      t.timestamps
    end

    add_index :product_references, :id

    load(Rails.root.join('db', 'seeds', 'product_references.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "product_references"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/product_references"})
    end

    drop_table :product_references
  end

end
