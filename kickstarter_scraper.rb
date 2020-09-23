# require libraries/modules here
require 'nokogiri'
require 'pry'



def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
 
    projects = {}
  kickstarter = Nokogiri::HTML(html)
  kickstarter.css("li.project.grid_4").each do |pro|
     title = pro.css("h2.bbcard_name strong a").text 
    #binding.pry
    projects[title] = {
      
      :image_link => pro.css("div.project-thumbnail a img").attribute("src").value
    }
      
  end
  
  projects
 
end