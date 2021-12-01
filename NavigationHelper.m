classdef NavigationHelper
    methods (Static)
        function navigate(brick)
            Movements.init();
            Sensors.init(brick);
            ColorHelper.init();
            PIDHelper.init();
            while 1
                % stopping on reaching the end is handled here
                reachedEnd = ColorHelper.handleMovementBasedOnColors(brick);
                
                % Stop navigation on reaching the end
                if reachedEnd
                    fprintf('Reached the end');
                    break;
                end
                
                % Left-Hand Algorithm for navigating the maze
                if Sensors.isLeftWall(brick) == 0
                    Movements.turnLeft(brick);
                elseif Sensors.isFrontWall(brick) == 0
                    Movements.moveForward(brick);
                elseif Sensors.isRightWall(brick) == 0
                    Movements.turnRight(brick);
                else
                    Movements.turnBack(brick);
                end
                
                % Stabilize movement using PID control
                %PIDHelper.stabilizeMovement(brick);
            end
        end
    end
end