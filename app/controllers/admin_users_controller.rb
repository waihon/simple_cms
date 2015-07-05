# Reviewed and documented.
class AdminUsersController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
    render("new")   # Optional
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      # Display confirmation message
      flash[:notice] = "Admin user '#{@admin_user.username}' created successfully."
      # Redirect to index page
      redirect_to(:action => "index")
    else
      # Display error message
      #flash[:error] = "Error creating admin user '#{@admin_user.username}'."
      # Redisplay the form
      render("new")
    end    
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
    render("edit")  # Optional
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    #if @admin_user.update(admin_user_params)
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin User '#{@admin_user.username}' updated successfully."
      redirect_to( :action => "index")
    else
      # Re-display the form
      render("edit")
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.destroy
      flash[:notice] = "Admin User '#{@admin_user.username}' is deleted."
      redirect_to(:action => "index")
    else
      render(:action => "delete")
    end
  end
  
  private

    def admin_user_params
      params.require(:admin_user).permit(:first_name, :last_name, :email, 
        :username, :password, :password_confirmation)
    end
end
