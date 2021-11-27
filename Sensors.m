classdef Sensors
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
        end
        
        function dist = getFrontDist(brick)
            dist = brick.UltrasonicDist(Config.FRONT_ULTRASONIC);
        end
        
        function leftWall = isLeftWall(brick)
            leftWall = 0;
            leftDist = getLeftDist(brick); % in cm
            if(leftDist > 50)
                leftWall = 1;
            end
        end
        
        function rightWall = isRightWall(brick)
            rightWall = 0;
            rightDist = getRightDist(brick); % in cm
            if(rightDist > 50)
                rightWall = 1;
            end
        end
        
        function frontWall = isFrontWall(brick)
            frontWall = 0;
            frontDist = getFrontDist(brick); % in cm
            if(frontDist > 50)
                frontWall = 1;
            end
        end
    end
end