class Admin::BlogSeriesController < Admin::BaseController
  def index
    @blog_series = Blog::Series.page(params[:page])
  end

  def new
    @blog_series = Blog::Series.new
  end

  def create
    @blog_series = Blog::Series.new(params[:blog_series])
    if @blog_series.save
      redirect_to admin_blog_series_index_path
    else
      render 'new'
    end
  end

  def edit
    @blog_series = Blog::Series.find(params[:id])
  end

  def update
    @blog_series = Blog::Series.find(params[:id])
    if @blog_series.update_attributes(params[:blog_series])
      redirect_to site_blog_tagged_url(
        @blog_series.blog, @blog_series.name, subdomain: 'www')
    else
      render 'edit'
    end
  end

  def destroy
    @blog_series = Blog::Series.find(params[:id])
    @blog_series.destroy
  end
end
