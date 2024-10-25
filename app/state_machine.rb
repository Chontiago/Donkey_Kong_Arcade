require 'app/all_files.rb'

class StateMachine
  
  def initialize(args)
    @args = args
    @score = Score.new
    
    
    @state_ids =  {'gameplay' => Gameplay.new(@score), 'lose' => LoseScreen.new(@score), 'win' => WinScreen.new(@score)}
    #current_game_state
    @initial_state ||= Gameplay.new(@score)
     
   # @current_key ||= 'gameplay'
    #@current_value ||= @state_ids[@current_key]

    @current_value ||= @state_ids['gameplay']
    @current_key ||= @current_value.current_game_state

  end

  

 

  def current_state
    #return @initial_state.screen
    #puts @state
    
    #return @current_value.screen
    
    state_manager_2
    send_state
    
    
  end

  def state_manager_2
   
    @current_key = @current_value.current_game_state
    @state_ids.each_pair do |key, value|
      if @current_key == key
       
        @current_value = value
      end
    end
   

  end

  def send_state
    @current_value.screen
  end

  def state_manager
    @state_ids.each_pair do |key, value|
      if @current_key == key
        @current_value = value
      
      end
    end 
    return @current_value.screen
  end

  def debug
    
  end
end
