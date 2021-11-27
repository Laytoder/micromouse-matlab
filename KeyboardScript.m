% Connect to EV3
%brick = Ev3Connectivity.connectToEv3(Config.BRICK_NAME);

%Movements.moveForward(brick);
%pause(5);
%Movements.stopMovement(brick)
% Keyboard Configuration

global key;
InitKeyboard();

prevKey = 'stop';


while 1
    pause(Movements.MOVEMENT_SENSITIVITY);
    switch key
        case 'uparrow'
            if strcmp(prevKey, 'uparrow') == 0
                Movements.moveForward(brick);
                prevKey = 'uparrow';
            end
        case 'downarrow'
            if strcmp(prevKey, 'downarrow') == 0
                Movements.moveBackward(brick);
                prevKey = 'downarrow';
            end
        case 'leftarrow'
            if strcmp(prevKey, 'leftarrow') == 0
                Movements.moveLeft(brick);
                prevKey = 'leftarrow';
            end
        case 'rightarrow'
            if strcmp(prevKey, 'rightarrow') == 0
                Movements.moveRight(brick);
                prevKey = 'rightarrow';
            end
        case 'l'
            if strcmp(prevKey, 'lift') == 0
                Movements.lift(brick);
                prevKey = 'lift';
            end
        case 'q'
            break;
        case 0
            if strcmp(prevKey, 'stop') == 0
                Movements.stopMovement(brick);
                prevKey = 'stop';
            end
    end
end


Ev3Connectivity.disconnectEv3(Config.BRICK_NAME)
CloseKeyboard();
