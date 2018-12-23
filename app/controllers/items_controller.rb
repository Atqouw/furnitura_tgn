class SurveyPagesController < WebApplicationController

  load_and_authorize_resource :item

  def index

  end

  private

  def item_params
    params.fetch(:item, {}).permit(
        :title,
        :description,
        :show_survey_title,
        :show_survey_description
    )
  end

end
