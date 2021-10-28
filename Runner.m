% Connect to EV3
%brick = Ev3Connectivity.connectToEv3(Config.BRICK_NAME);

% Keyboard Configuration

global key;
InitKeyboard();

while 1
    pause(Movements.MOVEMENT_SENSITIVITY);
    switch key
        case 'uparrow'
            Movements.moveForward(brick);
        case 'downarrow'
            Movements.moveBackward(brick);
        case 'leftarrow'
            Movements.moveLeft(brick);
        case 'rightarrow'
            Movements.moveRight(brick);
        case 'q'
            break;
        case 0
            Movements.stopMovement(brick);
    end
end

Ev3Connectivity.disconnectEv3(Config.BRICK_NAME)
CloseKeyboard();
