module Accredible
  class ApiResource

  	def self.check_credential(user_email,achievement_id)
  	  url = "https://www.staging.accredible.com/v1/credentials?achievement_id="+ achievement_id.to_s + "&email=" + user_email.to_s
      response = request('get', url)
      binding.pry
      puts "I am here"
  	end
  end
end