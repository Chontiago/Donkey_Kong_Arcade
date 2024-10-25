module Collisions

  def self.regular_collision(box1, box2)
    box1.y_pos <= box2.y_pos &&  
    box1.y_pos + box1.height >= box2.y_pos  &&
    box1.x_pos <= box2.x_pos + box2.width &&
    box1.x_pos + box1.width >= box2.x_pos 
  end

  def self.jumped_obstacle(box1, box2) 
    box1.y_pos > box2.y_pos + box2.height &&  
    box1.x_pos <= box2.x_pos + box2.width &&
    box1.x_pos + box1.width >= box2.x_pos &&
    box1.y_pos >= box1.jump_peak - 5 #Arreglar este pequeño hack
    
  end

  def self.collision_with_floor(floors, object) 
    floors.each do |floor|
      if regular_collision(floor, object)
        object.touching_the_floor = true
      end
    end
  end

  def self.collision_with_spawn_flag(spawn_flag, object)
    spawn_flag.x_pos == object.x_pos &&
    spawn_flag.y_pos == object.y_pos
  end
    

end