class AddScoreToPostcomments < ActiveRecord::Migration
  def change
    add_column :postcomments, :score, :integer
  end
end
