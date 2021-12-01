classdef ColorHelper
    methods (Static)
        function init()
            global hasDropped;
            global shouldDetect;
            hasDropped = 0;
            shouldDetect = 1;
        end
        
        function reachedEnd = handleMovementBasedOnColors(brick)
            color = Sensors.getColor(brick);
            global hasDropped;
            % ensures that a color is detected only once before movement
            % proceeds ahead
            global shouldDetect;
            reachedEnd = 0;
            switch color
                case 5
                    % Red color case
                    if shouldDetect
                        Movements.stopMovement(brick);
                        pause(5);
                        shouldDetect = 0;
                    end
                case 4
                    % Yellow color case
                    if shouldDetect
                        Movements.stopMovement(brick);
                        % Drop the chair
                        Movements.drop(brick);
                        hasDropped = 1;
                        shouldDetect = 0;
                    end
                case 3
                    % Green color case
                    % Need to stop the movement only when person has been
                    % dropped
                    if shouldDetect && hasDropped
                        Movements.stopMovement(brick);
                        % Flagging on reaching the end
                        reachedEnd = 1;
                    end
                case 2
                    % Blue color case
                    if shouldDetect
                        Movements.stopMovement(brick);
                        % Pause for keeping the chair
                        pause(10);
                        % Lift the chair
                        Movements.lift(brick);
                        shouldDetect = 0;
                    end
                otherwise
                    shouldDetect = 1;
            end
        end
    end
end