def initialize_master_table(*models)
  models.each do |model|
    model.delete_all
    model.connection.execute("alter table #{model.table_name} AUTO_INCREMENT = 1;")
  end
end

initialize_master_table(User)
user = User.create!(email: "test@example.com", password: "aA123456@", password_confirmation: "aA123456@")

initialize_master_table(YoutubeVideo)
30.times do |_i|
  movie = YoutubeVideo.create!(
    user_id: user.id,
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    youtube_id: SecureRandom.alphanumeric(12),
    thumbnails: Faker::LoremFlickr.image(size: "640x480"),
    published_at: Time.now,
    dislike_count: 0,
    like_count: 0,
  )
end
