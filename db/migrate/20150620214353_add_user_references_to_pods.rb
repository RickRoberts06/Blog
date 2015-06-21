class AddUserReferencesToPods < ActiveRecord::Migration
  def change
    add_reference :pods, :user, index: true, foreign_key: true
  end
end
