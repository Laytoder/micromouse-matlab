classdef Sensors
    properties (Constant = true)
        % in centimeters(cm)
        CELL_WIDTH = 58;
        BOT_WIDTH = 15;
        % To be measured
        FRONT_ULTRASONIC_WHEEL_OFFSET = 1;
        WALL_DETECTION_ERROR_OFFSET = 19;
        LEFT_RIGHT_WALL_DETECTION_ERROR_OFFSET = 2;
    end
    methods (Static)
        function color = getColor(brick)
            brick.SetColorMode(2, 2);
            color = brick.ColorCode(Config.LIGHT_SENSOR);
        end
        
        function dist = getLeftDist(brick)
            dist = brick.UltrasonicDist(Config.LEFT_ULTRASONIC);
        end
        
        function dist = getRightDist(brick)
            dist = brick.UltrasonicDist(Config.RIGHT_ULTRASONIC);
            disp(dist);
        end
        
        function dist = getFrontDist(brick)
            dist = brick.UltrasonicDist(Config.FRONT_ULTRASONIC);
        end
        
        function leftWall = isLeftWall(brick)
            LEFT_RIGHT_WALL_DETECTION_OFFSET = ((Sensors.CELL_WIDTH - Sensors.BOT_WIDTH) / 2) + Sensors.LEFT_RIGHT_WALL_DETECTION_ERROR_OFFSET;
            leftWall = 1;
            leftDist = Sensors.getLeftDist(brick); % in cm
            if(leftDist > LEFT_RIGHT_WALL_DETECTION_OFFSET)
                leftWall = 0;
            end
        end
        
        function rightWall = isRightWall(brick)
            LEFT_RIGHT_WALL_DETECTION_OFFSET = ((Sensors.CELL_WIDTH - Sensors.BOT_WIDTH) / 2) + Sensors.LEFT_RIGHT_WALL_DETECTION_ERROR_OFFSET;
            rightWall = 1;
            rightDist = Sensors.getRightDist(brick); % in cm
            if(rightDist > LEFT_RIGHT_WALL_DETECTION_OFFSET)
                rightWall = 0;
            end
        end
        
        function frontWall = isFrontWall(brick)
            FRONT_WALL_DETECTION_OFFSET = ((Sensors.CELL_WIDTH + Sensors.BOT_WIDTH) / 2 - Sensors.FRONT_ULTRASONIC_WHEEL_OFFSET) + Sensors.WALL_DETECTION_ERROR_OFFSET;
            frontWall = 0;
            frontDist = Sensors.getFrontDist(brick); % in cm
            if frontDist <= FRONT_WALL_DETECTION_OFFSET
                frontWall = 1;
            end
        end
    end
end