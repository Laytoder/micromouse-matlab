qclassdef Movements
    properties (Constant = true)
        MOVEMENT_SENSITIVITY = 0.01;
    end
    methods (Static)
        function moveForward(brick)
            % Both Left and Right Motors are moved in the forward direction
            % to move forward
            brick.MoveMotor(Config.LEFT_MOTOR, 50);
            brick.MoveMotor(Config.RIGHT_MOTOR, 50);
            % Logging the movement.
            %fprintf('Moving Forward\n');
        end
        
        function moveBackward(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotor(Config.LEFT_MOTOR, -50);
            brick.MoveMotor(Config.RIGHT_MOTOR, -50);
            % Logging the movement.
            %fprintf('Moving Backward\n');
        end
        
        function moveLeft(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotor(Config.LEFT_MOTOR, -50);
            brick.MoveMotor(Config.RIGHT_MOTOR, 50);
            % Logging the movement.
            %fprintf('Turning Left\n');
        end
        
        function moveRight(brick)
            % Both Left and Right Motors are moved in the backward direction
            % to move backward
            brick.MoveMotor(Config.LEFT_MOTOR, 50);
            brick.MoveMotor(Config.RIGHT_MOTOR, -50);
            % Logging the movement.
            %fprintf('Turning Right\n');
        end
        
        function stopMovement(brick)
            % Stopping Both Motors
            brick.StopAllMotors();
            % Logging the movement.
            %fprintf('Stopping Motors\n');
        end
    end
end