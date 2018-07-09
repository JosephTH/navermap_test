class PostsController < ApplicationController
  #before_action :authorize, except: [:index]
  def index
     email_address = 'taehun9312@gmail.com'
      # create the md5 hash
		 hash = Digest::MD5.hexdigest(email_address)
       # compile URL which can be used in <img src="RIGHT_HERE"...
		 @image_src = "https://www.gravatar.com/avatar/#{hash}?d=mp"
	
    @posts = Post.page(params[:page]).per(2)
  end

  def map
  end

  def map_test
  end

  def map_data
    max = JSON.parse(params[:max])
    min = JSON.parse(params[:min])
    indice = JSON.parse(params[:indice])
#     @school = School.all.limit(10000);
    school = School.where("(x BETWEEN ? and ?) and (y BETWEEN ? and ?)", min["_lng"],max["_lng"],min["_lat"], max["_lat"])
    school_id = school.map {|x| x.id}
    school_id -= indice
    unless school_id.length == 0
      school = school.select {|x| school_id.include? x.id}
    else
      school = []
    end
    respond_to do |format|
      format.json {render json: [school, school_id]}
    end
  end

  def new
  
  end

  def create
    user = current_user.posts.new(post_params)
    user.save
    redirect_to '/'
  end

  def show
    setpost
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def edit
    setpost
  end

  def update
    setpost
    @post.update(title: post_params[:title], content: post_params[:content])
    redirect_to '/'
  end

  def destroy
    @id = params[:id]
    Post.find(@id).destroy()
    @posts = Post.all
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js 
    end
  end

  def test
  end

  private

  def setpost
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content).merge(username: current_user.username)
  end
end
