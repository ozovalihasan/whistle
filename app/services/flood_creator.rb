class FloodCreator < ApplicationService
  attr_reader :whiistle, :floods_params, :user
  
  def initialize(floods_params, whiistle, user)
    @whiistle = whiistle
    @floods_params = floods_params
    @user = user
  end

  def call
    status = nil
    begin
      ActiveRecord::Base.transaction do
        if whiistle.invalid?
          status = Status.new(false, "Whiistle: " << whiistle.errors.full_messages.join(' | ') )
        end
        whiistle.save!
        
        parent_whiistle = whiistle
        extract_floods_list(floods_params).each_with_index do |(_, flood_params), index|
          parent_whiistle = parent_whiistle.build_flood( flood_params.merge( base_whiistle_id: parent_whiistle.id, user_id: user.id ) )  
              
          if parent_whiistle.invalid?
            status = Status.new(false, "Flood-#{index}: " << parent_whiistle.errors.full_messages[0])
          end
          parent_whiistle.save!
        end
        
      end

      status = Status.new(true, "You whiistled")
    rescue ActiveRecord::RecordInvalid
    end
    
    status
  end

  def extract_floods_list(params)
    params[:floods].to_h.to_a.sort_by(&:first)
  end
  
end