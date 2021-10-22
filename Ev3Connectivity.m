classdef Ev3Connectivity
    methods
        function brick = connectToEv3(brickName)
            brick = ConnectBrick(brickName); % Connecting to the brick
            brick.playTone(100, 800, 500); % Playing a tone to ensure connection
            % Logging the Successful Connection notification.
            fprintf('Connection to EV3 Brick %s successfull!\n', brickName);
            % Logging the Current Battery Voltage
            fprintf('Current Battery Voltage: %s', brick.getBattVoltage());
        end
        
        function isDisconnected = disconnectEv3(brickName)
            DisconnectBrick(brickName);
            % Logging the Successfully Disconnecting notification.
            fprintf('Successfully disconnected from %s EV3 brick', brickName);
            % Setting the disconnected flag as true
            isDisconnected = true;
        end
    end
end