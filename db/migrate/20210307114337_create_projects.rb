class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.text :description
      t.string :status
      t.string :github_link
      t.string :external_link

      t.timestamps
    end
  end
end
