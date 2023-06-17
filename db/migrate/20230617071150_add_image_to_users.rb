class AddImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users,
               :image,
               :string,
               default:
                 "https://images.unsplash.com/photo-1657549456486-0f2c3ddffdab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80"
  end
end
