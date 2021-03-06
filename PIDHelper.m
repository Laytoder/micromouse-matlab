classdef PIDHelper
    properties (Constant = true)
        KP = 2;
        KI = 0;
        KD = 0;
    end
    methods (Static)
        function init()
            global previousError;
            global I;
            global rightMotorSpeed;
            global leftMotorSpeed;
            previousError = 0;
            I = 0;
            rightMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
            leftMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
        end
        
        function stabilizeMovement(brick)
            global previousError;
            
            % Integral Error
            global I;
            
            % Right Motor Speed
            global rightMotorSpeed;
            
            % Left Motor Speed
            global leftMotorSpeed;
            
            error = Sensors.getRightDist(brick) - Sensors.getLeftDist(brick);
            P = error * PIDHelper.KP;
            I = (I + error) * PIDHelper.KI;
            D = (error - previousError) * PIDHelper.KD;
            
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