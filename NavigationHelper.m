classdef NavigationHelper
    methods (Static)
        function Navigate(brick)
            while 1
                % stopping on reaching the end is handled here
                reachedEnd = ColorHelper.handleMovementBasedOnColors(brick);
                % Stop navigation on reaching the end
                if reachedEnd
                    break;
                end
                % Left-Hand Algorithm for navigating the maze
                if Sensors.isLeftWall(brick) == 0
                    Movements.turnLeft(brick);
                elseif Sensors.isFrontWall(brick) == 0
                    Movements.moveForward(brick);
                else
                    Movements.turnRight(brick);
                end
                % Stabilize movement using PID control
                PIDHelper.stabilizeMovement(brick);
            end
        end
    end
end