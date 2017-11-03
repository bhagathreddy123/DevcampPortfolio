class PagesController < ApplicationController
  def homepage
  	@skills = Skill.all
  end

  def about
  end

  def contact
  end
end
