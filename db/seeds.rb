for i in 1..50
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.name = name
  if user.save
    p "Saved user ##{i}: #{name} - (#{email})"
      article = Article.new
      article.user = user
      article.content = Faker::Lorem.paragraph
      article.title = Faker::Internet.domain_word
      if article.save
        p "Article ##{i} saved for #{name}"
        for ii in 1..10
          comment = Comment.new
          comment.user = user
          comment.article = article
          comment.message = Faker::Lorem.paragraph
          if comment.save
          	p "Comment ##{ii} saved for #{article.title} under #{name}"
          else 
          	p comment.errors
          end
      	end
      else
        p article.errors
      end
  else
    p user.errors
  end
end

