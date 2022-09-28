def initialize_master_table(*models)
  models.each do |model|
    model.delete_all
    model.connection.execute("alter table #{model.table_name} AUTO_INCREMENT = 1;")
  end
end

initialize_master_table(User)
User.create!(email: "test@example.com", password: "aA123456@", password_confirmation: "aA123456@")
