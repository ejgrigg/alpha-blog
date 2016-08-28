class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      #Validations failed
      
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  def article_params #this method allows param values from form to be whitelisted
    params.require(:article).permit(:title, :description)
  end
  
end