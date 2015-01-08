class TopicsController <ApplicationController

  def index
    @topics = Topic.all
    @topics = @topics.sort_by{ |p| p.votes.count }.reverse
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path, notice: "Topic '#{@topic.title}' was successfully created!"
    else
      flash[:notice] = "Please check your topic and try again!"
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:notice] = "Topic Updated!"
    end
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to(topics_path)
  end


  def downvote
    @topic = Topic.find(params[:id])
    if @topic.votes.count >0
      @topic.votes.last.destroy
      redirect_to(topics_path)
    else
      flash[:notice] = "Unable to downvote '#{@topic.title}' anymore!"
      redirect_to(topics_path)
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end
