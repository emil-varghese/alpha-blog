class ArticlesController < ApplicationController

    def index
        @articles_all = Article.all
    
    end
    
    def show
        @article1 = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    
    def create
        #render plain: params[:article].inspect
        @article1 = Article.new(article_params)
        
        if @article1.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article1)
        else
            render :new
        end
        
    end
    
    private
    def article_params
        params.require(:article).permit(:title,:description)
    end
        
end

