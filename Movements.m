classdef Movements
    properties (Constant = true)
        MOVEMENT_SENSITIVITY = 0.01; % in seconds
        DEFAULT_MOVEMENT_SPEED = 70;
        DEFAULT_TURN_SPEED = 25;
        LIFT_SPEED = 20;
        SPEED_CHANGE_THRESHOLD = 3;
        isMovingForward = 0;
    end
    methods (Static)
        function moveForward(brick)
            % Both Left and Right Motors are moved in the forward direction
            % to move forward
            brick.MoveMotor(strcat(Config.LEFT_MOTOR, Config.RIGHT_MOTOR), Movements.DEFAULT_MOVEMENT_SPEED);
            % Logging the movement.
            fprintf('Moving Forward\n');
        end
        
        function moveBackward(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotor(strcat(Config.LEFT_MOTOR, Config.RIGHT_MOTOR), Movements.DEFAULT_MOVEMENT_SPEED * -1);
            % Logging the movement.
            fprintf('Moving Backward\n');
        end
        
        % Right Motor Functions
        
        function changeRightMotorSpeed(brick, newSpeed)
            % keeps track of current speed
            persistent speed;
            if isEmpty(speed)
                speed = Movements.DEFAULT_MOVEMENT_SPEED;
            end
            % if the change is greater than threshold change speed
            if abs(speed - newSpeed) > Movements.SPEED_CHANGE_THRESHOLD
                brick.MoveMotor(Config.RIGHT_MOTOR, newSpeed);
                speed = newSpeed;
            end
        end
        
        function turnLeft(brick)
            % Logging the movement.
            fprintf('Turning Left\n');
            % Stop all movement before turning
            stopMovement(brick);
            % Let the movement completely stop so pause
            pause(0.5);
            brick.MoveMotor(Config.RIGHT_MOTOR, Movements.DEFAULT_TURN_SPEED);
            pause(1.5);
            brick.StopMotor(Config.RIGHT_MOTOR, 'Brake');
            fprintf('Movement Complete\n');
        end
        
        % Left Motor Functions
        
        function changeLeftMotorSpeed(brick, newSpeed)
            % keeps track of current speed
            persistent speed;
            if isEmpty(speed)
                speed = Movements.DEFAULT_MOVEMENT_SPEED;
            end
            % if the change is greater than threshold change speed
            if abs(speed - newSpeed) > Movements.SPEED_CHANGE_THRESHOLD
                brick.MoveMotor(Config.LEFT_MOTOR, newSpeed);
                speed = newSpeed;
            end
        end
        
        function turnRight(brick)
            % Logging the movement.
            fprintf('Turning Left\n');
            % Stop all movement before turning
            stopMovement(brick);
            % Let the movement completely stop so pause
            pause(0.5);
            brick.MoveMotor(Config.RIGHT_MOTOR, Movements.DEFAULT_TURN_SPEED);
            pause(1.5);
            brick.StopMotor(Config.RIGHT_MOTOR, 'Brake');
            fprintf('Movement Complete\n');
        end
        
        function lift(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotorAngleRel(Config.LIFT_MOTOR, 1, Movements.LIFT_SPEED);
            % Logging the movement.
            fprintf('Lifting\n');
        end
        
        function drop(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotorAngleRel(Config.LIFT_MOTOR, 1, Movements.LIFT_SPEED * -1);
            % Logging the movement.
            fprintf('Lifting\n');
        end
        
        function stopMovement(brick)
            % Stopping Both Motors
            brick.StopAllMotors('Brake');
            % Logging the movement.
            fprintf('Stopping Motors\n');
        end
    end
end