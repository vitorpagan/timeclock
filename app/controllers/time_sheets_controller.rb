class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:close]
  
  def close
    @time_sheet.update_attributes(closed_at: Time.now)
    redirect_to :back
  end

  def open
    TimeSheet.create(user: current_user)
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_sheet
      @time_sheet = TimeSheet.includes(:user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_sheet_params
      params.require(:time_sheet).permit(:closed_at, :user_id)
    end
end
