classdef ColorHelper
    methods (Static)
        function reachedEnd = handleMovementBasedOnColors(brick)
            color = Sensors.getColor(brick);
            persistent hasDropped;
            if isEmpty(hasDropped)
                hasDropped = 0;
            end
            reachedEnd = 0;
            switch color
                case 5
                    % Red color case
                    Movements.stopMovement(brick);
                    pause(5);
                case 4
                    % Yellow color case
                    Movements.stopMovement(brick);
                    % Pause for stop movement to complete
                    pause(0.5);
                    % Drop the chair
                    Movements.drop(brick);
                    % Wait for dropping to complete
                    pause(5);
                    hasDropped = 1;
                case 3
                    % Green color case
                    % Need to stop the movement only when person has been
                    % dropped
                    if hasDropped
                        Movements.stopMovement(brick);
                        % Flagging on reaching the end
                        reachedEnd = 1;
                    end
                case 2
                    % Blue color case
                    Movements.stopMovement(brick);
                    % Pause for keeping the chair
                    pause(10);
                    % Lift the chair
                    Movements.lift(brick);
                    % Wait for lifting to complete
                    pause(5);
            end
        end
    end
end