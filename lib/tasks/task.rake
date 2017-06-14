desc "pre-calculate total points for users"
task total_points: :environment do
  users = User.all

  users.each do |user|
    sql = "UPDATE users 
          SET total_points =  (SELECT SUM(value) FROM points WHERE user_id = #{user.id})
          WHERE id=#{user.id}"
    ActiveRecord::Base.connection.execute(sql) 
    puts "User for id #{user.id} is done"
  end

end
