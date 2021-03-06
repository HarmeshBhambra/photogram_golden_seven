class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
    render("index.html.erb")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    # Parameters: {"the_caption"=>"Harmesh", "the_source"=>"http://doncasterhockeyclub.com.au/files/2813/7506/8044/Harmish.jpg"}

    i = Photo.new
    i.source = params[:the_source]
    i.caption = params[:the_caption]
    i.save
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @i = Photo.find(params[:id])
    @i.id = @i.id
    @i.source = @i.source
    @i.caption = @i.caption

    render("edit_form.html.erb")
  end

  def update_form
    @i = Photo.find(params[:id])

    @i.source = params[:the_source]
    @i.caption = params[:the_caption]
    @i.save

    render("show.html.erb")
  end

  def show
    # Parameters: {"id"=>"1"}

    @i = Photo.find(params[:id])

    @i.source = @i.source

    @i.caption = @i.caption

    render("show.html.erb")
  end

  def destroy
    i = Photo.find(params[:id])
    i.destroy

    redirect_to("http://localhost:3000/photos")
  end

end
