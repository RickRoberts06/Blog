class AddPodsIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pod_id, :integer
  end
end
