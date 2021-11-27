classdef PIDHelper
    properties (Constant = true)
        % in centimeters(cm)
        CELL_WIDTH = 58;
        CELL_LENGTH = 60;
        BOT_WIDTH = 14;
        KP = 2;
        KI = 0;
        KD = 0;
    end
    methods (Static)
        function stabilizeMovement(brick)
            persistent previousError;
            if isEmpty(previousError)
                previousError = 0;
            end
            
            % Integral Error
            persistent I;
            if isEmpty(I)
                I = 0;
            end
            
            % Right Motor Speed
            persistent rightMotorSpeed;
            if isEmpty(rightMotorSpeed)
                rightMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
            end
            
            % Left Motor Speed
            persistent leftMotorSpeed;
            if isEmpty(leftMotorSpeed)
                leftMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
            end
            
            error = Sensors.getRightDist(brick) - Sensors.getLeftDist(brick);
            P = error * PIDHelper.KP;
            I = (I + error) * PIDHelper.KI;
            D = (error - previous_error) * PIDHelper.KD;
            
            total = P + I + D;
            
            leftMotorSpeed = leftMotorSpeed + total;
            leftMotorSpeed = constrain(leftMotorSpeed, 0, Movements.DEFAULT_MOVEMENT_SPEED);
            
            rightMotorSpeed = rightMotorSpeed - total;
            rightMotorSpeed = constrain(rightMotorSpeed, 0, Movements.DEFAULT_MOVEMENT_SPEED);
            
            Movements.changeLeftMotorSpeed(brick, leftMotorSpeed);
            Movements.changeRightMotorSpeed(brick, rightMotorSpeed);
        end
        
        function constrained = constrain(value, lower, upper)
            if value > upper
                constrained = upper;
            elseif value < lower
                constrained = lower;
            else
                constrained = value;
            end
        end
    end
end