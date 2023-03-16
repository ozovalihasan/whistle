class WhiistleCreator < ApplicationService
  attr_reader :whiistle, :cur_user, :params
  
  def initialize(params, cur_user)
    @params = params
    @cur_user = cur_user
  end

  def call
    completed = nil
    message = nil
    
    whiistle = nil

    begin
      ActiveRecord::Base.transaction do
        whiistle = cur_user.whiistles.new(whiistle_params.merge(type: BaseWhiistle.types["Whiistle"]))
        
        if whiistle.invalid?
          completed = false
          message = "Whiistle: " << whiistle.errors.full_messages.join(' | ')
        end

        whiistle.save!
        
        parent_whiistle = whiistle
        extract_floods_list(floods_params).each_with_index do |(_, flood_params), index|
          parent_whiistle = parent_whiistle.build_flood( 
                              flood_params.merge( 
                                base_whiistle_id: parent_whiistle.id, 
                                user_id: cur_user.id 
                              ) 
                            )  
              
          if parent_whiistle.invalid?
            completed = false
            message = "Flood-#{index}: " << parent_whiistle.errors.full_messages[0]
          end
          parent_whiistle.save!
        end
      end

      completed = true
      message = "You whiistled"
    rescue ActiveRecord::RecordInvalid
    end
    
    [completed, message, whiistle]
  end

  def extract_floods_list(params)
    params[:floods].to_h.to_a.sort_by(&:first)
  end

  private
  
  def whiistle_params
    params.require(:whiistle).permit(:body, :quoted_whiistle_url, pictures: [])
  end

  def floods_params
    params.require(:whiistle).permit(floods: [:body, :quoted_whiistle_url, pictures: []])
  end
  
end