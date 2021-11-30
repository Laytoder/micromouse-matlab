classdef Movements
    properties (Constant = true)
        MOVEMENT_SENSITIVITY = 0.1; % in seconds
        DEFAULT_MOVEMENT_SPEED = 50;
        DEFAULT_TURN_SPEED = 25;
        LIFT_SPEED = 20;
        SPEED_CHANGE_THRESHOLD = 3;
        STOPPING_RELAXATION_TIME = 0.5; % in seconds
        TURN_RELAXATION_TIME = 1.8; % in seconds
        BACK_TURN_RELAXATION_TIME = 1.5; % in seconds
        % Only used for left turns because they can occur without the
        % detection of a front wall
        PRE_TURN_RELAXATION_TIME = 0.2; % in seconds
    end
    methods (Static)
        function init()
            global prevMotion;
            global leftMotorSpeed;
            global rightMotorSpeed;
            prevMotion = 'stop';
            leftMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
            rightMotorSpeed = Movements.DEFAULT_MOVEMENT_SPEED;
        end
        
        function moveForward(brick)
            global prevMotion;
            if strcm(prevMotion, 'forward') == 0
                % Both Left and Right Motors are moved in the forward direction
                % to move forward
                brick.MoveMotor(strcat(Config.LEFT_MOTOR, Config.RIGHT_MOTOR), Movements.DEFAULT_MOVEMENT_SPEED);
                % Logging the movement.
                fprintf('Moving Forward\n');
                prevMotion = 'forward';
            end
        end
        
        function moveBackward(brick)
            global prevMotion;
            if strcm(prevMotion, 'backward') == 0
                % Both Left and Right Motors are moved in the backward direction
                % to move backward
                brick.MoveMotor(strcat(Config.LEFT_MOTOR, Config.RIGHT_MOTOR), Movements.DEFAULT_MOVEMENT_SPEED * -1);
                % Logging the movement.
                fprintf('Moving Backward\n');
                prevMotion = 'backward';
            end
        end
        
        % Right Motor Functions
        
        function changeRightMotorSpeed(brick, newSpeed)
            % keeps track of current speed
            global rightMotorSpeed;
            % if the change is greater than threshold change speed
            if abs(rightMotorSpeed - newSpeed) > Movements.SPEED_CHANGE_THRESHOLD
                brick.MoveMotor(Config.RIGHT_MOTOR, newSpeed);
                rightMotorSpeed = newSpeed;
            end
        end
        
        function turnLeft(brick)
            global prevMotion;
            if strcm(prevMotion, 'leftTurn') == 0
                % Logging the movement.
                fprintf('Turning Left\n');
                % Only used for left turns because left turns can be detected
                % without front wall, waits till the bot comes at the correct
                % turning point
                pause(Movements.PRE_TURN_RELAXATION_TIME);
                % Stop all movement before turning
                Movements.stopMovement(brick);
                brick.MoveMotor(Config.RIGHT_MOTOR, Movements.DEFAULT_TURN_SPEED);
                pause(Movements.TURN_RELAXATION_TIME);
                brick.StopMotor(Config.RIGHT_MOTOR, 'Brake');
                % Let the movement completely stop so pause
                pause(Movements.STOPPING_RELAXATION_TIME);
                fprintf('Movement Complete\n');
                prevMotion = 'leftTurn';
            end
        end
        
        % Left Motor Functions
        
        function changeLeftMotorSpeed(brick, newSpeed)
            % keeps track of current speed
            global leftMotorSpeed;
            % if the change is greater than threshold change speed
            if abs(leftMotorSpeed - newSpeed) > Movements.SPEED_CHANGE_THRESHOLD
                brick.MoveMotor(Config.LEFT_MOTOR, newSpeed);
                leftMotorSpeed = newSpeed;
            end
        end
        
        function turnRight(brick)
            global prevMotion;
            if strcm(prevMotion, 'rightTurn') == 0
                % Logging the movement.
                fprintf('Turning Right\n');
                % Stop all movement before turning
                Movements.stopMovement(brick);
                brick.MoveMotor(Config.LEFT_MOTOR, Movements.DEFAULT_TURN_SPEED);
                pause(Movements.TURN_RELAXATION_TIME);
                brick.StopMotor(Config.LEFT_MOTOR, 'Brake');
                % Let the movement completely stop so pause
                pause(Movements.STOPPING_RELAXATION_TIME);
                fprintf('Movement Complete\n');
                prevMotion = 'rightTurn';
            end
        end
        
        % Both Motor Functions
        
        function turnBack(brick)
            global prevMotion;
            if strcm(prevMotion, 'backTurn') == 0
                % Logging the movement.
                fprintf('Turning Back\n');
                % Stop all movement before turning
                stopMovement(brick);
                brick.MoveMotor(Config.LEFT_MOTOR, Movements.DEFAULT_TURN_SPEED);
                brick.MoveMotor(Config.RIGHT_MOTOR, Movements.DEFAULT_TURN_SPEED * -1);
                pause(Movements.BACK_TURN_RELAXATION_TIME);
                stopMovement(brick);
                fprintf('Movement Complete\n');
                prevMotion = 'backTurn';
            end
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
            global prevMotion;
            if strcm(prevMotion, 'stop') == 0
                % Logging the movement.
                fprintf('Stopping Motors\n');
                % Stopping Both Wheel Motors
                brick.StopMotor(strcat(Config.LEFT_MOTOR, Config.RIGHT_MOTOR), 'Brake');
                %brick.StopAllMotors();
                % Let the movement completely stop so pause
                pause(Movements.STOPPING_RELAXATION_TIME);
                prevMotion = 'stop';
            end
        end
    end
end