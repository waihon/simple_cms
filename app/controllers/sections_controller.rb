# Reviewed and documented.
class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_page

  def index
    # Scoping sections within the parent page.
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => "Default"})
    # Scoping pages within the parent subject
    @pages = @page.subject.pages.sorted
    # Scoping sections within the parent page
    @section_count = @page.sections.count + 1

    current_editor = AdminUser.find(session[:user_id])
    @section_edit = @section.section_edits.build(editor: current_editor, 
      summary: "Default summary")
  end

  def create
    @section = Section.new(section_params)
    puts "section_params: #{section_params.inspect}"
    puts "params: #{params.inspect}"
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      # Scoping pages within the parent subject
      @pages = @page.subject.pages.sorted
      # Scoping sections within the parent page
      @section_count = @page.sections.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    # Scoping pages within the parent subject
    @pages = @page.subject.pages.sorted
    # Scoping sections within the parent page
    @section_count = @page.sections.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      # Scoping pages within the parent subject
      @pages = @page.subject.pages.sorted
      # Scoping sections within the parent page
      @section_count = @page.sections.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end


  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, 
        :content_type, :content, section_edits_attributes: 
        [:section_id, :admin_user_id, :summary])
    end

    def find_page
      if params[:page_id]
        @page = Page.find(params[:page_id])
      end
    end
end
