classdef TestScripts
    methods (Static)
        % Front Wall Detection Test
        % Calibrate the WALL_DETECTION_ERROR_OFFSET here
        function frontWallDetectionTest(brick)
            while 1
                if Sensors.isFrontWall(brick) == 1
                    Movements.stopMovement(brick);
                    break;
                else
                    Movements.moveForward(brick);
                end
            end
        end
        
        % Left Turn Test
        % Calibrate the STOPPING_RELAXATION_TIME and TURN_RELAXATION_TIME
        % here
        function leftTurnTest(brick)
            Movements.turnLeft(brick);
        end
        
        % Left Turn While Navigation Test(Place the bot near any left turn)
        % Left-Hand Algorithm Sequence 1 Test
        % Calibrate PRE_TURN_RELAXATION_TIME here
        function leftTurnWhileNavigationTest(brick)
            while 1
                if Sensors.isLeftWall(brick) == 0
                    Movements.turnLeft(brick);
                    break;
                else
                    Movements.moveForward(brick);
                end
            end
        end
        
        % Right Turn Test
        % Re-calibrate above constants for errors
        function rightTurn(brick)
            Movements.turnRight(brick);
        end
        
        % Right Turn While Navigation Test(Place the bot near a right turn
        % such that there is a left and front wall)
        % Left-Hand Algorithm Sequence 2 Test
        % Re-calibrate above constants for errors
        function turnRightAfterWallDetection(brick)
            while 1
                if Sensors.isLeftWall(brick) == 0
                    Movements.turnLeft(brick);
                elseif Sensors.isFrontWall(brick) == 0
                    Movements.moveForward(brick);
                elseif Sensors.isRightWall(brick) == 0
                    Movements.turnRight(brick);
                    break;
                else
                    Movements.moveForward(brick);
                end
            end
        end
        
        % Back Turn Test
        % Calibrate BACK_TURN_RELAXATION_TIME here
        function turnBack(brick)
            Movements.turnBack(brick);
        end
        
        % Back Turn While Navigation Test(Place the bot near any dead end)
        % Left-Hand Algorithm Sequence 3 Test
        % Re-calibrate above constants for errors
        function turnBackOnDeadEnd(brick)
            while 1
                if Sensors.isLeftWall(brick) == 0
                    Movements.turnLeft(brick);
                elseif Sensors.isFrontWall(brick) == 0
                    Movements.moveForward(brick);
                elseif Sensors.isRightWall(brick) == 0
                    Movements.turnRight(brick);
                else
                    Movements.turnBack(brick);
                    break;
                end
            end
        end
        
        % Just check the behavior with colors using this script
        % Navigate the bot to the next color position by lifting
        function checkBehaviorBasedOnColors(brick)
            Movements.init();
            ColorHelper.init();
            while 1
                ColorHelper.handleMovementBasedOnColors(brick);
                Movements.moveForward(brick);
            end
        end
    end
end