% Connect to EV3
%brick = Ev3Connectivity.connectToEv3(Config.BRICK_NAME);

%Movements.moveForward(brick);
%pause(5);
Movements.stopMovement(brick)
% Keyboard Configuration

%global key;
%InitKeyboard();

prevKey = 'stop';


while 1
    pause(Movements.MOVEMENT_SENSITIVITY);
    brick.SetColorMode(2, 2);
    color = brick.ColorCode(2);
    switch color
        case 5
            if strcmp(prevKey, 'stop') == 0
                Movements.stopMovement(brick);
                prevKey = 'stop';
            end
        case 4
            if strcmp(prevKey, 'stop') == 0
                Movements.stopMovement(brick);
                prevKey = 'stop';
            end
        case 3
            if strcmp(prevKey, 'stop') == 0
                Movements.stopMovement(brick);
                prevKey = 'stop';
            end
        case 2
            if strcmp(prevKey, 'stop') == 0
                Movements.stopMovement(brick);
                prevKey = 'stop';
            end
        case 0
            if strcmp(prevKey, 'forward') == 0
                Movements.moveForward(brick);
                prevKey = 'forward';
            end
    end
end


%Ev3Connectivity.disconnectEv3(Config.BRICK_NAME)
%CloseKeyboard();
